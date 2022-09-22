import 'package:flutter/material.dart';

import '../pages/bottom_nav_bar/bottom_bar_view.dart';
import '../pages/login/view/login_view.dart';
import '../pages/onboarding/view/onboarding_view.dart';
import '../pages/register/view/register_view.dart';
import '../pages/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String bottomBarRoute = "/bottomBar";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPageView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.bottomBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomBarView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("Not Found"),
              ),
              body: const Center(
                  child: Text(
                "Not Found",
              )),
            ));
  }
}
