// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/styles/app_color_style.dart';

class IconNavbar extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? route;
  final Color? color;
  final Color? bgColor;
  final bool active;
  final bool isExit;

  const IconNavbar({
    Key? key,
    required this.title,
    required this.icon,
    this.route,
    this.color,
    this.bgColor,
    this.active = false,
    this.isExit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      child: SizedBox(
        width: double.maxFinite,
        height: 40,
        child: Material(
          color: active ? bgColor ?? AppColors.secondary.withOpacity(0.05) : AppColors.light,
          child: InkWell(
            onTap: () {
              if (route != null) Navigator.pushReplacementNamed(context, route!);
            },
            hoverColor: isExit ? AppColors.error.withOpacity(0.05) : AppColors.secondary.withOpacity(0.05),
            child: Icon(
              icon,
              color: active ? color ?? AppColors.secondary : color ?? AppColors.darkGray,
            ),
          ),
        ),
      ),
    );
  }
}
