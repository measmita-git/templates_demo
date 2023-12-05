import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_menu/carousel_screen/carousel_slider.dart';

class BottomNavigationPropertiesPage extends StatelessWidget {
  const BottomNavigationPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: CarouselSliderScreen(),
      ),
    );
  }
}
