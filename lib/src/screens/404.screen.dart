import 'package:flukit_navigation/flukit_navigation.dart';
import 'package:flukit_ui/src/screens/base.screen.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 404 Screen
class Flu404Screen extends StatelessWidget {
  /// [Flu404Screen] constructor
  const Flu404Screen(this.exceptedRouteName, {super.key});

  /// Route excepted to be reach.
  final String exceptedRouteName;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('exceptedRouteName', exceptedRouteName));
  }

  /// Builds the default `404` route.
  static Route<dynamic> route(
    String? exceptedRouteName,
  ) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideRightTransition().buildTransitions(
            context,
            animation,
            secondaryAnimation,
            Flu404Screen(exceptedRouteName ?? 'Unknown'),
          );
        },
        settings: const RouteSettings(
          name: '404',
        ),
      );

  @override
  Widget build(BuildContext context) => FluScreen(
        background: Colors.pink,
        overlayStyle: context.systemUiOverlayStyle.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.pink,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '404',
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'The route'),
                      TextSpan(
                        text: ' $exceptedRouteName ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: 'was not found!'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
