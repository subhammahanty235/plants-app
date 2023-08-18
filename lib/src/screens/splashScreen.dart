import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantdirectory/src/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: BGgreen),
        alignment: Alignment.center,
        // height:
        child: Image.asset(
          'assets/images/img-1-green.png',
          height: 100,
        ),
      ),
    );
  }
}
