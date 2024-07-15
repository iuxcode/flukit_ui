import 'package:flukit_core/flukit_core.dart';
import 'package:flukit_ui/flukit_ui.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Create a button
class FluButton extends StatelessWidget {
  // ignore: public_member_api_docs
  const FluButton({
    required this.child,
    this.onPressed,
    this.color,
    this.foregroundColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.elevation = 0.0,
    this.filled = false,
    this.flat = false,
    this.loading = false,
    this.borderRadius,
    this.cornerRadius,
    this.replaceContentOnLoading = true,
    this.loadingText,
    this.loader,
    this.loaderOverlayColor,
    this.loaderColor,
    this.height,
    this.width,
    this.block = false,
    this.expand = false,
    this.boxShadow,
    this.alignment,
    this.splashColor,
    this.border,
    this.splashFactory,
    this.clipBehavior = Clip.none,
    super.key,
  });

  /// Create a button with icon content
  const factory FluButton.icon(
    FluIcons icon, {
    double iconSize,
    double iconStrokeWidth,
    FluIconStyles iconStyle,
    VoidCallback? onPressed,
    Color? color,
    Color? foregroundColor,
    EdgeInsets padding,
    EdgeInsets margin,
    double elevation,
    bool filled,
    bool flat,
    bool loading,
    bool replaceContentOnLoading,
    String? loadingText,
    BorderRadius? borderRadius,
    double? cornerRadius,
    Widget? loader,
    Color? loaderOverlayColor,
    Color? loaderColor,
    double? size,
    List<BoxShadow>? boxShadow,
    Alignment? alignment,
    Color? splashColor,
    BorderSide? border,
    InteractiveInkFeatureFactory? splashFactory,
  }) = _FluIconButton;

  /// Create a button with text content
  /// You can also add an icon before or after
  /// the text using `prefixIcon` and `suffixIcon`.
  /// Control icons sizes with `iconSize`,
  /// `prefixIconSize` and `suffixIconSize`.
  /// use `iconStyle` to choose your icon style. refer to [https://github.com/charles9904/flukit_icons] to learn more.
  /// `spacing` determine the space available between text and icon.
  const factory FluButton.text(
    String text, {
    FluIcons? prefixIcon,
    FluIcons? suffixIcon,
    double iconSize,
    double iconStrokeWidth,
    double? prefixIconSize,
    double? suffixIconSize,
    FluIconStyles iconStyle,
    double gap,
    VoidCallback? onPressed,
    Color? color,
    Color? foregroundColor,
    Color? iconColor,
    EdgeInsets padding,
    EdgeInsets margin,
    double elevation,
    bool filled,
    bool flat,
    bool loading,
    bool replaceContentOnLoading,
    String? loadingText,
    BorderRadius? borderRadius,
    double? cornerRadius,
    Widget? loader,
    Color? loaderOverlayColor,
    Color? loaderColor,
    double? height,
    double? width,
    bool block,
    bool expand,
    List<BoxShadow>? boxShadow,
    TextStyle? textStyle,
    Alignment? alignment,
    Color? splashColor,
    BorderSide? border,
    InteractiveInkFeatureFactory? splashFactory,
    bool spaceBetweenChildren,
  }) = _FluTextButton;

  /// The alignment of the button's content
  final AlignmentGeometry? alignment;

  /// The button color
  final Color? color;

  /// If true, the button will occupy the full width of its container
  final bool block;

  /// Creates a rounded rectangle border.
  final BorderSide? border;

  /// The button's border radius
  final BorderRadius? borderRadius;

  /// Add shadow to the button
  final List<BoxShadow>? boxShadow;

  /// The button content
  final Widget child;

  /// Define the clip behavior
  final Clip clipBehavior;

  /// The corner radius of the button corners
  final double? cornerRadius;

  /// The elevation of the button's
  final double elevation;

  /// If true, the button will occupy the full width of its container
  final bool expand;

  /// If true, the button will be filled with the [color] provided
  final bool filled;

  /// If true, the button will be flat
  /// A [TextButton] will be created
  final bool flat;

  /// Text color
  /// Also apply to icon if `iconColor` is not provided
  final Color? foregroundColor;

  /// Button height
  final double? height;

  /// Widget to display while loading
  final Widget? loader;

  /// Default loader color
  final Color? loaderColor;

