import 'package:photos_fake/src/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Injector{
  static List<SingleChildWidget> dependencies = [
    ChangeNotifierProvider(create: (_) => DarkTheme()),
    ChangeNotifierProvider(create: (_) => LoginUserController()),
    ChangeNotifierProvider(create: (_) => CreateUserController()),
    ChangeNotifierProvider(create: (_) => ListGalleryController()),
    ChangeNotifierProvider(create: (_) => SearchGalleryController()),
  ];
}