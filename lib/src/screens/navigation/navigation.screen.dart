import 'package:flukit_navigation/flukit_navigation.dart';
import 'package:flukit_ui/flukit_ui.dart';
import 'package:flukit_ui/src/data/models/ui/bottom_nav_item.dart';
import 'package:flukit_ui/src/data/models/ui/bottom_nav_style.dart';
import 'package:flukit_ui/src/data/models/ui/navigation_page.dart';
import 'package:flukit_ui/src/screens/404.screen.dart';
import 'package:flukit_ui/src/screens/base.screen.dart';
import 'package:flukit_ui/src/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A screen that provides a bottom navigation bar with multiple pages.
///
/// This screen allows you to easily create a multi-page application with a
/// bottom navigation bar. It provides a simple way to manage the navigation
/// between different pages and customize the appearance of the navigation bar.
class FluNavScreen extends StatefulWidget {
  /// Creates a [FluNavScreen] widget.
  const FluNavScreen({
    required this.pages,
    super.key,
    this.initialPage = 0,
    this.navigatorKey,
    this.onNav,
    this.canPop = false,
    this.bottomNavBarStyle,
    this.appBar,
    this.overlayStyle,
    this.floatingActionButton,
    this.extendBody,
    this.background,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.drawer,
    this.endDrawer,
    this.scaffoldKey,
    this.drawerScrimColor,
    this.hideBottomNavBar = false,
  });

  /// Callback function triggered when the navigation bar item is tapped.
  ///
  /// The `index` parameter represents the index of the tapped item.
  final void Function(int)? onNav;

  /// Callback function to customize the style of the bottom navigation bar.
  ///
  /// The `currentPage` parameter represents the current page index.
  final FluBottomNavBarStyle Function(int currentPage)? bottomNavBarStyle;

  /// The app bar widget to be displayed at the top of the screen.
  final PreferredSizeWidget? appBar;

  /// Whether the screen can be popped using the back button.
  ///
  /// Defaults to `false`.
  final bool canPop;

  /// The background color of the screen.
  final Color? background;

  /// The color of the drawer scrim.
  final Color? drawerScrimColor;

  /// The drawer widget to be displayed on the left side of the screen.
  final Widget? drawer;

  /// The end drawer widget to be displayed on the right side of the screen.
  final Widget? endDrawer;

  /// Whether the body of the screen should
  /// extend to the bottom of the Scaffold.
  ///
  /// Defaults to `false`.
  final bool? extendBody;

  /// The floating action button widget to be displayed on the screen.
  final Widget? floatingActionButton;

  /// The location of the floating action button.
  ///
  /// Defaults to `FloatingActionButtonLocation.centerDocked`.
  final FloatingActionButtonLocation floatingActionButtonLocation;

  /// The initial page index to be displayed when the screen is first loaded.
  ///
  /// Defaults to `0`.
  final int initialPage;

  /// The navigator key for the screen.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The system UI overlay style to be applied to the screen.
  final SystemUiOverlayStyle? overlayStyle;

  /// A list of [FluNavScreenPage] objects representing the pages
  /// to be displayed in the navigation bar.
  final List<FluNavScreenPage> pages;

  /// The scaffold key for the screen.
  final GlobalKey<ScaffoldState>? scaffoldKey;

  /// If `true`, the bottom navigation bar will be hidden
  ///
  /// You must consider defining the `navigatorKey`
  /// in order to be able to navigate.
  final bool hideBottomNavBar;

  @override
  State<FluNavScreen> createState() => _FluNavScreenState();
}

class _FluNavScreenState extends State<FluNavScreen> {
  late final GlobalKey<NavigatorState> _navigatorKey;
  late final List<FluNavScreenPage> pages;

  late int currentPage;
  late bool mustExtendBody;

  void navigateTo(int index) {
    final page = widget.pages[index];

    if (index != currentPage) {
      _navigatorKey.currentState?.pushNamed(page.path);
    }

    setState(() {
      currentPage = index;
      mustExtendBody = widget.pages[index].extendBody;
    });

    widget.onNav?.call(index);
  }

  Route<dynamic>? buildUnknownRoute(RouteSettings settings) =>
      Flu404Screen.route(settings.name);

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final page = pages.firstWhereOrNull((page) => page.path == settings.name);

    if (page != null) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideRightTransition().buildTransitions(
            context,
            animation,
            secondaryAnimation,
            page.content,
          );
        },
        settings: RouteSettings(
          name: page.name,
        ),
      );
    } else {
      return buildUnknownRoute(settings);
    }
  }

  @override
  void initState() {
    _navigatorKey = widget.navigatorKey ?? GlobalKey<NavigatorState>();
    pages = widget.pages;
    currentPage = widget.initialPage;
    mustExtendBody = widget.pages[currentPage].extendBody;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget? bottomNavigationBar = widget.hideBottomNavBar
        ? null
        : FluBottomNavBar(
            index: currentPage,
            onItemTap: navigateTo,
            items: widget.pages
                .map((page) => FluBottomNavBarItem(page.icon, page.name))
                .toList(),
            style: widget.bottomNavBarStyle?.call(currentPage) ??
                const FluBottomNavBarStyle(),
          );

    return FluScreen(
      body: Navigator(
        key: _navigatorKey,
        restorationScopeId: 'MainScreenNav',
        initialRoute: widget.pages[0].path,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: buildUnknownRoute,
      ),
      bottomNavigationBar: bottomNavigationBar,
      overlayStyle: context.systemUiOverlayStyle
          .copyWith(statusBarColor: Colors.transparent),
      key: widget.scaffoldKey,
      background: widget.background,
      extendBody: widget.extendBody ?? mustExtendBody,
      appBar: widget.appBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      drawerScrimColor: widget.drawerScrimColor,
    );
  }
}
