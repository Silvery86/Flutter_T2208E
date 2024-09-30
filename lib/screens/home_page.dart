// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_t2208e/models/destination.dart';
import 'package:flutter_t2208e/screens/destination_list_screen.dart';
import '../services/api_service.dart';
import 'navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Destination>> futureDestinations;

  @override
  void initState() {
    super.initState();
    futureDestinations = ApiService().getAllDestinations();
  }

  int _currentIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
      // Handle navigation based on the selected index here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // Background container with search and welcome text
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple, // Background color
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16), // Border radius in bottom left
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Guy!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Where are you going next?',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    // Search box with white background
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Search your destination',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white, // White background for search field
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Buttons for selecting categories (Hotels, Flights, All)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle hotels button press
                    },
                    child: Text('Hotels'),
                    style: ElevatedButton.styleFrom(

                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle flights button press
                    },
                    child: Text('Flights'),
                    style: ElevatedButton.styleFrom(

                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle all button press
                    },
                    child: Text('All'),
                    style: ElevatedButton.styleFrom(

                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Top Destinations section
              Text(
                'Top Destinations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Displaying the list of destinations from futureDestinations
              DestinationList(futureDestinations: futureDestinations),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}
