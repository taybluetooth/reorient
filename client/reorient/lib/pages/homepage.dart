import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDDDDD),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SizedBox(
              width: 170,
              child: Text(
                "Activities that are just for you.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
