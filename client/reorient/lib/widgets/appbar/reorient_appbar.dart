import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';

class ReorientAppBar extends StatefulWidget {
  ReorientAppBar({Key? key}) : super(key: key);

  @override
  State<ReorientAppBar> createState() => _ReorientAppBarState();
}

class _ReorientAppBarState extends State<ReorientAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      decoration: const BoxDecoration(
        color: ReorientColors.white,
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
            onPressed: () => {},
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }
}
