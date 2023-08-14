// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String?) onChanged;
  final String? hintText;
  final double width;

  const CustomTextFormField({
    Key? key,
    required this.onChanged,
    this.hintText,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.darkGray,
              ),
          contentPadding: const EdgeInsets.all(Spacements.XS),
          filled: true,
          fillColor: AppColors.lightGray,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.5,
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.5,
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
