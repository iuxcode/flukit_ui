import 'package:flukit_icons/flukit_icons.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Customizable and stylized text input field using Flukit styling.
///
/// `FluTextField` supports features like custom icons, expandable height,
/// loading states (with a suffix loader), maximum height constraints with scrolling,
/// focus management, and dynamic theming using your app's `ColorScheme` and `TextTheme`.
///
/// This widget aims to provide a visually polished, flexible, and extensible text input
/// without breaking Material Design rules while still being lighter and easy to maintain.
class FluTextField extends StatefulWidget {
  /// Creates a `FluTextField` instance.
  ///
  /// [hint] is required and displays a placeholder text.
  const FluTextField({
    super.key,
    required this.hint,
    this.inputController,
    this.focusNode,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.selectionControls,
    this.expand = false,
    this.obscureText = false,
    this.autofocus = false,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.cornerRadius,
    this.borderWidth,
    this.boxShadow,
    this.color,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.textStyle,
    this.hintStyle,
    this.hintColor,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.iconSize = 20,
    this.iconStrokeWidth = 1.6,
    this.iconStyle = FluIconStyles.twotone,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.keyboardType,
    this.inputAction = TextInputAction.done,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.counterText,
    this.hideCounterText = false,
    this.maxHeight,
    this.showScrollbar = true,
    this.isLoading = false,
  });

  /// The hint text displayed when the field is empty.
  final String hint;

  /// Controller for the text being edited.
  final TextEditingController? inputController;

  /// Focus node for controlling the focus manually.
  final FocusNode? focusNode;

  /// List of input formatters to apply to the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Validator function for form validation.
  final String? Function(String?)? validator;

  /// Called when the field's value changes.
  final void Function(String)? onChanged;

  /// Called when the user submits the field (e.g., presses Enter).
  final void Function(String)? onFieldSubmitted;

  /// Called when the field is tapped.
  final VoidCallback? onTap;

  /// Provides custom text selection controls (e.g., copy, paste).
  final TextSelectionControls? selectionControls;

  /// Whether the field should expand vertically infinitely.
  final bool expand;

  /// Whether the field should obscure the text (for passwords).
  final bool obscureText;

  /// Whether the field should autofocus on screen load.
  final bool autofocus;

  /// Margin around the entire field.
  final EdgeInsets margin;

  /// Inner padding between the text and the field border.
  final EdgeInsets? padding;

  /// Custom fill color for the background.
  final Color? fillColor;

  /// Border color if a border is applied.
  final Color? borderColor;

  /// Custom border radius if you want to override the default rounded corners.
  final BorderRadius? borderRadius;

  /// Border width if you want to apply a border.
  final double? borderWidth;

  /// Corner radius (used if no custom `borderRadius` is provided).
  final double? cornerRadius;

  /// Box shadow to apply around the field container.
  final List<BoxShadow>? boxShadow;

  /// Text color override.
  final Color? color;

  /// Custom cursor color.
  final Color? cursorColor;

  /// Custom cursor height.
  final double? cursorHeight;

  /// Custom cursor width.
  final double cursorWidth;

  /// Custom text style override.
  final TextStyle? textStyle;

  /// Custom hint style override.
  final TextStyle? hintStyle;

  /// Custom hint text color override.
  final Color? hintColor;

  /// A custom widget placed before the text input (higher priority than prefixIcon).
  final Widget? prefix;

  /// A custom widget placed after the text input (higher priority than suffixIcon).
  final Widget? suffix;

  /// A Flukit icon to place as a prefix.
  final FluIcons? prefixIcon;

  /// A Flukit icon to place as a suffix.
  final FluIcons? suffixIcon;

  /// Color for the icons (prefix/suffix).
  final Color? iconColor;

  /// Size for prefix and suffix icons.
  final double iconSize;

  /// Stroke width for Flukit icons.
  final double iconStrokeWidth;

  /// Style for Flukit icons.
  final FluIconStyles iconStyle;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical textAlignVertical;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The action button on the soft keyboard.
  final TextInputAction inputAction;

  /// Maximum number of lines allowed.
  final int? maxLines;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// How to enforce maxLength (e.g., truncate or prevent).
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Custom counter text under the field.
  final String? counterText;

  /// Hide the character counter.
  final bool hideCounterText;

