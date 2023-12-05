import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/controller/expandable_nav_bar_controller.dart';
import '../bottom_navigation/bottom_navigation_explore_page.dart';
import '../bottom_navigation/bottom_navigation_home_page.dart';
import '../bottom_navigation/bottom_navigation_more_page.dart';
import '../bottom_navigation/bottom_navigation_properties_page.dart';
import '../controller/tab_controller.dart';

class ExpandableNavbar extends StatefulWidget {
  @override
  _ExpandableNavbarState createState() => _ExpandableNavbarState();
}

class _ExpandableNavbarState extends State<ExpandableNavbar> {
  final controller = Get.put(ExpandableNavBarController());
  final tabController = Get.put(MyTabController());
  Color moreIconColor = Colors.grey;
  bool isSelected = false;

  @override
  void initState() {
    tabController.controller.animation?.addListener(() {
      int index = tabController.controller.animation!.value.round();

      if (index == 3) {
        setState(() {
          moreIconColor = Colors.red;
        });
      } else {
        setState(() {
          moreIconColor = Colors.grey;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _expandedIcons = [
      IconButton(icon: Icon(Icons.email), onPressed: () {}),
      IconButton(icon: Icon(Icons.help), onPressed: () {}),
    ];

    return Scaffold(
      body: const Center(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: tabController.controller,
                children: const [
                  BottomNavigationHomePage(),
                  BottomNavigationPropertiesPage(),
                  BottomNavigationExplorePage(),
                  BottomNavigationMorePage(),
                ],
              ),
            ),
            if (controller.isExpanded)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _expandedIcons,
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTabIcon(Icons.home, 0, 'Home'),
                buildTabIcon(Icons.menu, 1, 'Menu'),
                buildTabIcon(Icons.circle, 2, 'Explore'),
                IconButton(
                    icon: Icon(
                      controller.isExpanded ? Icons.close : Icons.more,
                    ),
                    color: moreIconColor,
                    onPressed: () {
                      setState(() {
                        if (tabController.controller.index == 3) {
                          controller.toggleExpansion();
                        } else {
                          tabController.controller.index = 3;
                        }
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFF000087),
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.home,
      //     size: 30,
      //   ),
      // ),
    );
  }
}

Widget buildTabIcon(IconData iconData, int tabIndex, String label) {
  return Obx(() {
    final isSelected =
        Get.find<MyTabController>().selectedIndex.value == tabIndex;

    return IconButton(
      icon: Icon(iconData),
      color: isSelected ? Colors.red : Colors.grey,
      onPressed: () {
        Get.find<MyTabController>().controller.index = tabIndex;
      },
      tooltip: label,
    );
  });
}
