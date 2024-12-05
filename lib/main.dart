import 'package:flutter/material.dart';

void main() => runApp(const StaticApp());

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicScreen(),
    );
  }
}

class ImmutableWidget extends StatelessWidget {
  const ImmutableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(70), // Adjust padding as needed
        child: Transform.rotate(
          angle: 45 * 3.1415927 / 180, // Rotate by 45 degrees to create the diamond
          child: Container(
            width: 30, // Reduced the width
            height: 30, // Reduced the height
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 20), // Shadow below the diamond
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(60.0), // Adjust padding if needed
              child: _buildShinyCircle(), // Holds the circle inside the diamond
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildShinyCircle() {
  return Container(
    width: 10, // Reduced circle size
    height: 10, // Reduced circle size
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          Colors.lightBlueAccent,
          Colors.blueAccent,
        ],
        center: Alignment(-0.3, -0.5),
      ),
      boxShadow: [
        BoxShadow(blurRadius: 10),
      ],
    ),
  );
}

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Center(
          child: Text(
            'Welcome to Flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit, color: Colors.white), // Changed icon color to white
          ),
        ],
      ),
      body: const Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: ImmutableWidget(),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: const Center(
            child: Text("I'm a Drawer!"),
          ),
        ),
      ),
    );
  }
}
