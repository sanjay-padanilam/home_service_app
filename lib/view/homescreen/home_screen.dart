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
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 4,
                  width: size.width / 1,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        )),
        SliverToBoxAdapter(
          child: Text("Services"),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: ismore ? 300 : 200,
                width: double.infinity,
                color: Colors.green,
                child: GridView.builder(
                  itemCount: ismore ? 11 : 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ismore = !ismore;
                    setState(() {});
                  },
                  child: Text('seee more'))
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Text("other Services"),
        ),
        SliverToBoxAdapter(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 4,
                  width: size.width / 1,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        )),
      ],
    ));
  }
}
