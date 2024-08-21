import 'package:flukit_navigation/flukit_navigation.dart';
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
///
/// **Example:**
///
/// ```dart
/// class MyHomePage extends StatefulWidget {
///   const MyHomePage({Key? key}) : super(key: key);
///
///   @override
///   State<MyHomePage> createState() => _MyHomePageState();
/// }
///
/// class _MyHomePageState extends State<MyHomePage> {
///   @override
///   Widget build(BuildContext context) {
///     return FluNavScreen(
///       pages: [
///         FluNavPage('Home', FluIcons.home, const Text('Home Page')),
///         FluNavPage('Profile', FluIcons.user, const Text('Profile Page')),
///         FluNavPage('Settings', FluIcons.settings, const Text('Settings Page')),
///       ],
///     );
///   }
/// }
/// ```
class FluNavScreen extends StatefulWidget {
  /// Creates a [FluNavScreen] widget.
  ///
  /// The `pages` parameter is required and must be a list of [FluNavPage]
  /// objects representing the pages to be displayed in the navigation bar.
  ///
  /// The `initialPage` parameter specifies the initial page index to be
  /// displayed when the screen is first loaded. It defaults to `0`.
  ///
  /// The `navigatorKey` parameter provides access to the navigator key for the
  /// screen.
  ///
  /// The `onNav` parameter is a callback function that is triggered when a
  /// navigation bar item is tapped. It receives the index of the tapped item
  /// as an argument.
  ///
  /// The `canPop` parameter determines whether the screen can be popped using
  /// the back button. It defaults to `false`.
  ///
  /// The `bottomNavBarStyle` parameter is a callback function that allows you
  /// to customize the style of the bottom navigation bar based on the current
  /// page index.
  ///
  /// The `appBar` parameter allows you to specify a custom app bar widget to
  /// be displayed at the top of the screen.
  ///
  /// The `overlayStyle` parameter allows you to specify a custom system UI
  /// overlay style to be applied to the screen.
  ///
  /// The `floatingActionButton` parameter allows you to specify a custom
  /// floating action button widget to be displayed on the screen.
  ///
  /// The `extendBody` parameter determines whether the body of the screen
  /// should extend to the bottom of the Scaffold. It defaults to `false`.
  ///
  /// The `background` parameter sets the background color of the screen.
  ///
  /// The `floatingActionButtonLocation` parameter sets the location of the
  /// floating action button. It defaults to
  /// `FloatingActionButtonLocation.centerDocked`.
  ///
  /// The `drawer` parameter allows you to specify a custom drawer widget to be
  /// displayed on the left side of the screen.
  ///
  /// The `endDrawer` parameter allows you to specify a custom end drawer widget
  /// to be displayed on the right side of the screen.
  ///
  /// The `scaffoldKey` parameter provides access to the scaffold key for the
  /// screen.
  ///
  /// The `drawerScrimColor` parameter sets the color of the scrim that appears
  /// behind the drawer when it is open.
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

  /// A list of [FluNavPage] objects representing the pages
  /// to be displayed in the navigation bar.
  final List<FluNavPage> pages;

  /// The scaffold key for the screen.
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<FluNavScreen> createState() => _FluNavScreenState();
}

class _FluNavScreenState extends State<FluNavScreen> {
  late final GlobalKey<NavigatorState> _navigatorKey;

  late int _currentPage;
  late bool _mustExtendBody;
  late bool _canPop;

  @override
  void initState() {
    _navigatorKey = widget.navigatorKey ?? GlobalKey<NavigatorState>();
    _currentPage = widget.initialPage;
    _canPop = _currentPage > 0;
    _mustExtendBody = widget.pages[_currentPage].extendBody;
    super.initState();
  }

  Route<dynamic>? _buildUnknownRoute(RouteSettings settings) =>
      Flu404Screen.route(settings.name);

  Future<void> onPopInvoked(bool didPop, Object? result) async {
    var cp = false;

    if (!didPop && !widget.canPop && _currentPage != 0) {
      for (var i = _currentPage - 1; i >= 0; i--) {
        if (widget.pages[i].content != null) {
          await _navigateTo(context, i);
          break;
        }
      }
    } else {
      cp = true;
    }

    setState(() => _canPop = cp);
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    final index = widget.pages
        .indexWhere((page) => page.path == name && page.content != null);

    if (index > -1) {
      final content = widget.pages[index].content!;

      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            (index > _currentPage)
                ? SlideRightTransition().buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    content,
                  )
                : SlideLeftTransition().buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    content,
                  ),
        settings: settings,
      );
    }

    return _buildUnknownRoute(settings);
  }

  Future<void> _navigateTo(BuildContext context, int index) async {
    final page = widget.pages[index];

    if (index != _currentPage && page.content != null) {
      await _navigatorKey.currentState?.pushNamed(page.path);
    }

    setState(() {
      _currentPage = index;
      _mustExtendBody = widget.pages[index].extendBody;
    });

    widget.onNav?.call(index);
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: _canPop,
        onPopInvokedWithResult: onPopInvoked,
        child: FluScreen(
          overlayStyle: context.systemUiOverlayStyle
              .copyWith(statusBarColor: Colors.transparent),
          key: widget.scaffoldKey,
          background: widget.background,
          extendBody: widget.extendBody ?? _mustExtendBody,
          appBar: widget.appBar,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          floatingActionButton: widget.floatingActionButton,
          drawer: widget.drawer,
          endDrawer: widget.endDrawer,
          drawerScrimColor: widget.drawerScrimColor,
          body: Navigator(
            key: _navigatorKey,
            restorationScopeId: 'MainScreenNav',
            initialRoute: widget.pages[0].path,
            onGenerateRoute: _onGenerateRoute,
            onUnknownRoute: _buildUnknownRoute,
          ),
          bottomNavigationBar: FluBottomNavBar(
            index: _currentPage,
            onItemTap: (index) async {
              await _navigateTo(context, index);
            },
            items: widget.pages
                .map((page) => FluBottomNavBarItem(page.icon, page.name))
                .toList(),
            style: widget.bottomNavBarStyle?.call(_currentPage) ??
                const FluBottomNavBarStyle(),
          ),
        ),
      );
}
