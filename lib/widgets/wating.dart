import 'package:flutter/material.dart';

class Wating extends StatelessWidget {
  const Wating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wating_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("Wating"),
    );
  }
}
