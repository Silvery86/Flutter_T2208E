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
      child: Column(
        children: [
          Image.network(destination.imageUrl, fit: BoxFit.cover, height: 100, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(destination.name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text('${destination.rating} ★', style: TextStyle(color: Colors.grey)),
          if (destination.isFavorite)
            Icon(Icons.favorite, color: Colors.red, size: 16),
        ],
      ),
    );
  }
}
