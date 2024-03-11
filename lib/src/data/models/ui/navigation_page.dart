import 'package:flukit_icons/icons.dart';
import 'package:flutter/material.dart';

/// Define a [FluNavScreen] page.
/// The `name` represent the page name, `icon`, the corresponding icon in the
/// [FluBottomNavBar], `content`, the page body content, and `extendBody` must
/// be marked to true if you want the [content] to extends
/// to the bottom of the Scaffold, instead of only extending to the top of
/// the `bottomNavigationBar` or the `persistentFooterButtons`.
class FluNavPage {
  // ignore: public_member_api_docs
  FluNavPage(this.name, this.icon, this.content, {this.extendBody = false});

  /// page body content
  final Widget? content;

  /// if marked to `true`, the [content] will extends
  /// to the bottom of the Scaffold, instead of only extending to the top of
  /// the `bottomNavigationBar` or the `persistentFooterButtons`.
  final bool extendBody;

  /// corresponding icon in the [FluBottomNavBar]
  final FluIcons icon;

  /// Page name
  final String name;

  /// Routing path of this page.
  String get path => '/$name';
}
