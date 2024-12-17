import 'package:flukit_ui/src/data/models/ui/chip.model.dart';
import 'package:flukit_ui/src/widgets/image.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double _defaultChipHeight = 62;
const Clip _defaultChipClipBehavior = Clip.hardEdge;
const EdgeInsets _defaultChipPadding = EdgeInsets.symmetric(horizontal: 20);

/// This class definition creates a widget called FluChips
/// that displays a list of chips.
class FluChips extends StatefulWidget {
  /// Constructor that initializes various properties
  /// and shuffles the chips if specified.
  FluChips({
    required this.chips,
    super.key,
    this.rows = 3,
    this.isScrollable = true,
    this.chipHeight = _defaultChipHeight,
    this.chipPadding = _defaultChipPadding,
    this.chipClipBehavior = _defaultChipClipBehavior,
    this.chipTextStyle,
    this.padding = EdgeInsets.zero,
    this.spacing = 8,
    this.runSpacing = 8,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.shuffle = false,
    this.scrollController,
    this.initialScrollOffset = 0.0,
    this.animationCurve = Curves.decelerate,
    this.animationDuration = const Duration(milliseconds: 300),
  }) {
    if (shuffle) chips.shuffle();
  }

  /// The curve of the animation for the chips
  final Curve animationCurve;

  /// The duration of the animation for the chips
  final Duration animationDuration;

  /// The clipping behavior for the chips
  final Clip chipClipBehavior;

  /// The height of each chip
  final double chipHeight;

  /// The padding around each chip
  final EdgeInsets chipPadding;

  /// The text style for the chips
  final TextStyle? chipTextStyle;

  /// The alignment of the chips in the cross axis
  final WrapCrossAlignment crossAxisAlignment;

  /// The initial scroll offset for the chips
  final double initialScrollOffset;

  /// The padding around the chips widget
  final EdgeInsets padding;

  /// The horizontal and vertical spacing between chips
  final double spacing;

  ///
  final double runSpacing;

  /// The controller for scrolling the chips
  final ScrollController? scrollController;

  /// Whether to shuffle the order of the chips
  final bool shuffle;

  /// The direction in which the chips are laid out
  final VerticalDirection verticalDirection;

  /// The list of chip models to display
  final List<FluChipModel> chips;

  /// Whether the chips can be scrolled horizontally
  final bool isScrollable;

  /// The number of rows to display if the chips are scrollable
  final int rows;

