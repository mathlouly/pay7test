import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/constants/spacements.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/53306408?v=4'),
            ),
            const SizedBox(width: Spacements.XXS),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matheus Louly',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'mathlouly@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
