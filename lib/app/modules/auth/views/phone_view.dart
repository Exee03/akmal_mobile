import 'package:akmal_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/constant.dart';
import '../widgets/button.dart';

class PhoneView extends GetView<AuthController> {
  const PhoneView({Key? key}) : super(key: key);
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
            'Log Masuk',
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(
            'Sila masukkan No Telefon',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Anda akan menerima 6 digit kod untuk nombor pengeshan',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: SizedBox(
              height: heightButton,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Phone",
                  fillColor: Colors.white70,
                  prefixIcon: const Icon(Icons.phone),
                ),
                onChanged: controller.onPhoneChanged,
                validator: controller.phoneValidator,
              ),
            ),
          ),
          const SizedBox(height: 100),
          ButtonWidget(
            label: 'Hantar',
            onPressed: controller.signInPhone,
          ),
        ],
      ),
    );
  }
}
