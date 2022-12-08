import 'package:akmal_mobile/app/configs/constant.dart';
import 'package:akmal_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/button.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.1),
          Text(
            'Pengeshan OTP',
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(
            'Sila masukkan kod pengesahan',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Text(
              'Masukkan 6 digit kod pengesahan yang telah dihantar ke',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            Get.arguments ?? '',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: PinCodeTextField(
              appContext: context,
              useHapticFeedback: true,
              length: 6,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              // validator: controller.otpValidator,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              // errorAnimationController: errorController,
              // controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: controller.onOtpChanged,
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                inactiveColor: Colors.grey[350],
                inactiveFillColor: Colors.transparent,
                activeFillColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.primary,
                selectedFillColor: Colors.transparent,
                selectedColor: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(borderRadius),
                borderWidth: 2,
                fieldWidth: 37,
                fieldHeight: 37,
              ),
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum mendapat kod lagi?'),
                TextButton(
                  onPressed: controller.resentOtp,
                  child: const Text('Hantar semula kod'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ButtonWidget(
            label: 'Hantar',
            onPressed: controller.sendOtp,
          ),
        ],
      ),
    );
  }
}
