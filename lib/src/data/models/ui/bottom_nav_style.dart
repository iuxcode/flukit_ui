import 'package:flukit_icons/flukit_icons.dart';
import 'package:flukit_ui/src/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

/// Define a style for [FluBottomNavBar]
class FluBottomNavBarStyle {
  /// Create a [FluBottomNavBar] style
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

  /// Color of the [FluBottomNavBar]
  final Color? backgroundColor;

  /// Border for the navigation bar
  final BoxBorder? border;

  /// Color of the foreground
  /// apply to text and icons
  final Color? foregroundColor;

  /// Height of the navigation bar
  final double? height;

  /// Size of the icons
  final double iconSize;

  /// Stroke width of the icons
  final double iconStrokeWidth;

  /// Style of the icons
  final FluIconStyles iconStyle;

  /// Size of the indicator
  final double indicatorSize;

  /// Padding for the navigation bar
  final EdgeInsets? padding;

  /// Style of the selected icon
  final FluIconStyles? selectedIconStyle;

  /// Type of the navigation bar
  final FluBottomNavBarTypes type;

  /// Color for unselected icons
  final Color? unSelectedForegroundColor;
}
