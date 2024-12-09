import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: ''),
        NavigationDestination(icon: Icon(Icons.home), label: ''),
        NavigationDestination(icon: Icon(Icons.home), label: ''),
        NavigationDestination(icon: Icon(Icons.home), label: ''),
      ]),
      appBar: PreferredSize(
        preferredSize: size / 13,
        child: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Homescreen'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              CarouselSlider(
                  items: List.generate(
                    10,
                    (index) => Container(
                      height: 200,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                  options: CarouselOptions(autoPlay: true)),
              SizedBox(
                height: 20,
              ),
              Container(
                height: ismore ? 300 : 200,
                width: double.infinity,
                color: Colors.green,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
              CarouselSlider(
                  items: List.generate(
                    10,
                    (index) => Container(
                      height: 200,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                  options: CarouselOptions())
            ],
          ),
        ),
      ),
    );
  }
}
