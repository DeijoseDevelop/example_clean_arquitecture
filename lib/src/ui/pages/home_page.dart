// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:photos_fake/src/data/repository/auth_repository.dart';
import 'package:photos_fake/src/ui/pages/pages.dart';
import 'package:photos_fake/src/ui/widgets/loader.dart';
import 'package:photos_fake/src/ui/widgets/title_menu.dart';
import 'package:photos_fake/src/utils/responsive.dart';
import 'package:photos_fake/src/utils/session.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout(BuildContext context) async {
    Session.instance.stop();
    AuthRepository authRepository = AuthRepository();
    openLoader(context);
    Future.delayed(const Duration(seconds: 2));
    closeLoader(context);
    await authRepository.logout();
    Navigator.pushReplacementNamed(
      context,
      '/login',
    );
  }

  int _selectedIndex = 0;

    final List<Widget> _widgets = <Widget>[
      const ListGalleryPage(),
      const SearchGalleryPage(),
      const Text('Hello'),
      const Text('Hello'),
    ];

    void _changeIndex(int index){
      setState(() => _selectedIndex = index);
    }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            const TitleMenu(),
            SizedBox(width: responsive.heightResponsive(5)),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              onPressed: () => logout(context),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        body: Center(
          child: _widgets.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 238, 243, 253),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            size: 35,
            color: Color.fromARGB(200, 86, 113, 253),
          ),
          items: _buildBottomNavigationBarItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 61, 61, 61),
          unselectedItemColor: const Color.fromARGB(255, 61, 61, 61),
          onTap: _changeIndex,
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
  return <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.photo_outlined),
      label: 'Photos',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.photo_library_outlined),
      label: 'Library',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt_outlined),
      label: 'Take a picture',
    ),
  ];
}