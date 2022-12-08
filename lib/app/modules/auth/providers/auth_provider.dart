import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/auth_model.dart';

class AuthProvider extends GetConnect {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {}

  Stream<bool> getAuthState() {
    return auth.authStateChanges().map((event) => event != null);
  }

  Future<void> login(Auth value) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: value.email!,
        password: value.password!,
      );
      log(credential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    GoogleSignIn().signOut();

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) throw Exception('Unable to get token');
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(token);

    FacebookAuth.instance.logOut();

    // Once signed in, return the UserCredential
    return auth.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithPhone(
    Auth value, {
    required Future<String> Function() onReceiveCode,
    required void Function() onTimeout,
  }) async {
    print('sign in phone ${value.toJson()}');
    await auth.verifyPhoneNumber(
      phoneNumber: value.phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // print('The provided phone number is not valid.');
          throw Exception('The provided phone number is not valid.');
        }

        // Handle other errors
        throw Exception('Unable get OTP');
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        // String smsCode = 'xxxx';

        final code = await onReceiveCode.call();
        print('code send $code');

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: code,
        );

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        onTimeout.call();
      },
    );
  }
}
