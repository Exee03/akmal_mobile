import 'package:akmal_mobile/app/modules/auth/widgets/form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/altenative_login.dart';
import '../widgets/button.dart';
import '../widgets/divider.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.1),
          SizedBox.square(
            dimension: 180,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(height: 32),
          Text(
            'AKMAL Mobile',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Log masuk untuk terus menggunakan aplikasi',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 45),
          const FormWidget(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: InkWell(
              onTap: () {},
              child: const Text('Lupa Kata Laluan?'),
            ),
          ),
          const SizedBox(height: 45),
          ButtonWidget(
            label: 'Log Masuk',
            onPressed: controller.onSubmit,
          ),
          const SizedBox(height: 24),
          const DividerWidget(),
          const SizedBox(height: 24),
          const AltenativeLoginWidget(),
          SizedBox(height: screenHeight * 0.1),
        ],
      ),
    );
  }
}
