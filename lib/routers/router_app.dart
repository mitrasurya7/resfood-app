import 'package:flutter/material.dart';
import 'package:resfood_app/models/food_model.dart';
import 'package:resfood_app/screens/detail_food_screen.dart';
import 'package:resfood_app/screens/home_screen.dart';
import 'package:resfood_app/screens/login_screen.dart';
import 'package:resfood_app/screens/splash_screen.dart';

class RouterApp {
  static const String home = '/home';
  static const String detail = '/detail';
  static const String login = '/login';
  static const String register = '/register';
  static const String splash = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case detail:
        return MaterialPageRoute(
            builder: (context) =>
                DetailFoodScreen(food: settings.arguments as FoodModel));
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
