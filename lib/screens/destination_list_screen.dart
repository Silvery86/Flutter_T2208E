// lib/screens/destination_list.dart
import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_item.dart';

class DestinationList extends StatelessWidget {
  final Future<List<Destination>> futureDestinations;

  const DestinationList({Key? key, required this.futureDestinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
      future: futureDestinations,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No destinations found.'));
        }

        List<Destination> destinations = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return DestinationItem(destination: destinations[index]);
          },
        );
      },
    );
  }
}
