// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class SearchInputBar extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;

  const SearchInputBar({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: SearchBar(
        onChanged: onChanged,
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: Spacements.S,
            vertical: Spacements.XS,
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(AppColors.lightGray),
        elevation: const MaterialStatePropertyAll(0),
        textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.black,
              ),
        ),
        hintText: hintText,
        hintStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.darkGray,
              ),
        ),
        leading: const Icon(
          Icons.search,
          color: AppColors.darkGray,
        ),
      ),
    );

    // Container(
    //   height: 46,
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: Spacements.S,
    //     vertical: Spacements.XS,
    //   ),
    //   decoration: const BoxDecoration(
    //     color: AppColors.lightGray,
    //     borderRadius: BorderRadius.all(Radius.circular(40)),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const Icon(
    //         Icons.search_rounded,
    //         color: AppColors.darkGray,
    //       ),
    //       Expanded(
    //         child: TextFormField(
    //           onChanged: (value) {},
    //           decoration: const InputDecoration(
    //             hintText: "Busque qualquer coisa",
    //             border: InputBorder.none,
    //             errorBorder: InputBorder.none,
    //             enabledBorder: InputBorder.none,
    //             focusedBorder: InputBorder.none,
    //             disabledBorder: InputBorder.none,
    //             focusedErrorBorder: InputBorder.none,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
