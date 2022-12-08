import 'package:akmal_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../configs/constant.dart';

class FormWidget extends GetView<AuthController> {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "No. Kad Pengenalan",
                fillColor: Colors.white70,
                prefixIcon: const Icon(Icons.person),
              ),
              onChanged: controller.onIcChanged,
              validator: controller.emailValidator,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: SizedBox(
              height: heightButton,
              child: Obx(
                () => TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isHidePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Kata Laluan",
                    fillColor: Colors.white70,
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: controller.toggleShowPassword,
                      icon: const Icon(Icons.visibility_off),
                    ),
                  ),
                  onChanged: controller.onPasswordChanged,
                  validator: controller.passwordValidator,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
