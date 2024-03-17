import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a frosted glass effect
class FluGlass extends StatelessWidget {
  /// Creates a frosted glass effect with the given [child] widget.
  const FluGlass({
    required this.child,
    super.key,
    this.borderRadius,
    this.margin = EdgeInsets.zero,
    this.intensity = 5.0,
    this.cornerRadius = 0,
  });

  /// The border radius of the frosted glass effect.
  final BorderRadius? borderRadius;

  /// The main content of the frosted glass widget.
  final Widget child;

  /// The corner radius of the frosted glass effect.
  final double cornerRadius;

  /// The intensity of the frosted glass effect.
  final double intensity;

  /// The space around the frosted glass widget.
  final EdgeInsets margin;

  /// Adds properties for debugging.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('intensity', intensity))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin));
  }

  /// Builds the frosted glass widget.
  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: borderRadius ?? BorderRadius.circular(cornerRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: intensity,
              sigmaY: intensity,
            ),
            child: child,
          ),
        ),
      );
}
