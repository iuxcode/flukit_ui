library flukit_widgets;

import 'package:flukit_core/flukit_core.dart';

export 'package:flukit_icons/flukit_icons.dart';

export './src/data/enums/avatar_type.dart';
export './src/data/enums/grid.dart';
export './src/data/enums/image_source.dart';
export './src/data/models/ui/bottom_nav_item.dart';
export './src/data/models/ui/bottom_nav_style.dart';
export './src/data/models/ui/chip.model.dart';
export './src/data/static/constants.dart';
export './src/utils/ui.dart';
export './src/widgets/avatar.dart';
export './src/widgets/avatar_group.dart';
export './src/widgets/badge.dart';
export './src/widgets/bottom_navigation/bottom_navigation.dart';
export './src/widgets/bottom_sheet.dart';
export './src/widgets/button.dart';
export './src/widgets/chip.dart';
export './src/widgets/collapsible.dart';
export './src/widgets/country_selector.dart';
export './src/widgets/dashed_circle.dart';
export './src/widgets/divider.dart';
export './src/widgets/glass.dart';
export './src/widgets/grid.dart';
export './src/widgets/image.dart';
export './src/widgets/inputs.dart';
export './src/widgets/loader.dart';
export './src/widgets/outline.dart';
export './src/widgets/page_view.dart';
export './src/widgets/tabs.dart';
export 'src/screens/404.screen.dart';
export 'src/screens/base.screen.dart';
export 'src/screens/navigation/navigation.screen.dart';

/// Manage & provide UI utilities.
class FlukitUI {
  /// [FlukitUI] constructor
  FlukitUI(this.fluInstance);

  /// [Flukit] instance
  final Flukit fluInstance;
}

/// Manage & provide [Flukit] UI utilities.
// ignore: non_constant_identifier_names
final FlukitUI FluUI = FlukitUI(Flu);