  @override
  State<FluChips> createState() => _FluChipsState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Curve>('animationCurve', animationCurve))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(EnumProperty<Clip>('chipClipBehavior', chipClipBehavior))
      ..add(DoubleProperty('chipHeight', chipHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('chipPadding', chipPadding))
      ..add(DiagnosticsProperty<TextStyle?>('chipTextStyle', chipTextStyle))
      ..add(
        EnumProperty<WrapCrossAlignment>(
          'crossAxisAlignment',
          crossAxisAlignment,
        ),
      )
      ..add(DoubleProperty('initialScrollOffset', initialScrollOffset))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DoubleProperty('spacing', spacing))
      ..add(DoubleProperty('runSpacing', runSpacing))
      ..add(
        DiagnosticsProperty<ScrollController?>(
          'scrollController',
          scrollController,
        ),
      )
      ..add(DiagnosticsProperty<bool>('shuffle', shuffle))
      ..add(
        EnumProperty<VerticalDirection>(
          'verticalDirection',
          verticalDirection,
        ),
      )
      ..add(IterableProperty<FluChipModel>('chips', chips))
      ..add(DiagnosticsProperty<bool>('isScrollable', isScrollable))
      ..add(IntProperty('rows', rows))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(EnumProperty<Clip>('chipClipBehavior', chipClipBehavior))
      ..add(DoubleProperty('chipHeight', chipHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('chipPadding', chipPadding))
      ..add(DiagnosticsProperty<TextStyle?>('chipTextStyle', chipTextStyle))
      ..add(
        EnumProperty<WrapCrossAlignment>(
          'crossAxisAlignment',
          crossAxisAlignment,
        ),
      )
      ..add(DoubleProperty('initialScrollOffset', initialScrollOffset))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DoubleProperty('spacing', spacing))
      ..add(DoubleProperty('runSpacing', runSpacing))
      ..add(
        DiagnosticsProperty<ScrollController?>(
          'scrollController',
          scrollController,
        ),
      )
      ..add(DiagnosticsProperty<bool>('shuffle', shuffle))
      ..add(
        EnumProperty<VerticalDirection>(
          'verticalDirection',
          verticalDirection,
        ),
      )
      ..add(IterableProperty<FluChipModel>('chips', chips))
      ..add(DiagnosticsProperty<bool>('isScrollable', isScrollable))
      ..add(IntProperty('rows', rows))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(EnumProperty<Clip>('chipClipBehavior', chipClipBehavior))
      ..add(DoubleProperty('chipHeight', chipHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('chipPadding', chipPadding))
      ..add(DiagnosticsProperty<TextStyle?>('chipTextStyle', chipTextStyle))
      ..add(
        EnumProperty<WrapCrossAlignment>(
          'crossAxisAlignment',
          crossAxisAlignment,
        ),
      )
      ..add(DoubleProperty('initialScrollOffset', initialScrollOffset))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DoubleProperty('spacing', spacing))
      ..add(DoubleProperty('runSpacing', runSpacing))
      ..add(
        DiagnosticsProperty<ScrollController?>(
          'scrollController',
          scrollController,
        ),
      )
      ..add(DiagnosticsProperty<bool>('shuffle', shuffle))
      ..add(
        EnumProperty<VerticalDirection>(
          'verticalDirection',
          verticalDirection,
        ),
      )
      ..add(IterableProperty<FluChipModel>('chips', chips))
      ..add(DiagnosticsProperty<bool>('isScrollable', isScrollable))
      ..add(IntProperty('rows', rows))
      ..add(
        DiagnosticsProperty<Duration>('animationDuration', animationDuration),
      )
      ..add(EnumProperty<Clip>('chipClipBehavior', chipClipBehavior))
      ..add(DoubleProperty('chipHeight', chipHeight))
      ..add(DiagnosticsProperty<EdgeInsets>('chipPadding', chipPadding))
      ..add(DiagnosticsProperty<TextStyle?>('chipTextStyle', chipTextStyle))
      ..add(
        EnumProperty<WrapCrossAlignment>(
          'crossAxisAlignment',
          crossAxisAlignment,
        ),
      )
      ..add(DoubleProperty('initialScrollOffset', initialScrollOffset))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DoubleProperty('spacing', spacing))
      ..add(DoubleProperty('runSpacing', runSpacing))
      ..add(
        DiagnosticsProperty<ScrollController?>(
          'scrollController',
          scrollController,
        ),
      )
      ..add(DiagnosticsProperty<bool>('shuffle', shuffle))
      ..add(
        EnumProperty<VerticalDirection>(
          'verticalDirection',
          verticalDirection,
        ),
      )
      ..add(IterableProperty<FluChipModel>('chips', chips))
      ..add(DiagnosticsProperty<bool>('isScrollable', isScrollable))
      ..add(IntProperty('rows', rows));
  }
}

class _FluChipsState extends State<FluChips> {
  late ScrollController scrollController;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ScrollController>(
        'scrollController',
        scrollController,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant FluChips oldWidget) {
    if (widget.isScrollable) initScroll();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
    if (widget.isScrollable) {
      WidgetsBinding.instance.addPostFrameCallback((_) async => initScroll());
    }
  }

  Future<void> initScroll() async => scrollController.animateTo(
        widget.initialScrollOffset,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );

