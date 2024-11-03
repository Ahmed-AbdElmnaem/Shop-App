import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tahadoapp/ui/layout/layout_screen.dart';
import 'package:tahadoapp/ui/onboarding/onboreng.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // الانتقال بعد 5 ثواني
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network(
              'https://cliply.co/wp-content/uploads/2019/09/371907580_SPECIAL_GIFT_400px.gif')),
    );
  }
}
