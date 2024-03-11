library flukit_widgets;

import 'package:flukit_core/flukit_core.dart';

export 'package:flukit_icons/flukit_icons.dart';
export 'package:flukit_widgets/src/utils/ui.dart';

export './src/widgets/avatar.dart';
export './src/widgets/avatar_group.dart';
export './src/widgets/badge.dart';
export './src/widgets/bottom_navigation.dart';
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

class WidgetService {
  final Flukit fluInstance;

  WidgetService(this.fluInstance);
}

final WidgetService widgetService = WidgetService(Flu);
