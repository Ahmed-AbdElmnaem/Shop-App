import 'package:flutter/material.dart';
import 'package:tahadoapp/core/theming/color_manger.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      backgroundColor: ColorManger.mainColor,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: Colors.white24,
                offset: Offset(0.3, 3.0),
              ),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
