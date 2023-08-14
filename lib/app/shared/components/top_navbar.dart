import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      padding: const EdgeInsets.symmetric(
        vertical: Spacements.XS,
        horizontal: Spacements.L,
      ),
      decoration: const BoxDecoration(
        color: AppColors.light,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Endereço',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
