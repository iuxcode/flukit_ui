library flukit_widgets;

import 'package:flukit_core/flukit_core.dart';

export 'package:flukit_icons/flukit_icons.dart';

export './src/data/enums/avatar_type.dart';
export './src/data/enums/grid.dart';
export './src/data/enums/image_source.dart';
export './src/data/models/ui/bottom_nav_item.dart';
export './src/data/models/ui/bottom_nav_style.dart';
export './src/data/models/ui/chip.model.dart';
export './src/data/models/ui/navigation_page.dart';
export './src/data/static/constants.dart';
export './src/utils/ui.dart';
export './src/widgets/export.dart';
export 'src/screens/export.dart';

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
