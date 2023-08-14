import 'package:flutter/material.dart';
import 'package:pay7test/app/shared/components/left_navbar.dart';
import 'package:pay7test/app/shared/components/top_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          LeftNavbar(),
          Expanded(
            child: Column(
              children: [
                TopNavbar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
