import 'package:flutter/material.dart';

class SearchResultCategories extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategoryTap;
  final List<int> counts;
  final List<String?> suggestions; // Made optional with default value

  const SearchResultCategories({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
    required this.counts,
    this.suggestions = const [], // Default empty list
  }) : assert(categories.length == counts.length);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            final isSelected = index == selectedIndex;
            final count = counts[index];
            final suggestion = suggestions.isEmpty ? null : suggestions[index];

            return GestureDetector(
              onTap: () => onCategoryTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFFFF7A00)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF353535)
                        : const Color(0xFF7B7B7B),
                    fontSize: 14,
                    fontFamily: 'inriaSans',
                    fontWeight: FontWeight.w600,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        if (suggestion != null && suggestion.isNotEmpty)
                          TextSpan(
                            text: '($suggestion) ',
                            style: const TextStyle(
                              color: Color(0xFFFF7A00),
                              fontSize: 16,
                              fontFamily: 'inriaSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        TextSpan(
                            text: categories[index],
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF000000)
                                  : const Color(0xFF7B7B7B),
                              fontSize: 16,
                              fontFamily: 'inriaSans',
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            )),
                        TextSpan(
                          text: ' ($count)',
                          style: TextStyle(
                            color: isSelected
                                ? const Color(0xFF000000)
                                : const Color(0xFF7B7B7B),
                            fontSize: 16,
                            fontFamily: 'inriaSans',
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}