import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class CustomDropdown extends StatelessWidget {
  final String? title;
  final Function(dynamic) onChanged;
  final List<CustomDropdownItem>? items;
  final double width;
  final dynamic value;
  final String? hintText;

  const CustomDropdown({
    Key? key,
    this.title,
    required this.onChanged,
    this.items,
    required this.width,
    required this.value,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          DropdownButtonFormField(
            value: value,
            onChanged: onChanged,
            isExpanded: true,
            hint: hintText != null
                ? Text(
                    hintText!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : null,
            items: items
                ?.map(
                  (e) => DropdownMenuItem(
                    value: e.value,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.text,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ),
                )
                .toList(),
            decoration: InputDecoration(
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
        ],
      ),
    );
  }
}

class CustomDropdownItem {
  String text;
  dynamic value;

  CustomDropdownItem({
    required this.text,
    required this.value,
  });
}
