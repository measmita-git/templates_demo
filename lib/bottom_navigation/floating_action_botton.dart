import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/Expanded_bottom/expanded_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/theme_controller.dart';

class BottomNavigationTabBar extends StatefulWidget {
  BottomNavigationTabBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTabBar> createState() => _BottomNavigationTabBarState();
}

class _BottomNavigationTabBarState extends State<BottomNavigationTabBar> {
  bool isMoreMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
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
        body: ExpandableNavbar(),
      ),
    );
  }

  void saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        'theme_mode', themeMode == ThemeMode.dark ? 'dark' : 'light');
  }
}
