import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dt_color.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor;
  String? image;
  Widget? action;
  AppBar appBar;

  MainAppBar(
      {Key? key,
        this.backgroundColor = DTColor.white,

        this.action,
        required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      primary: true,
      titleSpacing: 20,
      actions: action != null ? [action!, const SizedBox(width: 20,)] : [],

      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(45);
}
