import 'package:flukit_icons/flukit_icons.dart';
import 'package:flukit_widgets/src/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

/// Define a style for [FluBottomNavBar]
class FluBottomNavBarStyle {
  const FluBottomNavBarStyle({
    this.foregroundColor,
    this.backgroundColor,
    this.height,
    this.indicatorSize = 5,
    this.iconSize = 22,
    this.iconStrokeWidth = 1.8,
    this.padding,
    this.type = FluBottomNavBarTypes.flat,
    this.unSelectedForegroundColor,
    this.border,
    this.iconStyle = FluIconStyles.twotone,
    this.selectedIconStyle,
  });

  final Color? backgroundColor;
  final BoxBorder? border;
  final Color? foregroundColor;
  final double? height;
  final double iconSize;
  final double iconStrokeWidth;
  final double indicatorSize;
  final EdgeInsets? padding;
  final FluBottomNavBarTypes type;
  final Color? unSelectedForegroundColor;
  final FluIconStyles? selectedIconStyle;
  final FluIconStyles iconStyle;
}
