// lib/widgets/destination_item.dart
import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationItem extends StatelessWidget {
  final Destination destination;

  const DestinationItem({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the card
      ),
      clipBehavior: Clip.antiAlias, // Ensure child widgets don't overflow
      child: Stack(
        children: [
          // Background image
          Image.network(
            destination.imageUrl,
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/placeholder.png'); // Placeholder image in your assets
            },
          ),
          // Favorite icon in the top right corner
          Positioned(
            top: 8,
            right: 8,
            child: destination.isFavorite
                ? Icon(Icons.favorite, color: Colors.red, size: 24)
                : Icon(Icons.favorite_border, color: Colors.white, size: 24),
          ),
          // Bottom left corner content
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Destination name
                Text(
                  destination.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
                // Rating with background and opacity
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // White background with 50% opacity
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow, // Yellow star color
                        size: 16, // Size of the star icon
                      ),
                      Text(
                        '${destination.rating}',
                        style: TextStyle(color: Colors.black), // Black text color for rating
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
