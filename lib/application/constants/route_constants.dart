import 'package:flutter/material.dart';

class RouteConstants {
  factory RouteConstants() {
    return _singleton;
  }

  RouteConstants._internal();

  static final RouteConstants _singleton = RouteConstants._internal();
  static const homeRoute = "/home";

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? "");

    switch (uri.path) {
      //case "/":
      //  return MaterialPageRoute(
      //    settings: settings,
      //    builder: (context) => const HomePage(),
      //  );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
