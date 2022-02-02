/*import 'package:flutter/material.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/themes/Gradients.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/gradient_border.dart';
import 'package:reorient/widgets/gradient_icon_button.dart';
import 'package:reorient/widgets/reorient_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
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
                )),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(height: 45.0),
                    GradientBorder(
                      child: ReorientTextField(
                          hint: "johndoe@gmail.com", label: "Email"),
                    ),
                    SizedBox(height: 25.0),
                    GradientBorder(
                      child: ReorientTextField(
                          hint: "●●●●●●●●●●", label: "Password"),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GradientIconButton(
                  gradient: ReorientGradients.mainGradient,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    ),
                  },
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: ReorientColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
