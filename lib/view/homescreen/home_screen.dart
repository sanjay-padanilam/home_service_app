import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("homescren"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Search..'),
          ),
          Flexible(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 14,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(),
                title: Text('text'),
                subtitle: Text('text'),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        // NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
      ]),
    );
  }
}
