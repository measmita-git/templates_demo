import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_menu/carousel_screen/carousel_page_one.dart';
import 'package:searchable_menu/carousel_screen/carousel_page_two.dart';

import '../authentication_screen/Login_Screen.dart';

class CarouselSliderScreen extends StatelessWidget {
  const CarouselSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 650.0,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
            ),
            items: [
              CarouselPageOne(),
              CarouselPageTwo(),

            ],
          ),
        ],
      ),
    );
  }
}
