// lib/screens/navbar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildNavItem(Icons.home, 'Home', 0),
        _buildNavItem(Icons.search, 'Search', 1),
        _buildNavItem(Icons.luggage_rounded, 'Order', 2),
        _buildNavItem(Icons.person, 'Profile', 3),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue, // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      backgroundColor: Colors.white, // Background color of the nav bar
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = index == currentIndex; // Check if this item is selected

    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding for the icon and text background
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent, // Background color based on selection
          borderRadius: BorderRadius.circular(12), // Border radius for the background
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey), // Change icon color based on selection
            if (isSelected) ...[ // Only show text if this item is selected
              SizedBox(width: 4), // Space between icon and text
              Text(
                label,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
      label: '', // Set label to empty since it's handled in the custom widget
    );
  }

}




