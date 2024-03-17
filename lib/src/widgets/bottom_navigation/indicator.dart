part of './bottom_navigation.dart';

/// [FluBottomNavBar] indicator.
class NavIndicator extends StatelessWidget {
  // ignore: public_member_api_docs
  const NavIndicator({
    required this.size,
    required this.itemWidth,
    required this.position,
    required this.animationDuration,
    required this.animationCurve,
    required this.color,
    super.key,
  });

  /// Animation curve
  final Curve animationCurve;

  /// Animation duration
  final Duration animationDuration;

  /// Indicator color
  final Color color;

  /// Active item width
  final double itemWidth;

  /// Indicator position
  final double position;

  /// Indicator size
  final double size;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('itemWidth', itemWidth))
      ..add(DoubleProperty('position', position))
      ..add(DoubleProperty('size', size))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('itemWidth', itemWidth))
      ..add(DoubleProperty('position', position))
      ..add(DoubleProperty('size', size))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('itemWidth', itemWidth))
      ..add(DoubleProperty('position', position))
      ..add(DoubleProperty('size', size))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('itemWidth', itemWidth))
      ..add(DoubleProperty('position', position))
      ..add(DoubleProperty('size', size));
  }

  @override
  Widget build(BuildContext context) => AnimatedPositioned(
        left: position,
        bottom: 0,
        duration: animationDuration,
        curve: animationCurve,
        child: Container(
          height: size,
          width: itemWidth,
          alignment: Alignment.center,
          child: Container(
            height: size,
            width: size * 3,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size),
                topRight: Radius.circular(size),
              ),
            ),
          ),
        ),
      );
}
