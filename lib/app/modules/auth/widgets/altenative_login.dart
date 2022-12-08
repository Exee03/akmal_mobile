import 'package:akmal_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../configs/constant.dart';
import '../views/phone_view.dart';

class AltenativeLoginWidget extends GetView<AuthController> {
  const AltenativeLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 50,
          child: OutlinedButton(
            onPressed: () => Get.to(const PhoneView()),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const FaIcon(FontAwesomeIcons.phone),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox.square(
          dimension: 50,
          child: OutlinedButton(
            onPressed: controller.signInGoogle,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              side: BorderSide(
                color: HexColor('D44235'),
              ),
              foregroundColor: HexColor('D44235'),
            ),
            child: const FaIcon(FontAwesomeIcons.google),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox.square(
          dimension: 50,
          child: OutlinedButton(
            onPressed: controller.signInFacebook,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              side: BorderSide(
                color: HexColor('1674EA'),
              ),
              foregroundColor: HexColor('1674EA'),
            ),
            child: const FaIcon(FontAwesomeIcons.facebookF),
          ),
        ),
      ],
    );
  }
}
