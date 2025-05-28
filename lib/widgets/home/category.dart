import 'package:flutter/material.dart';

class HorizontalCategory extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategoryTap;

  const HorizontalCategory({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: List.generate(categories.length, (index) {
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onCategoryTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  child: Text(categories[index]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}