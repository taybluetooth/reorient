import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/pages/account_page.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/themes/colors.dart';

class ReorientAppBar extends StatefulWidget {
  const ReorientAppBar({Key? key}) : super(key: key);

  @override
  State<ReorientAppBar> createState() => _ReorientAppBarState();
}

class _ReorientAppBarState extends State<ReorientAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      decoration: const BoxDecoration(
        color: ReorientColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => {
              Get.to(
                () => const MainPage(),
              ),
            },
            icon: const Icon(
              Icons.home,
              color: ReorientColors.yellow,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.search,
              color: ReorientColors.yellow,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(
              () => const AccountPage(),
            ),
            icon: const Icon(
              Icons.account_circle_rounded,
              color: ReorientColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