  /// Default loader overlay color
  final Color? loaderOverlayColor;

  /// Is the button loading?
  final bool loading;

  /// Text to display while loading
  final String? loadingText;

  /// Outside space around the button
  final EdgeInsets margin;

  /// Handle onPressed event
  final VoidCallback? onPressed;

  /// Space around the button content
  final EdgeInsets padding;

  /// If true, the loader will not be displayed on top of the button content
  /// The content will be replaced by the content
  final bool replaceContentOnLoading;

  /// The highlight color that's typically used to indicate
  /// that the button is focused, hovered, or pressed.
  final Color? splashColor;

  /// Creates the [InkWell] splash factory,
  /// which defines the appearance of "ink" splashes
  /// that occur in response to taps.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The width of the button
  final double? width;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AlignmentGeometry?>('alignment', alignment))
      ..add(ColorProperty('backgroundColor', color))
      ..add(DiagnosticsProperty<bool>('block', block))
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('elevation', elevation))
      ..add(DiagnosticsProperty<bool>('expand', expand))
      ..add(DiagnosticsProperty<bool>('filled', filled))
      ..add(DiagnosticsProperty<bool>('flat', flat))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('loaderColor', loaderColor))
      ..add(ColorProperty('loaderOverlayColor', loaderOverlayColor))
      ..add(DiagnosticsProperty<bool>('loading', loading))
      ..add(StringProperty('loadingText', loadingText))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(
        DiagnosticsProperty<bool>(
          'replaceContentOnLoading',
          replaceContentOnLoading,
        ),
      )
      ..add(DoubleProperty('width', width))
      ..add(ColorProperty('splashColor', splashColor))
      ..add(DiagnosticsProperty<BorderSide?>('border', border))
      ..add(
        DiagnosticsProperty<InteractiveInkFeatureFactory?>(
          'splashFactory',
          splashFactory,
        ),
      )
      ..add(EnumProperty<Clip>('clipBehavior', clipBehavior))
      ..add(ColorProperty('backgroundColor', color))
      ..add(DiagnosticsProperty<bool>('block', block))
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('elevation', elevation))
      ..add(DiagnosticsProperty<bool>('expand', expand))
      ..add(DiagnosticsProperty<bool>('filled', filled))
      ..add(DiagnosticsProperty<bool>('flat', flat))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('loaderColor', loaderColor))
      ..add(ColorProperty('loaderOverlayColor', loaderOverlayColor))
      ..add(DiagnosticsProperty<bool>('loading', loading))
      ..add(StringProperty('loadingText', loadingText))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(
        DiagnosticsProperty<bool>(
          'replaceContentOnLoading',
          replaceContentOnLoading,
        ),
      )
      ..add(DoubleProperty('width', width))
      ..add(ColorProperty('splashColor', splashColor))
      ..add(DiagnosticsProperty<BorderSide?>('border', border))
      ..add(
        DiagnosticsProperty<InteractiveInkFeatureFactory?>(
          'splashFactory',
          splashFactory,
        ),
      )
      ..add(EnumProperty<Clip>('clipBehavior', clipBehavior))
      ..add(ColorProperty('backgroundColor', color))
      ..add(DiagnosticsProperty<bool>('block', block))
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('elevation', elevation))
      ..add(DiagnosticsProperty<bool>('expand', expand))
      ..add(DiagnosticsProperty<bool>('filled', filled))
      ..add(DiagnosticsProperty<bool>('flat', flat))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('loaderColor', loaderColor))
      ..add(ColorProperty('loaderOverlayColor', loaderOverlayColor))
      ..add(DiagnosticsProperty<bool>('loading', loading))
      ..add(StringProperty('loadingText', loadingText))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(
        DiagnosticsProperty<bool>(
          'replaceContentOnLoading',
          replaceContentOnLoading,
        ),
      )
      ..add(DoubleProperty('width', width))
      ..add(ColorProperty('splashColor', splashColor))
      ..add(DiagnosticsProperty<BorderSide?>('border', border))
      ..add(
        DiagnosticsProperty<InteractiveInkFeatureFactory?>(
          'splashFactory',
          splashFactory,
        ),
      )
      ..add(EnumProperty<Clip>('clipBehavior', clipBehavior))
      ..add(ColorProperty('backgroundColor', color))
      ..add(DiagnosticsProperty<bool>('block', block))
      ..add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius))
      ..add(IterableProperty<BoxShadow>('boxShadow', boxShadow))
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('elevation', elevation))
      ..add(DiagnosticsProperty<bool>('expand', expand))
      ..add(DiagnosticsProperty<bool>('filled', filled))
      ..add(DiagnosticsProperty<bool>('flat', flat))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('loaderColor', loaderColor))
      ..add(ColorProperty('loaderOverlayColor', loaderOverlayColor))
      ..add(DiagnosticsProperty<bool>('loading', loading))
      ..add(StringProperty('loadingText', loadingText))
      ..add(DiagnosticsProperty<EdgeInsets>('margin', margin))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(
        DiagnosticsProperty<bool>(
          'replaceContentOnLoading',
          replaceContentOnLoading,
        ),
      )
      ..add(DoubleProperty('width', width))
      ..add(ColorProperty('splashColor', splashColor))
      ..add(DiagnosticsProperty<BorderSide?>('border', border))
      ..add(
        DiagnosticsProperty<InteractiveInkFeatureFactory?>(
          'splashFactory',
          splashFactory,
        ),
      )
      ..add(EnumProperty<Clip>('clipBehavior', clipBehavior));
  }

  Widget _getChild(BuildContext context) => child;

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed != null
        ? () async {
            await Flu.triggerLightImpactHaptic();
            this.onPressed?.call();
          }
        : this.onPressed;
    final hasCustomSize = expand || block || height != null || width != null;

    final buttonStyle = ButtonStyle(
      fixedSize: WidgetStatePropertyAll(
        hasCustomSize ? Size.infinite : null,
      ),
      backgroundColor: WidgetStatePropertyAll(color),
      foregroundColor: WidgetStatePropertyAll(foregroundColor),
      overlayColor: WidgetStatePropertyAll(splashColor),
      padding: WidgetStatePropertyAll(padding),
      elevation: WidgetStatePropertyAll(boxShadow == null ? elevation : null),
      shape: borderRadius != null || cornerRadius != null || border != null
          ? WidgetStatePropertyAll(
              RoundedRectangleBorder(
                side: border ?? BorderSide.none,
                borderRadius:
                    borderRadius ?? BorderRadius.circular(cornerRadius ?? 99),
              ),
            )
          : null,
      alignment: alignment,
      splashFactory: splashFactory ?? InkRipple.splashFactory,
    );
    final defaultForegroundColor = _getButtonForegroundColor(
      context.colorScheme,
      disabled: onPressed == null,
      flat: flat,
      filled: filled,
    );
    final defaultOverlayColor = _getButtonOverlayColor(
      context.colorScheme,
      disabled: onPressed == null,
      flat: flat,
      filled: filled,
    );

    final loader = this.loader ??
        FluLoader(
          size: loadingText != null ? 14 : 18,
          strokeWidth: loadingText != null ? 1.5 : 2,
          color: loaderColor ?? foregroundColor ?? defaultForegroundColor,
          label: replaceContentOnLoading ? loadingText : null,
          labelStyle: TextStyle(color: foregroundColor),
        );
    Widget child;
    Widget button;

    if (loading && replaceContentOnLoading) {
      child = loader;
    } else {
      child = _getChild(context);
    }

    if (loading && !replaceContentOnLoading) {
      child = Opacity(opacity: .45, child: child);
    }

    if (elevation > 0 && !flat && !filled) {
      button = ElevatedButton(
        onPressed: onPressed,
        clipBehavior: clipBehavior,
        style: buttonStyle,
        child: child,
      );
    } else if (flat) {
      button =
          TextButton(onPressed: onPressed, style: buttonStyle, child: child);
    } else if (filled) {
      button = FilledButton(
        onPressed: onPressed,
        clipBehavior: clipBehavior,
        style: buttonStyle,
        child: child,
      );
    } else {
      button = FilledButton.tonal(
        onPressed: onPressed,
        clipBehavior: clipBehavior,
        style: buttonStyle,
        child: child,
      );
    }

    if (loading && !replaceContentOnLoading) {
      button = Stack(
        alignment: AlignmentDirectional.center,
        children: [
          button,
          Positioned.fill(
            /// TODO(iuxcode): Fix sizing issue
            child: FluGlass(
              borderRadius: borderRadius,
              cornerRadius: cornerRadius ?? 99,
              intensity: 1,
              child: ColoredBox(
                color: loaderOverlayColor ??
                    defaultOverlayColor.withOpacity(filled ? .15 : .55),
                child: loader,
              ),
            ),
          ),
        ],
      );
    }

    if (margin != EdgeInsets.zero || hasCustomSize || boxShadow != null) {
      BoxDecoration? decoration;

      if (boxShadow != null) {
        decoration = BoxDecoration(
          boxShadow: boxShadow,
          borderRadius:
              borderRadius ?? BorderRadius.circular(cornerRadius ?? 999),
        );
      }

      return Container(
        height: expand ? double.infinity : height,
        width: expand || block ? double.infinity : width,
        margin: margin,
        decoration: decoration,
        clipBehavior: decoration != null ? Clip.antiAlias : Clip.none,
        child: button,
      );
    }

    return button;
  }
}

