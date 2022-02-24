import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';

class ActivityCard extends StatefulWidget {
  final String name;
  Color color;

  ActivityCard({
    Key? key,
    required this.name,
    this.color = ReorientColors.yellow,
  }) : super(key: key);

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: ReorientColors.black, width: 2)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/${widget.name}.svg',
              width: 100,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              (widget.name).split("_").join(" "),
              style: ReorientTextStyles.buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
