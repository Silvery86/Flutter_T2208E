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
      body: SafeArea( // Add SafeArea here
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Background container with search and welcome text
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.blueAccent], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
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
                      SizedBox(height: 30),
                      // Search box with white background
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color for search field
                          borderRadius: BorderRadius.circular(12), // Set border radius
                        ),
                        child: Row( // Use Row to allow the TextField to expand
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0), // Add padding to the left and right of the icon
                              child: Icon(Icons.search), // Icon placed outside of TextField
                            ),
                            Expanded( // This allows the TextField to expand
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Search your destination',
                                  border: InputBorder.none, // Remove the border
                                  filled: true,
                                  fillColor: Colors.transparent, // Make the fill color transparent
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0), // Add padding for better touch target
                                ),
                                style: TextStyle(fontSize: 16.0), // Optional: Adjust text style
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Buttons for selecting categories (Hotels, Flights, All)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Hotels button with text outside
                    Column(
                      children: [
                        Container(
                          width: 110, // Set a width and height to make it more square
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle hotels button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellowAccent.withOpacity(0.5), // Background color for Hotels
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded square shape
                              ),
                            ),
                            child: Icon(
                              Icons.hotel_sharp, // Building icon for hotels
                              size: 25,
                              color: Colors.orange, // Icon color for contrast
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hotels',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // Flights button with text outside
                    Column(
                      children: [
                        Container(
                          width: 100, // Set a width and height to make it more square
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle flights button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded square shape
                              ),
                            ),
                            child: Icon(
                              Icons.flight, // Airplane icon for flights
                              size: 25,
                              color: Colors.red, // Icon color for contrast
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Flights',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // All button with text outside
                    Column(
                      children: [
                        Container(
                          width: 100, // Set a width and height to make it more square
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle all button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.withOpacity(0.5), // Background color for All
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded square shape
                              ),
                            ),
                            child: Icon(
                              Icons.apartment, // Building with airplane icon for all
                              size: 25,
                              color: Colors.green, // Icon color for contrast
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'All',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Popular Destinations section
                Text(
                  'Popular Destinations',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                // Displaying the list of destinations from futureDestinations
                DestinationList(futureDestinations: futureDestinations),
              ],
            ),
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
