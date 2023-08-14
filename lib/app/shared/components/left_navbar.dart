// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_assets_style.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';
import 'package:pay7test/app/shared/components/icon_navbar.dart';
import 'package:pay7test/app/router/routes.dart';

class LeftNavbar extends StatefulWidget {
  const LeftNavbar({Key? key}) : super(key: key);

  @override
  State<LeftNavbar> createState() => _LeftNavbarState();
}

class _LeftNavbarState extends State<LeftNavbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: 80,
      height: size.height,
      padding: const EdgeInsets.symmetric(
        vertical: Spacements.XL,
        horizontal: Spacements.XS,
      ),
      decoration: const BoxDecoration(
        color: AppColors.light,
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.logo,
          ),
          const SizedBox(height: Spacements.L),
          const Divider(
            color: AppColors.darkGray,
            thickness: 0.5,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Endereço',
            icon: Icons.map_outlined,
            route: Routes.initial,
            active: true,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Home',
            icon: Icons.home_outlined,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Dashboard',
            icon: Icons.dashboard_outlined,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Carteira',
            icon: Icons.account_balance_wallet_outlined,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Balanço',
            icon: Icons.bar_chart_outlined,
          ),
          const Spacer(),
          const IconNavbar(
            title: 'Configurações',
            icon: Icons.settings,
          ),
          const SizedBox(height: Spacements.S),
          const Divider(
            color: AppColors.darkGray,
            thickness: 0.5,
          ),
          const SizedBox(height: Spacements.S),
          const IconNavbar(
            title: 'Sair',
            icon: Icons.logout,
            color: AppColors.error,
            isExit: true,
          ),
        ],
      ),
    );
  }
}