  @override
  Widget build(BuildContext context) {
    if (!widget.isScrollable) {
      return Padding(
        padding: widget.padding,
        child: Wrap(
          spacing: widget.spacing,
          runSpacing: widget.runSpacing,
          crossAxisAlignment: widget.crossAxisAlignment,
          verticalDirection: widget.verticalDirection,
          children: widget.chips
              .map(
                (e) => FluChip(
                  chip: e,
                  padding: widget.chipPadding,
                  clipBehavior: widget.chipClipBehavior,
                  textStyle: widget.chipTextStyle,
                  height: widget.chipHeight,
                ),
              )
              .toList(),
        ),
      );
    } else {
      final chipsPerRow = (widget.chips.length / widget.rows).round();
      final chipsRows = <List<FluChipModel>>[];

      var chipsRest = widget.chips.length;

      for (var i = 0; i < widget.rows; i++) {
        if (widget.chips.length > chipsPerRow) {
          final row = <FluChipModel>[];
          final rangeStart = i * chipsPerRow;
          var rangeLimit = (i + 1) * chipsPerRow;

          final mustTakeTheRest = (chipsRest - chipsPerRow) <= 1;
          rangeLimit = mustTakeTheRest || (rangeLimit > widget.chips.length)
              ? widget.chips.length
              : rangeLimit;

          final range = widget.chips.getRange(rangeStart, rangeLimit).toList();

          for (var j = 0; j < range.length; j++) {
            row.add(range[j]);
          }

          chipsRows.add(row);
          chipsRest -= range.length;
          if (mustTakeTheRest) break;
        }
      }

      return SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: widget.padding,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: chipsRows
              .map(
                (row) => Padding(
                  padding: EdgeInsets.only(
                    top: chipsRows.indexOf(row) == 0 ? 0 : widget.runSpacing,
                  ),
                  child: Row(
                    children: row
                        .map(
                          (chip) => FluChip(
                            chip: chip,
                            padding: widget.chipPadding,
                            clipBehavior: widget.chipClipBehavior,
                            textStyle: widget.chipTextStyle,
                            height: widget.chipHeight,
                            margin: EdgeInsets.only(
                              left: row.indexOf(chip) == 0 ? 0 : widget.spacing,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
  }
}

/// Custom widget for displaying a FluChip
class FluChip extends StatelessWidget {
  /// Constructor for FluChip
  const FluChip({
    required this.chip,
    super.key,
    this.height = _defaultChipHeight,
    this.textStyle,
    this.clipBehavior = _defaultChipClipBehavior,
    this.padding = _defaultChipPadding,
    this.margin = EdgeInsets.zero,
  });

  /// The data model for the FluChip
  final FluChipModel chip;

  /// The clipping behavior
  final Clip clipBehavior;

  /// The height of the chip
  final double height;

  /// The padding of the chip
  final EdgeInsets padding;

  /// The margin of the chip
  final EdgeInsets margin;

  /// The text style for the chip
  final TextStyle? textStyle;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // Add diagnostic properties for the FluChip
    properties
      ..add(DiagnosticsProperty<FluChipModel>('chip', chip))
      ..add(EnumProperty<Clip>('clipBehavior', clipBehavior))
      ..add(DoubleProperty('height', height))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle));
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the width based on the FluChipModel data
    final width = (chip.image != null && chip.text == null) ? height * 2 : null;
    late final Widget child;

    // Determine the child widget based on the FluChipModel data
    child = chip.image != null
        ? FluImage(
            chip.image!,
            imageSource: chip.imageSource,
            height: double.infinity,
            width: double.infinity,
          )
        : Text(
            chip.text!,
            style: textStyle?.merge(chip.textStyle) ?? chip.textStyle,
          );

    // Construct and return the FluChip widget
    return UnconstrainedBox(
      child: Container(
        height: height,
        width: chip.width ?? width,
        alignment: Alignment.center,
        clipBehavior: clipBehavior,
        padding: chip.image == null
            ? padding.copyWith(
                top: 0,
                bottom: 0,
              )
            : EdgeInsets.zero,
        margin: margin,
        decoration: BoxDecoration(
          color: chip.outlined
              ? Colors.transparent
              : chip.color ??
                  context.colorScheme.surfaceContainer.withValues(alpha: .65),
          border: chip.outlined
              ? Border.all(
                  width: chip.strokeWidth,
                  color: chip.color ??
                      context.colorScheme.surfaceContainer
                          .withValues(alpha: .65),
                )
              : null,
          borderRadius: BorderRadius.circular(height * 2),
        ),
        child: child,
      ),
    );
  }
}
