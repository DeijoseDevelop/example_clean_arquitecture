import 'package:flutter/material.dart';
import 'package:photos_fake/src/controllers/controllers.dart';
import 'package:photos_fake/src/ui/pages/pages.dart';
import 'package:photos_fake/src/ui/routes/names.dart';

class CustomRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RoutesNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case RoutesNames.imageDetail:
        return MaterialPageRoute(builder: (_) => ImageDetailPage(photo: ListGalleryController.currentPhoto!));
        case RoutesNames.imageDetailSearch:
        return MaterialPageRoute(builder: (_) => ImageDetailPage(photo: SearchGalleryController.currentPhoto!));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