class _FluIconButton extends FluButton {
  const _FluIconButton(
    this.icon, {
    this.iconSize = 20,
    this.iconStrokeWidth = 1.5,
    this.iconStyle = FluIconStyles.twotone,
    super.onPressed,
    super.color,
    super.foregroundColor,
    super.padding = EdgeInsets.zero,
    super.margin = EdgeInsets.zero,
    super.elevation = 0.0,
    super.filled = false,
    super.flat = false,
    super.loading = false,
    super.replaceContentOnLoading = true,
    super.loadingText,
    super.borderRadius,
    super.cornerRadius,
    super.loader,
    super.loaderOverlayColor,
    super.loaderColor,
    this.size,
    super.boxShadow,
    super.alignment,
    super.splashColor,
    super.border,
    super.splashFactory,
  }) : super(child: const SizedBox(), height: size, width: size);

  final FluIcons icon;
  final double iconSize;
  final double iconStrokeWidth;
  final FluIconStyles iconStyle;
  final double? size;

  @override
  Widget _getChild(BuildContext context) => FluIcon(
        icon,
        size: iconSize,
        style: iconStyle,
        strokeWidth: iconStrokeWidth,
        color: foregroundColor ??
            _getButtonForegroundColor(
              context.colorScheme,
              flat: flat,
              filled: filled,
              disabled: onPressed == null,
            ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<FluIcons>('icon', icon))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(DoubleProperty('size', size))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(DoubleProperty('size', size))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(DoubleProperty('size', size))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(DoubleProperty('size', size));
  }
}

