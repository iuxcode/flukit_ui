import 'package:flukit_widgets/src/data/enums/image_source.dart';
import 'package:flutter/material.dart';

/// Represents a model for a chip widget.
class FluChipModel {
  /// Creates a FluChipModel instance.
  FluChipModel({
    this.text,
    this.image,
    this.imageSource = ImageSources.network,
    this.type = FluChipType.base,
    this.textStyle,
    this.outlined = false,
    this.strokeWidth = 1.5,
    this.color,
    this.width,
    this.padding,
  }) : assert(
          image != null || text != null,
          'Chip must have either image or text',
        );

  /// The color of the chip.
  final Color? color;

  /// The image to display on the chip.
  final String? image;

  /// The source of the image for the chip.
  final ImageSources imageSource;

  /// Whether the chip is outlined.
  final bool outlined;

  /// The padding of the chip.
  final EdgeInsets? padding;

  /// The width of the chip's outline stroke.
  final double strokeWidth;

  /// The text to display on the chip.
  final String? text;

  /// The style of the text on the chip.
  final TextStyle? textStyle;

  /// The type of the chip.
  final FluChipType type;

  /// The width of the chip.
  final double? width;
}

/// Enum representing different types of FluChip.
enum FluChipType {
  /// The base type of FluChip.
  base,

  /// The avatar type of FluChip.
  avatar,
}
