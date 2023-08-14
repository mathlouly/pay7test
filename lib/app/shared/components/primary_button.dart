// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacements.L,
          vertical: Spacements.M,
        ),
        backgroundColor: bgColor ?? AppColors.tertiary,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: textColor ?? AppColors.light,
            ),
      ),
    );
  }
}
