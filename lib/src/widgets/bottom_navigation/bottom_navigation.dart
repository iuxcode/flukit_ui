import 'dart:math' as math;

import 'package:flukit_icons/flukit_icons.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flukit_widgets/src/data/models/ui/bottom_nav_item.dart';
import 'package:flukit_widgets/src/data/models/ui/bottom_nav_style.dart';
import 'package:flukit_widgets/src/widgets/button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part './indicator.dart';
part './utils.dart';
part './item.dart';

/// Creates a bottom navigation bar which is typically
/// used as a [Scaffold]'s Scaffold.bottomNavigationBar argument.
/// The length of [items] must be at least two and each
/// item's icon and label must not be null.
class FluBottomNavBar extends StatefulWidget {
  /// Creates a bottom navigation bar
  const FluBottomNavBar({
    required this.items,
    super.key,
    this.onItemTap,
    this.style = const FluBottomNavBarStyle(),
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.fastOutSlowIn,
    this.index = 0,
  });

  /// handle on item tap
  final void Function(int)? onItemTap;

  /// animation curve
  final Curve animationCurve;

  /// animation duration
  final Duration animationDuration;

  /// Current active item index
  final int index;

  /// Bottom navigation bar items
  final List<FluBottomNavBarItem> items;

  /// Bottom navigation bar style
  final FluBottomNavBarStyle style;

  @override
  State<FluBottomNavBar> createState() => _FluBottomNavBarState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<void Function(int p1)?>.has('onItemTap', onItemTap),
      )
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(IterableProperty<FluBottomNavBarItem>('items', items))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<FluBottomNavBarStyle>('style', style))
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(IterableProperty<FluBottomNavBarItem>('items', items))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<FluBottomNavBarStyle>('style', style))
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(IterableProperty<FluBottomNavBarItem>('items', items))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<FluBottomNavBarStyle>('style', style))
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(IterableProperty<FluBottomNavBarItem>('items', items))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<FluBottomNavBarStyle>('style', style));
  }
}

class _FluBottomNavBarState extends State<FluBottomNavBar> {
  final GlobalKey _itemKey = GlobalKey();

  late int _currentIndex;
  double _itemWidth = 0;

  @override
  void didUpdateWidget(covariant FluBottomNavBar oldWidget) {
    getItemWidth();
    _currentIndex = widget.index;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getItemWidth());
  }

  void getItemWidth() => setState(
        () => _itemWidth =
            (_itemKey.currentContext!.findRenderObject()! as RenderBox)
                .size
                .width,
      );

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        widget.style.foregroundColor ?? context.colorScheme.primary;
    final unSelectedForegroundColor =
        widget.style.unSelectedForegroundColor ?? context.colorScheme.onSurface;
    final height = widget.style.height ?? context.height * .1;

    Widget bottomNav = Container(
      height: height,
      width: double.infinity,
      padding: widget.style.padding,
      decoration: BoxDecoration(
        color: widget.style.backgroundColor,
        border: widget.style.border,
      ),
      child: Row(
        children: widget.items.map((item) {
          final index = widget.items.indexOf(item);
          final isSelected = index == _currentIndex;

          return _NavItem(
            key: widget.items.indexOf(item) == 0 ? _itemKey : null,
            item,
            onTap: () {
              setState(() => _currentIndex = index);
              widget.onItemTap?.call(index);
            },
            color: isSelected ? foregroundColor : unSelectedForegroundColor,
            iconSize: widget.style.iconSize,
            iconStrokeWidth: widget.style.iconStrokeWidth,
            iconStyle: isSelected && widget.style.selectedIconStyle != null
                ? widget.style.selectedIconStyle!
                : widget.style.iconStyle,
          );
        }).toList(),
      ),
    );

    bottomNav = Stack(
      children: [
        bottomNav,
        NavIndicator(
          animationDuration: widget.animationDuration,
          animationCurve: widget.animationCurve,
          size: widget.style.indicatorSize,
          itemWidth: _itemWidth,
          position: (_currentIndex * _itemWidth) +
              (widget.style.padding?.horizontal ?? 0) / 2,
          color: foregroundColor,
        ),
      ],
    );

    switch (widget.style.type) {
      case FluBottomNavBarTypes.curved:
        return CurvedBottomNav(child: bottomNav);
      case FluBottomNavBarTypes.flat:
        return bottomNav;
    }
  }
}

/// Create a Bottom navigation bar with a notch
class CurvedBottomNav extends StatelessWidget {
  // ignore: public_member_api_docs
  const CurvedBottomNav({
    required this.child,
    super.key,
    this.notchMargin = 8.0,
    this.gapLocation = GapLocation.center,
    this.notchSmoothness = NotchSmoothness.softEdge,
    this.borderRadius = BorderRadius.zero,
  });

  /// Corner radius of the [CurvedBottomNav]
  final BorderRadius borderRadius;

  /// The contents of the [CurvedBottomNav]
  final Widget child;

  /// The location of the notch
  final GapLocation gapLocation;

  /// The margin of the notch
  final double notchMargin;

  /// The smoothness of the notch
  final NotchSmoothness notchSmoothness;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius))
      ..add(EnumProperty<GapLocation>('gapLocation', gapLocation))
      ..add(DoubleProperty('notchMargin', notchMargin))
      ..add(EnumProperty<NotchSmoothness>('notchSmoothness', notchSmoothness))
      ..add(EnumProperty<GapLocation>('gapLocation', gapLocation))
      ..add(DoubleProperty('notchMargin', notchMargin))
      ..add(EnumProperty<NotchSmoothness>('notchSmoothness', notchSmoothness))
      ..add(EnumProperty<GapLocation>('gapLocation', gapLocation))
      ..add(DoubleProperty('notchMargin', notchMargin))
      ..add(EnumProperty<NotchSmoothness>('notchSmoothness', notchSmoothness))
      ..add(EnumProperty<GapLocation>('gapLocation', gapLocation))
      ..add(DoubleProperty('notchMargin', notchMargin))
      ..add(EnumProperty<NotchSmoothness>('notchSmoothness', notchSmoothness));
  }

  @override
  Widget build(BuildContext context) => PhysicalShape(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        clipper: _CircularNotchedAndCorneredRectangleClipper(
          notchMargin: notchMargin,
          geometry: Scaffold.geometryOf(context),
          shape: _CircularNotchedAndCorneredRectangle(
            gapLocation: gapLocation,
            notchSmoothness: notchSmoothness,
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: child,
      );
}
