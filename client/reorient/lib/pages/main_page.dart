import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/themes/gradients.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/gradient_widgets/gradient_button.dart';

class MainPage extends StatefulWidget {
  final User user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReorientAppBar(),
      backgroundColor: ReorientColors.grey,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style: ReorientTextStyles.headerText,
                    ),
                    Text(
                      snapshot.data!.docs[0]['displayName'] + "👋",
                      style: ReorientTextStyles.headerText,
                    ),
                    const Text("Let's pick you some activities.",
                        style: ReorientTextStyles.subHeaderText)
                  ],
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SvgPicture.asset("assets/robot.svg"),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: GradientButton(
                child: const Text(
                  "Get Started",
                  style: ReorientTextStyles.buttonText,
                ),
                gradient: ReorientGradients.mainGradient,
                onPressed: () {},
                width: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
