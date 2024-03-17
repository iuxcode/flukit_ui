import 'package:flukit_widgets/src/data/enums/grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// Use `flutter_staggered_grid_view` to create scrollable,
/// 2D array of widgets with a fixed number of tiles in the cross axis.
class FluGrid extends StatelessWidget {
  // ignore: public_member_api_docs
  const FluGrid({
    super.key,
    this.type = FluGridType.masonry,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
    this.children = const [],
    this.itemCount,
    this.itemBuilder,
    this.shrinkWrap = true,
    this.reverse = false,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  /// Creates a scrollable, 2D array of widgets
  final Widget Function(BuildContext, int)? itemBuilder;

  /// Grid children
  final List<Widget> children;

  /// Number of tiles in the cross axis
  final int crossAxisCount;

  /// Space between tiles in the cross axis
  final double crossAxisSpacing;

  /// Number of tiles in the main axis
  final int? itemCount;

  /// Span between tiles in the main axis
  final double mainAxisSpacing;

  /// Creates scroll physics
  final ScrollPhysics physics;

  /// Reverse the order of the children
  final bool reverse;

  /// Shrink wrap the grid
  final bool shrinkWrap;

  /// Grid type. Define a layout for the grid.
  /// It can be `normal`, `masonry` or `Staggered`
  final FluGridType type;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<Widget Function(BuildContext p1, int p2)?>.has(
          'itemBuilder',
          itemBuilder,
        ),
      )
      ..add(IntProperty('crossAxisCount', crossAxisCount))
      ..add(DoubleProperty('crossAxisSpacing', crossAxisSpacing))
      ..add(IntProperty('itemCount', itemCount))
      ..add(DoubleProperty('mainAxisSpacing', mainAxisSpacing))
      ..add(DiagnosticsProperty<ScrollPhysics>('physics', physics))
      ..add(DiagnosticsProperty<bool>('reverse', reverse))
      ..add(DiagnosticsProperty<bool>('shrinkWrap', shrinkWrap))
      ..add(EnumProperty<FluGridType>('type', type))
      ..add(IntProperty('crossAxisCount', crossAxisCount))
      ..add(DoubleProperty('crossAxisSpacing', crossAxisSpacing))
      ..add(IntProperty('itemCount', itemCount))
      ..add(DoubleProperty('mainAxisSpacing', mainAxisSpacing))
      ..add(DiagnosticsProperty<ScrollPhysics>('physics', physics))
      ..add(DiagnosticsProperty<bool>('reverse', reverse))
      ..add(DiagnosticsProperty<bool>('shrinkWrap', shrinkWrap))
      ..add(EnumProperty<FluGridType>('type', type))
      ..add(IntProperty('crossAxisCount', crossAxisCount))
      ..add(DoubleProperty('crossAxisSpacing', crossAxisSpacing))
      ..add(IntProperty('itemCount', itemCount))
      ..add(DoubleProperty('mainAxisSpacing', mainAxisSpacing))
      ..add(DiagnosticsProperty<ScrollPhysics>('physics', physics))
      ..add(DiagnosticsProperty<bool>('reverse', reverse))
      ..add(DiagnosticsProperty<bool>('shrinkWrap', shrinkWrap))
      ..add(EnumProperty<FluGridType>('type', type))
      ..add(IntProperty('crossAxisCount', crossAxisCount))
      ..add(DoubleProperty('crossAxisSpacing', crossAxisSpacing))
      ..add(IntProperty('itemCount', itemCount))
      ..add(DoubleProperty('mainAxisSpacing', mainAxisSpacing))
      ..add(DiagnosticsProperty<ScrollPhysics>('physics', physics))
      ..add(DiagnosticsProperty<bool>('reverse', reverse))
      ..add(DiagnosticsProperty<bool>('shrinkWrap', shrinkWrap))
      ..add(EnumProperty<FluGridType>('type', type));
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FluGridType.normal:
        return StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          children: children,
        );
      case FluGridType.masonry:
        assert(
          itemCount != null && itemBuilder != null,
          // ignore: lines_longer_than_80_chars
          "itemCount and itemBuilder can't be null when you are building a masonry grid.",
        );

        return MasonryGridView.count(
          shrinkWrap: shrinkWrap,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          physics: physics,
          itemCount: itemCount,
          itemBuilder: itemBuilder!,
          reverse: reverse,
        );
    }
  }
}
