import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';

class BottomItemModel {
  const BottomItemModel(
      {required this.label,
      required this.svgIconPath,
      this.unSelectColor = bottomNavBarItemTextUnselectedColor,
      this.selectColor = bottomNavBarItemTextSelectedColor,
      this.selected = false});

  // final IconData icon;
  final String svgIconPath;
  final String label;
  final Color unSelectColor;
  final Color selectColor;
  final bool selected;
}