class _FluTextButton extends FluButton {
  const _FluTextButton(
    this.text, {
    super.onPressed,
    super.color,
    super.foregroundColor,
    super.padding = EdgeInsets.zero,
    super.margin = EdgeInsets.zero,
    super.elevation = 0.0,
    super.filled = false,
    super.flat = false,
    super.loading = false,
    super.replaceContentOnLoading = true,
    super.loadingText,
    super.borderRadius,
    super.cornerRadius,
    super.loader,
    super.loaderOverlayColor,
    super.loaderColor,
    super.height,
    super.width,
    super.block = false,
    super.expand = false,
    super.boxShadow,
    super.alignment,
    super.splashColor,
    super.border,
    this.iconSize = 20,
    this.iconStyle = FluIconStyles.twotone,
    this.gap = 6.0,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconSize,
    this.suffixIconSize,
    this.iconStrokeWidth = 1.5,
    super.splashFactory,
    this.iconColor,
    this.spaceBetweenChildren = false,
  }) : super(child: const SizedBox());

  final double gap;
  final Color? iconColor;
  final double iconSize;
  final double iconStrokeWidth;
  final FluIconStyles iconStyle;
  final FluIcons? prefixIcon;
  final double? prefixIconSize;
  final bool spaceBetweenChildren;
  final FluIcons? suffixIcon;
  final double? suffixIconSize;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget _getChild(BuildContext context) {
    final foregroundColor = this.foregroundColor ??
        _getButtonForegroundColor(
          context.colorScheme,
          flat: flat,
          filled: filled,
          disabled: onPressed == null,
        );

    final Widget textWidget = Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.bodyMedium
          ?.copyWith(color: foregroundColor, fontWeight: FontWeight.w600)
          .merge(textStyle),
    );

