import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/theme_controller.dart';

class DarkLightThemeDrawerScreen extends StatefulWidget {
  const DarkLightThemeDrawerScreen({super.key});

  @override
  State<DarkLightThemeDrawerScreen> createState() => _DarkLightThemeDrawerScreenState();
}

class _DarkLightThemeDrawerScreenState extends State<DarkLightThemeDrawerScreen> {
  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: DrawerHeader(
                  child: Row(
                    children: [
                      const Text('Dark/Light mode'),
                      Obx(
                            () => Switch(
                          value: themeController.isDarkMode,
                          onChanged: (value) {
                            final newThemeMode =
                            value ? ThemeMode.dark : ThemeMode.light;
                            themeController.setThemeMode(newThemeMode);
                            saveThemeMode(newThemeMode);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void saveThemeMode(ThemeMode themeMode) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
      'theme_mode', themeMode == ThemeMode.dark ? 'dark' : 'light');
}