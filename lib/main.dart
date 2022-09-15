import 'package:flutter/material.dart';
import 'package:photos_fake/src/ui/routes/names.dart';
import 'package:photos_fake/src/ui/routes/routes.dart';
import 'package:photos_fake/src/utils/injector.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Injector.dependencies,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<DarkTheme>(context).isDarkTheme
    //  ? ThemeMode.dark
    //  : ThemeMode.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RoutesNames.splash,
      onGenerateRoute: CustomRoutes.routes,
      //darkTheme: CustomTheme.darkTheme(context),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
        ),
      ),
      //themeMode: themeMode,
    );
  }
}
