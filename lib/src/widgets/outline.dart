import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

/// Create a border around a [Widget].
class FluOutline extends StatelessWidget {
  /// Create a border around a [Widget] with the given properties.
  const FluOutline({
    required this.child,
    super.key,
    this.thickness = 1.5,
    this.cornerRadius = 18,
    this.gap = 2,
    this.colors = const [],
    this.borderRadius,
    this.boxShadow,
    this.margin = EdgeInsets.zero,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.circle = false,
  });

  /// The border radius of the container.
  final BorderRadius? borderRadius;

  /// Add shadows to the container.
  final List<BoxShadow>? boxShadow;

  /// The [Widget] to wrap.
  final Widget child;

  /// If true, the container will be a circle.
  final bool circle;

  /// The colors of the outline
  /// if you provide more than one color, the outline will be gradient
  final List<Color> colors;

  /// Corner radius
  final double cornerRadius;

  /// Space amount between the border and the [child].
  final double gap;

  /// Where the gradient start.
  final Alignment gradientBegin;

  /// Where the gradient ends.
  final Alignment gradientEnd;

  /// Space out the border from the container.
  final EdgeInsets margin;

  /// The thickness of the border.
  final double thickness;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(IterableProperty<Color>('colors', colors))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('gap', gap))
      ..add(DiagnosticsProperty<Alignment>('gradientBegin', gradientBegin))
      ..add(DiagnosticsProperty<Alignment>('gradientEnd', gradientEnd))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(DoubleProperty('thickness', thickness))
      ..add(DiagnosticsProperty<bool>('circle', circle))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(IterableProperty<Color>('colors', colors))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('gap', gap))
      ..add(DiagnosticsProperty<Alignment>('gradientBegin', gradientBegin))
      ..add(DiagnosticsProperty<Alignment>('gradientEnd', gradientEnd))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(DoubleProperty('thickness', thickness))
      ..add(DiagnosticsProperty<bool>('circle', circle))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(IterableProperty<Color>('colors', colors))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('gap', gap))
      ..add(DiagnosticsProperty<Alignment>('gradientBegin', gradientBegin))
      ..add(DiagnosticsProperty<Alignment>('gradientEnd', gradientEnd))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(DoubleProperty('thickness', thickness))
      ..add(DiagnosticsProperty<bool>('circle', circle))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(IterableProperty<Color>('colors', colors))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('gap', gap))
      ..add(DiagnosticsProperty<Alignment>('gradientBegin', gradientBegin))
      ..add(DiagnosticsProperty<Alignment>('gradientEnd', gradientEnd))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(DoubleProperty('thickness', thickness))
      ..add(DiagnosticsProperty<bool>('circle', circle));
  }

  @override
  Widget build(BuildContext context) {
    BoxBorder border;

    if (colors.length <= 1) {
      border = Border.all(
        color:
            colors.isEmpty ? context.colorScheme.surfaceVariant : colors.first,
        width: thickness,
      );
    } else {
      border = GradientBoxBorder(
        gradient: LinearGradient(
          colors: colors,
          begin: gradientBegin,
          end: gradientEnd,
        ),
        width: thickness,
      );
    }

    return Container(
      padding: EdgeInsets.all(gap),
      margin: margin,
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: !circle
            ? (borderRadius ?? BorderRadius.circular(cornerRadius))
            : null,
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
