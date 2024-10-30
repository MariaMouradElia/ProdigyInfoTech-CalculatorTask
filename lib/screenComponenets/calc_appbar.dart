import 'package:calculator_version_2/constants/assets.dart';
import 'package:flutter/material.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CalculatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AssetData.appTitle,
        style: TextStyle(
          color: Color(AssetData.appTitleColor),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          fontSize: AssetData.titleFontSize,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size(double.maxFinite, AssetData.appBarHeight);
}
