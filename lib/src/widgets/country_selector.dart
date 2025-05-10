import 'package:flukit_core/flukit_core.dart';
import 'package:flukit_ui/src/data/enums/image_source.dart';
import 'package:flukit_ui/src/data/static/constants.dart';
import 'package:flukit_ui/src/widgets/export.dart';
import 'package:flukit_ui/src/widgets/image.dart';
import 'package:flukit_ui/src/widgets/inputs.dart';
import 'package:flukit_utils/flukit_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Widget for selecting a country in Flutter.
class FluCountrySelector extends StatefulWidget {
  /// Constructor for the FluCountrySelector widget.
  const FluCountrySelector({
    super.key,
    required this.countries,
    required this.exclude,
    required this.title,
    required this.description,
    this.onCountrySelected,
    this.titleStyle,
    this.descriptionStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
    this.flagSize = 60,
    this.flagCornerRadius = 25,
    this.searchField,
  });

  /// Callback function when a country is selected.
  final void Function(Country)? onCountrySelected;

  /// List of countries to display.
  final List<Country> countries;

  /// Description displayed under the title.
  final String description;

  /// Style for the description text.
  final TextStyle? descriptionStyle;

  /// Countries to exclude from the list.
  final List<Country> exclude;

  /// Corner radius of the flag icon.
  final double flagCornerRadius;

  /// Size of the flag icon.
  final double flagSize;

  /// Padding around the widget.
  final EdgeInsets padding;

  /// Title displayed at the top of the widget.
  final String title;

  /// Style for the title text.
  final TextStyle? titleStyle;

  /// Custom search field
  final Widget Function(TextEditingController)? searchField;

  @override
  State<FluCountrySelector> createState() => _FluCountrySelectorState();
}

class _FluCountrySelectorState extends State<FluCountrySelector> {
  late List<Country> _filteredCountries;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredCountries =
        widget.countries.where((c) => !widget.exclude.contains(c)).toList();

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        _filteredCountries = widget.countries
            .where(
              (country) =>
                  !widget.exclude.contains(country) &&
                  (country.name.toLowerCase().contains(query) ||
                      country.phoneCode.contains(query) ||
                      country.isoCode.toLowerCase().contains(query)),
            )
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Adds diagnostic properties for debugging.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // Add properties for debugging here
  }

  /// Builds the UI for the country selector widget.
  @override
  Widget build(BuildContext context) {
    // Build the UI including title, description, search field, and country list
    return SingleChildScrollView(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: M3FontSizes.headlineMedium,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ).merge(widget.titleStyle),
          ),
          const SizedBox(height: 3),
          Text(
            widget.description,
            style: widget.descriptionStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * .025),
            child: widget.searchField?.call(_searchController) ??
                const FluTextField(
                  hint: 'Search',
                ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredCountries.length,
            itemBuilder: (context, index) {
              final country = _filteredCountries[index];

              return FluButton(
                onPressed: () => widget.onCountrySelected?.call(country),
                padding: EdgeInsets.only(top: index == 0 ? 0 : 15),
                child: Row(
                  children: [
                    FluImage(
                      'icons/flags/png100px/${country.isoCode.toLowerCase()}.png',
                      package: 'country_icons',
                      imageSource: ImageSources.asset,
                      height: widget.flagSize,
                      square: true,
                      cornerRadius: widget.flagCornerRadius,
                      margin: const EdgeInsets.only(right: 15),
                    ),
                    Expanded(
                      child: Text(
                        country.name,
                        style: const TextStyle(
                          fontSize: M3FontSizes.bodyLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text('+${country.phoneCode}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
