part of './bottom_navigation.dart';

/// [FluBottomNavBar] item.
class _NavItem extends StatelessWidget {
  const _NavItem(
    this.item, {
    required this.onTap,
    required this.color,
    required this.iconSize,
    required this.iconStyle,
    required this.iconStrokeWidth,
    super.key,
  });

  final Color color;
  final double iconSize;
  final FluIconStyles iconStyle;
  final double iconStrokeWidth;
  final FluBottomNavBarItem item;
  final VoidCallback onTap;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(DiagnosticsProperty<FluBottomNavBarItem>('item', item))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(DiagnosticsProperty<FluBottomNavBarItem>('item', item))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(DiagnosticsProperty<FluBottomNavBarItem>('item', item))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(DiagnosticsProperty<FluBottomNavBarItem>('item', item))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle));
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: FluButton.icon(
          item.icon,
          onPressed: onTap,
          iconSize: iconSize,
          iconStyle: iconStyle,
          iconStrokeWidth: iconStrokeWidth,
          color: Colors.transparent,
          foregroundColor: color,
          size: double.infinity,
        ),
      );
}
