import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/pages/activity_choice_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/themes/gradients.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/misc/reorient_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ReorientAppBar(),
      backgroundColor: ReorientColors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                width: 180,
                height: 120,
                image: AssetImage("assets/logo.PNG"),
              ),
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset(
                "assets/cycling.svg",
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.docs[0]['displayName'] +
                            ", let's pick you some activities.",
                        style: ReorientTextStyles.subHeaderText,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: ReorientButton(
                  child: Text(
                    "Get Started",
                    style: ReorientTextStyles.buttonText,
                  ),
                  color: ReorientColors.yellow,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActivityChoicePage(),
                      ),
                    )
                  },
                  width: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
