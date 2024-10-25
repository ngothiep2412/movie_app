import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/detail/detail_imports.dart';
import 'package:movie_app/presentation/screens/general/general_imports.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialROute(const General());

      case '/movie-detail':
        final slugName = settings.arguments as String;
        return _materialROute(
          DetailScreen(
            slugName: slugName,
          ),
        );

      default:
        return _materialROute(const General());
    }
  }

  static Route<dynamic> _materialROute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
