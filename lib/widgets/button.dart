import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final double iconSize;
  final double fontSize;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 20,
    this.color = const Color(0xFFEE6019),
    this.textColor = Colors.white,
    this.leftIcon,
    this.rightIcon,
    this.iconSize = 20,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null) ...[
              Icon(leftIcon, color: textColor, size: 20),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  fontFamily: 'inriaSans',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (rightIcon != null) ...[
              const SizedBox(width: 8),
              Icon(rightIcon, color: textColor, size: iconSize),
            ],
          ],
        ),
      ),
    );
  }
}