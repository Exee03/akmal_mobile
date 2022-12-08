import 'package:flutter/material.dart';

import '../../../configs/constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: SizedBox(
        height: heightButton,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.white,
                  fontSize:
                      (Theme.of(context).textTheme.button?.fontSize ?? 0) + 2,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
