import 'package:flutter/material.dart';
import 'package:newsapp/Screens/bottomNavigation/bottomNavigationBar.dart';
import 'package:newsapp/Screens/homeScreen/homePage.dart';
import 'package:newsapp/Screens/OnBoardingScreen/onbordingScreen.dart';
import 'package:newsapp/splash/splashScreen.dart';

class AppRoutes {
  static const String routeSplash = '/';
  static const String routeHome = '/home';
  static const String routeDetails = '/details';
  static const String routeOnboarding = '/onboarding';
  static const String routeBottamNavigation = '/bottamNavigation';

  static Map<String, WidgetBuilder> getRoutes() => {
        routeSplash: (context) => SplashScreen(),
        routeHome: (context) => Homepage(),
        // routeDetails: (context) => NewsDetailScreen(),
        routeOnboarding: (context) => OnboardingScreen(),
        routeBottamNavigation: (context) => BottomNavigationScreen(),
      };
}
