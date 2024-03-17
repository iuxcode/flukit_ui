import 'package:flukit_icons/icons.dart';
import 'package:flukit_widgets/src/widgets/bottom_navigation/bottom_navigation.dart';

/// Creates an item that is used with [FluBottomNavBar].
class FluBottomNavBarItem {
  /// Create a [FluBottomNavBar] Item.
  FluBottomNavBarItem(this.icon, this.label);

  /// The icon for the bottom navigation bar item.
  final FluIcons icon;

  /// The label for the bottom navigation bar item.
  final String label;
}
