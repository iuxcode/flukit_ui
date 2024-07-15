import 'package:flukit_ui/src/widgets/divider.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A modal bottom sheet widget.
class FluModalBottomSheet extends StatelessWidget {
  /// Constructs a [FluModalBottomSheet] widget.
  const FluModalBottomSheet({
    required this.child,
    super.key,
    this.padding = EdgeInsets.zero,
    this.cornerRadius,
    this.maxHeight,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.scrollable = true,
  });

  /// Animation curve
  final Curve animationCurve;

  /// Animation duration
  final Duration animationDuration;

  /// Creates a widget that insets its child.
  final Widget child;

  /// Corner radius
  final double? cornerRadius;

  /// Max height
  final double? maxHeight;

  /// The amount of space by which to inset the child.
  final EdgeInsets padding;

  /// If true, The child can scroll inside the bottom sheet
  final bool scrollable;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('maxHeight', maxHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<bool>('scrollable', scrollable))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('maxHeight', maxHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<bool>('scrollable', scrollable))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('maxHeight', maxHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<bool>('scrollable', scrollable))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('maxHeight', maxHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<bool>('scrollable', scrollable));
  }

  @override
  Widget build(BuildContext context) {
    final defaultCornerRadius =
        Radius.circular(cornerRadius ?? context.width * .05);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: context.colorScheme.surface,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FluLine(
              height: 3,
              width: context.width * .20,
              radius: 50,
              color: context.colorScheme.surface,
              margin: const EdgeInsets.only(bottom: 8),
            ),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: maxHeight ?? context.height * .85,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: defaultCornerRadius,
                    topRight: defaultCornerRadius,
                  ),
                  color: context.colorScheme.surface,
                ),
                child: scrollable
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: padding,
                        child: child,
                      )
                    : child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
