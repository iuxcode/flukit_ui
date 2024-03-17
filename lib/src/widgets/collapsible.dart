import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget that can collapse its child based on a collapse flag.
class FluCollapsible extends StatefulWidget {
  /// Constructor for FluCollapsible widget.
  const FluCollapsible({
    required this.collapse,
    required this.axis,
    required this.child,
    super.key,
    this.alignment = Alignment.center,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
  });

  /// Alignment of the child widget
  final Alignment alignment;

  /// Axis along which the child collapses
  final Axis axis;

  /// The child widget to be collapsed
  final Widget child;

  /// Flag to determine if the child should be collapsed
  final bool collapse;

  /// Curve for the collapse animation
  final Curve curve;

  /// Duration of the collapse animation
  final Duration duration;

  @override
  FluCollapsibleState createState() => FluCollapsibleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Alignment>('alignment', alignment))
      ..add(EnumProperty<Axis>('axis', axis))
      ..add(DiagnosticsProperty<bool>('collapse', collapse))
      ..add(DiagnosticsProperty<Curve>('curve', curve))
      ..add(DiagnosticsProperty<Duration>('duration', duration));
  }
}

// ignore: public_member_api_docs
class FluCollapsibleState extends State<FluCollapsible>
    with SingleTickerProviderStateMixin {
  /// Animation for the collapse animation
  late final Animation<double> animation;

  /// Controller for the collapse animation
  late final AnimationController controller;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Animation<double>>('animation', animation))
      ..add(DiagnosticsProperty<AnimationController>('controller', controller))
      ..add(DiagnosticsProperty<AnimationController>('controller', controller))
      ..add(DiagnosticsProperty<AnimationController>('controller', controller))
      ..add(DiagnosticsProperty<AnimationController>('controller', controller));
  }

  @override
  void didUpdateWidget(FluCollapsible oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (!widget.collapse) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) => SizeTransition(
        axis: widget.axis,
        axisAlignment: widget.axis == Axis.horizontal ? -1.0 : 1.0,
        sizeFactor: animation,
        child: Align(alignment: widget.alignment, child: widget.child),
      );
}