  /// Maximum height for the field before scrolling inside.
  final double? maxHeight;

  /// Whether to show a scrollbar when scrolling.
  final bool showScrollbar;

  /// Whether to display a loading indicator instead of the suffix.
  final bool isLoading;

  @override
  State<FluTextField> createState() => _FluTextFieldState();
}

class _FluTextFieldState extends State<FluTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  /// Builds the main widget tree.
  @override
  Widget build(BuildContext context) {
    final bool isExpanding = widget.expand && !widget.obscureText;
    final bool isPassword = widget.obscureText;

    final textField = TextFormField(
      controller: widget.inputController,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      expands: isExpanding,
      maxLines: isExpanding
          ? null
          : isPassword
              ? 1
              : widget.maxLines,
      minLines: isExpanding
          ? null
          : isPassword
              ? 1
              : 1,
      obscureText: isPassword,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.inputAction,
      selectionControls: widget.selectionControls,
      style: _effectiveTextStyle,
      cursorColor: widget.cursorColor ?? context.colorScheme.primary,
      cursorHeight: widget.cursorHeight,
      cursorWidth: widget.cursorWidth,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      decoration: _buildInputDecoration(),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onTapOutside: (_) => _focusNode.unfocus(),
    );

    final bool needsContainer = widget.boxShadow != null ||
        widget.margin != EdgeInsets.zero ||
        widget.borderRadius != null ||
        widget.cornerRadius != null;

    Widget finalField = needsContainer
        ? Container(
            margin: widget.margin,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: widget.boxShadow,
              border: widget.borderWidth != null
                  ? Border.all(
                      color: widget.borderColor ??
                          context.colorScheme.surface.withValues(alpha: 0.05),
                      width: widget.borderWidth!,
                    )
                  : null,
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular(widget.cornerRadius ?? 99),
            ),
            child: textField,
          )
        : textField;

    if (widget.maxHeight != null) {
      final scrollContent = widget.showScrollbar
          ? Scrollbar(child: SingleChildScrollView(child: finalField))
          : SingleChildScrollView(child: finalField);

      return Container(
        color: widget.fillColor ?? context.colorScheme.surfaceContainer,
        constraints: BoxConstraints(maxHeight: widget.maxHeight!),
        child: scrollContent,
      );
    }

    return finalField;
  }

  /// Builds the input decoration for the text field.
  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      fillColor: widget.fillColor ?? context.colorScheme.surfaceContainer,
      filled: true,
      hintText: widget.hint,
      hintStyle: _effectiveTextStyle
          .copyWith(
            color: widget.hintColor ?? context.colorScheme.onSurfaceVariant,
          )
          .merge(widget.hintStyle),
      errorStyle: const TextStyle(height: 0, color: Colors.transparent),
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: _buildSuffixIcon(),
      counterText: widget.hideCounterText ? '' : widget.counterText,
      contentPadding:
          widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
    );
  }

  /// Gets the effective merged text style.
  TextStyle get _effectiveTextStyle {
    return context.textTheme.bodyMedium!
        .copyWith(color: widget.color ?? context.colorScheme.onSurfaceVariant)
        .merge(widget.textStyle);
  }

  /// Builds the prefix icon widget if needed.
  Widget? _buildPrefixIcon() {
    if (widget.prefix != null) return widget.prefix;
    if (widget.prefixIcon != null) {
      return FluIcon(
        widget.prefixIcon!,
        color: widget.iconColor ?? context.colorScheme.onSurface,
        size: widget.iconSize,
        strokeWidth: widget.iconStrokeWidth,
        style: widget.iconStyle,
      );
    }
    return null;
  }

  /// Builds the suffix icon widget or a loading spinner if `isLoading` is true.
  Widget? _buildSuffixIcon() {
    if (widget.isLoading) {
      return Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        child: SizedBox(
          height: 14,
          width: 14,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    if (widget.suffix != null) return widget.suffix;
    if (widget.suffixIcon != null) {
      return FluIcon(
        widget.suffixIcon!,
        color: widget.iconColor ?? context.colorScheme.onSurface,
        size: widget.iconSize,
        strokeWidth: widget.iconStrokeWidth,
        style: widget.iconStyle,
      );
    }
    return null;
  }
}
