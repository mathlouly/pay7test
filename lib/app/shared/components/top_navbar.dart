import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';
import 'package:pay7test/app/shared/components/icon_notification.dart';
import 'package:pay7test/app/shared/components/profile_widget.dart';
import 'package:pay7test/app/shared/components/search_input_bar.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWeb = constraints.maxWidth > 768;

        return Container(
          width: constraints.maxWidth,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Endereço',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(width: Spacements.XL),
              if (isWeb) ...[
                const Expanded(
                  child: SearchInputBar(
                    hintText: 'Busque qualquer coisa',
                  ),
                ),
                const SizedBox(width: Spacements.XL),
                IconNotification(
                  icon: Icons.email_outlined,
                  onTap: () {},
                ),
                const SizedBox(width: Spacements.S),
                IconNotification(
                  icon: Icons.notifications_outlined,
                  onTap: () {},
                ),
                const SizedBox(width: Spacements.M),
                const ProfileWidget()
              ],
            ],
          ),
        );
      },
    );
  }
}
