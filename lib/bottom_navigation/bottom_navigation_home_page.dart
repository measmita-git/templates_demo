import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_menu/Searchable/searchable_overlay.dart';
import 'package:searchable_menu/authentication_screen/Login_Screen.dart';

class BottomNavigationHomePage extends StatelessWidget {
  const BottomNavigationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          child: SearchableOverlayScreen(),
        ),
      ),
    );
  }
}
