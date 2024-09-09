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
          title: Text('Recipe'),
          backgroundColor: Color(0xFFFFFDF2),
        ),
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/pizza.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Strawberry Pavlova',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
                              'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star_half, color: Colors.yellow),
                            SizedBox(width: 8.0),
                            Text('170 Reviews'),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(height: 4.0),
                                Text('PREP:\n25 min', textAlign: TextAlign.center),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.kitchen),
                                SizedBox(height: 4.0),
                                Text('COOK:\n1 hr', textAlign: TextAlign.center),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.restaurant_sharp),
                                SizedBox(height: 4.0),
                                Text('FEEDS:\n4-6', textAlign: TextAlign.center),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}