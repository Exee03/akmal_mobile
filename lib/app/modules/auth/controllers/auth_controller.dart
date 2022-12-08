import 'dart:async';

import 'package:akmal_mobile/app/modules/auth/models/auth_model.dart';
import 'package:akmal_mobile/app/modules/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../user/providers/user_provider.dart';
import '../views/otp_view.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final _authProvider = Get.find<AuthProvider>();
  final _userProvider = Get.find<UserProvider>();
  final formKey = GlobalKey<FormState>();
  final auth = Rx<Auth>(Auth());
  final _passwordVisibleState = false.obs;
  final _code = "".obs;
  StreamSubscription? subscription;

  bool get isHidePassword => _passwordVisibleState.isFalse;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
  }

  void increment() => count.value++;

  void checkAuth() {
    subscription?.cancel();
    subscription = _authProvider.getAuthState().listen(
      (isLoggin) async {
        if (isLoggin) {
          await _userProvider.getFcmToken();
          await _userProvider.getMessage();
          Get.offAllNamed(Routes.HOME);
        } else {
          if (Get.currentRoute == Routes.AUTH) return;
          Get.offAllNamed(Routes.AUTH);
        }
      },
    );
  }

  void onIcChanged(String value) {
    auth.value.email = value;
  }

  void onPasswordChanged(String value) {
    auth.value.password = value;
  }

  void onPhoneChanged(String value) {
    auth.value.phone = value;
  }

  void onOtpChanged(String value) {
    _code.value = value;
  }

  String? emailValidator(String? value) {
    if (value == null) return 'Email is required';
    if (value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Email not valid';
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null) return 'Password is required';
    if (value.isEmpty) return 'Password is required';
    if (GetUtils.isLengthLessThan(value, 6)) {
      return 'Password must more than 6 character';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null) return 'Phone is required';
    if (value.isEmpty) return 'Phone is required';
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Phone not valid';
    }
    return null;
  }

  void toggleShowPassword() {
    _passwordVisibleState.value = !_passwordVisibleState.value;
  }

  Future<void> onSubmit() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null) return;
    if (!isValid) return;

    try {
      // print(user.value.toJson());
      await _authProvider.login(auth.value);
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void signInGoogle() {
    try {
      _authProvider.signInWithGoogle();
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void signInFacebook() {
    try {
      _authProvider.signInWithFacebook();
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  Future<void> signInPhone() async {
    try {
      _authProvider.signInWithPhone(
        auth.value,
        onReceiveCode: () async => await Get.to(
          () => const OtpView(),
          arguments: auth.value.phone,
        ),
        onTimeout: () {
          Get.snackbar('Unable to login', 'OTP timeout');
        },
      );
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void sendOtp() {
    Get.back(result: _code.value);
  }

  Future<void> resentOtp() async {
    try {
      _authProvider.signInWithPhone(
        Get.arguments ?? '',
        onReceiveCode: () async => await Get.to(
          () => const OtpView(),
          arguments: auth.value.phone,
        ),
        onTimeout: () {
          Get.snackbar('Unable to login', 'OTP timeout');
        },
      );
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }
}
