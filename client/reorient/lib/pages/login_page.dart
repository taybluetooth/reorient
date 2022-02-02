import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainPage(
              user: user,
            ),
          ),
        );
      }
      return firebaseApp;
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: ReorientColors.white,
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                          width: 75,
                          child: Text(
                            "Sign in",
                            style: ReorientTextStyles.headerText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Sign in and start personalising your activities.",
                            style: ReorientTextStyles.subHeaderText,
                          ),
                        ),
                      ),
                    ),
                    LoginForm()
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
