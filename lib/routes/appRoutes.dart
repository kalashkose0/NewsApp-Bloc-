import 'package:flutter/material.dart';
import 'package:newsapp/Screens/bottomNavigationBar.dart';
import 'package:newsapp/Screens/homePage.dart';
import 'package:newsapp/Screens/onbordingScreen.dart';
import 'package:newsapp/splash/splashScreen.dart';

class AppRoutes {
  static const String routeSplash = '/';
  static const String routeHome = '/home';
  static const String routeDetails = '/details';
  static const String routeOnboarding = '/onboarding';
  static const String routeBottamNavigation = '/bottamNavigation';

  static Map<String, WidgetBuilder> getRoutes() => {
        routeSplash: (context) => SplashScreen(),
        routeHome: (context) => HomePage(),
        // routeDetails: (context) => NewsDetailScreen(),
        routeOnboarding: (context) => OnboardingScreen(),
        routeBottamNavigation: (context) => BottomNavigationScreen(),
      };
}
