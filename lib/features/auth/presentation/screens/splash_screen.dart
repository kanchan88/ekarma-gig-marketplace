import 'dart:async';
import 'package:ekarma/configs/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ekarma/core/routes/paths.dart' as paths;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  FutureOr<void> _redirect() async {

    Future.delayed(const Duration(seconds: 1), () async {
      context.go(paths.onBoarding);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Image.asset(
              AppAssets.appLogo, // Replace with your image path
              fit: BoxFit.contain,
            ),
          ),

        ],
      ),
    );
  }
}
