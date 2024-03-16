import 'dart:async';

import 'package:flutter/material.dart';
import 'package:verified_devnet/starter/askmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AskMenu();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("assets/images/name.png"),
          ),
          const Spacer(),
          Image.asset(
            "assets/images/splashimage.png",
          ),
        ],
      ),
    );
  }
}