    if (prefixIcon != null || suffixIcon != null) {
      /// Todo(iuxcode): Optimize rendering conditions
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null)
            _buildIcon(
              prefixIcon!,
              iconColor ?? foregroundColor,
              prefixIconSize,
            ),
          if (spaceBetweenChildren && prefixIcon != null && suffixIcon != null)
            const Spacer(),
          if (spaceBetweenChildren &&
              (prefixIcon != null && suffixIcon == null ||
                  prefixIcon == null && suffixIcon != null))
            Expanded(child: textWidget)
          else
            Flexible(child: textWidget),
          if (spaceBetweenChildren && suffixIcon != null && prefixIcon != null)
            const Spacer(),
          if (suffixIcon != null)
            _buildIcon(
              suffixIcon!,
              iconColor ?? foregroundColor,
              suffixIconSize,
            ),
        ],
      );
    }

    return textWidget;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('gap', gap))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(EnumProperty<FluIcons?>('prefixIcon', prefixIcon))
      ..add(DoubleProperty('prefixIconSize', prefixIconSize))
      ..add(EnumProperty<FluIcons?>('suffixIcon', suffixIcon))
      ..add(DoubleProperty('suffixIconSize', suffixIconSize))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(
        DiagnosticsProperty<bool>(
          'spaceBetweenChildren',
          spaceBetweenChildren,
        ),
      )
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(EnumProperty<FluIcons?>('prefixIcon', prefixIcon))
      ..add(DoubleProperty('prefixIconSize', prefixIconSize))
      ..add(EnumProperty<FluIcons?>('suffixIcon', suffixIcon))
      ..add(DoubleProperty('suffixIconSize', suffixIconSize))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(
        DiagnosticsProperty<bool>(
          'spaceBetweenChildren',
          spaceBetweenChildren,
        ),
      )
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(EnumProperty<FluIcons?>('prefixIcon', prefixIcon))
      ..add(DoubleProperty('prefixIconSize', prefixIconSize))
      ..add(EnumProperty<FluIcons?>('suffixIcon', suffixIcon))
      ..add(DoubleProperty('suffixIconSize', suffixIconSize))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(
        DiagnosticsProperty<bool>(
          'spaceBetweenChildren',
          spaceBetweenChildren,
        ),
      )
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DoubleProperty('iconStrokeWidth', iconStrokeWidth))
      ..add(EnumProperty<FluIconStyles>('iconStyle', iconStyle))
      ..add(EnumProperty<FluIcons?>('prefixIcon', prefixIcon))
      ..add(DoubleProperty('prefixIconSize', prefixIconSize))
      ..add(EnumProperty<FluIcons?>('suffixIcon', suffixIcon))
      ..add(DoubleProperty('suffixIconSize', suffixIconSize))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(
        DiagnosticsProperty<bool>(
          'spaceBetweenChildren',
          spaceBetweenChildren,
        ),
      );
  }

  Widget _buildIcon(FluIcons icon, Color color, double? size) => FluIcon(
        icon,
        style: iconStyle,
        size: size ?? iconSize,
        strokeWidth: iconStrokeWidth,
        color: color,
        margin: EdgeInsets.only(
          right: prefixIcon != null && !spaceBetweenChildren ? gap : 0,
          left: suffixIcon != null && !spaceBetweenChildren ? gap : 0,
        ),
      );
}

/// Return background color according to M3 button specs
/// https://m3.material.io/components/buttons/specs
Color _getButtonOverlayColor(
  ColorScheme colorScheme, {
  required bool flat,
  required bool filled,
  required bool disabled,
  double elevation = 0.0,
}) {
  if (disabled) {
    return colorScheme.surface;
  } else if (elevation > 0 && !flat && !filled) {
    return colorScheme.surface;
  } else if (flat) {
    return colorScheme.surface;
  } else if (filled) {
    return colorScheme.primary;
  } else {
    return colorScheme.secondaryContainer;
  }
}

/// Return foreground color according to M3 button specs
/// https://m3.material.io/components/buttons/specs
Color _getButtonForegroundColor(
  ColorScheme colorScheme, {
  required bool flat,
  required bool filled,
  required bool disabled,
  double elevation = 0.0,
}) {
  if (disabled) {
    return colorScheme.onSurface;
  } else if (elevation > 0 && !flat && !filled) {
    return colorScheme.onSurface;
  } else if (flat) {
    return colorScheme.primary;
  } else if (filled) {
    return colorScheme.onPrimary;
  } else {
    return colorScheme.onSecondaryContainer;
  }
}
