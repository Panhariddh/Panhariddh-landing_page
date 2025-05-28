import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSearch;
  final VoidCallback onClear;

  const SearchBarWidget(
      {super.key,
      this.hintText = 'Find your interested course...',
      required this.onSearch,
      required this.onClear,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFC6C6C6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF6E6D79), size: 15),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(234, 149, 149, 151),
                    fontSize: 14,
                    fontFamily: 'inriaSans',
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) => onSearch(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Color(0xFF6E6D79), size: 15),
              onPressed: () {
                controller.clear();
                onClear();
              },
            ),
          ],
        ),
      ),
    );
  }
}