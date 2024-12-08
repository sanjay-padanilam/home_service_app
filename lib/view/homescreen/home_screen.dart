import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ismore = false;

  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: ismore ? 300 : 200,
            width: double.infinity,
            color: Colors.green,
            child: GridView.builder(
              itemCount: (ismore ? 11 : 8), // Ensure the button always fits
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                // Place the button in the last position
                if (index == (ismore ? 10 : 7)) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ismore = !ismore; // Toggle the grid state
                        });
                      },
                      child: Text(ismore ? "Show Less" : "Show More"),
                    ),
                  );
                }

                // Regular grid items
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.yellow,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
