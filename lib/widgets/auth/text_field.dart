import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isDarkMode;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isDarkMode ? Colors.grey.shade700 : const Color(0xFFE1E1E1);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final hintColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textColor),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, color: textColor) : null,
          suffixIcon:
              suffixIcon != null ? Icon(suffixIcon, color: textColor) : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: isDarkMode,
          fillColor: isDarkMode ? Colors.grey.shade900 : null,
        ),
      ),
    );
  }
}