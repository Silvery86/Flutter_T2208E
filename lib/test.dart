import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFDF2)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          // BoxDecoration takes the image
          decoration: BoxDecoration (
            // Image set to background of the body
            image: DecorationImage(
              image: AssetImage("assets/images/bg1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          // Use Center to center the child both vertically and horizontally
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20.0), // Padding inside the border
              width: 300.0,  // Set fixed width for the form container
              decoration: BoxDecoration(
                color: Colors.transparent,  // Optional background color inside the border
                borderRadius: BorderRadius.circular(10.0),  // Rounded corners
                border: Border.all(
                  color: Colors.white, // Border color
                  width: 2.0,          // Border width
                ),
              ),
              child: const MyCustomForm(),  // Your form widget
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Variable to toggle password visibility
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),  // Padding around the form
      constraints: BoxConstraints(
        maxWidth: 400,  // Set a maximum width for the form
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,  // Shrinks the Column's height to fit the content
        children: <Widget>[
          // Add the title at the top
          const Padding(
            padding: EdgeInsets.only(bottom: 24),  // Spacing for the title
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Username field with icon
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),  // Add icon for username
              ),
            ),
          ),
          // Password field with "Show Password" icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              obscureText: _obscureText,  // Toggles password visibility
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),  // Add icon for password
                suffixIcon: IconButton(
                  icon: Icon(
                    // Toggle icon based on obscureText state
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
          // Add a button at the bottom
          SizedBox(
            width: double.infinity,  // Make the button take full width
            child: ElevatedButton(
              onPressed: () {
                // Handle login button press
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.transparent, // Transparent background
                shadowColor: Colors.transparent,     // Remove the button shadow
                side: const BorderSide(color: Colors.white, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


