import 'package:flutter/material.dart';
import 'package:newsapp/routes/appRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.routeOnboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
          Container(
            color: Colors.white,
          ),
          Center(
            child: Image.asset(
              'assets/images/text.png',
              height: 200,
              width: 200,
            ),
          ),
        ]),
      ),
    );
  }
}
