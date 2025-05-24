import 'package:flutter/material.dart';

class ButtonNavigate extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ButtonNavigate(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 73,
      margin: const EdgeInsets.only(bottom: 10), // spacing from bottom
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFEE6019),
          unselectedItemColor: const Color(0xFF2F2F2F),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: 'Online Course',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers),
              label: 'Category',
            ),
          ],
        ),
      ),
    );
  }
}