import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Notify page changes
class PageViewNotifier extends StatefulWidget {
  /// Constructor for PageViewNotifier
  const PageViewNotifier({
    required this.notifier,
    required this.child,
    required this.controller,
    super.key,
  });

  /// The child widget to display
  final Widget child;

  /// Controller for the page view
  final PageController? controller;

  /// ValueNotifier to notify page changes
  final ValueNotifier<double> notifier;

  @override
  State<PageViewNotifier> createState() => _PageViewNotifierState();

  // Adds diagnostic properties for notifier and controller
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ValueNotifier<double>>('notifier', notifier))
      ..add(DiagnosticsProperty<PageController?>('controller', controller))
      ..add(DiagnosticsProperty<PageController?>('controller', controller))
      ..add(DiagnosticsProperty<PageController?>('controller', controller))
      ..add(DiagnosticsProperty<PageController?>('controller', controller));
  }
}

class _PageViewNotifierState extends State<PageViewNotifier> {
  late final PageController controller;

  late int previousPage;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<PageController>('controller', controller))
      ..add(IntProperty('previousPage', previousPage))
      ..add(IntProperty('previousPage', previousPage))
      ..add(IntProperty('previousPage', previousPage))
      ..add(IntProperty('previousPage', previousPage));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = widget.controller ?? PageController()
      ..addListener(_onScroll);
    previousPage = controller.initialPage;
    super.initState();
  }

  void _onScroll() {
    if (controller.page != null) {
      if (controller.page!.toInt() == controller.page) {
        previousPage = controller.page!.toInt();
      }
      widget.notifier.value = controller.page! - previousPage;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
