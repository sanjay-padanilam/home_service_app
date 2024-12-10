import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/view/homescreen/widgets/Service_tile.dart';
import 'package:home_service_app/view/homescreen/widgets/recent_work_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Service App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          // Services Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Our Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 200,
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) =>
                    ServiceTile('Electric', Icons.electric_bolt),
              )),
          // Top Deals Slider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                //   Text(
                //     'Top Deals',
                //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Container(
                //   height: 200,
                //   child: PageView(
                //     children: [
                //       DealCard('Electric Service Discount',
                //           'Save 20% on Electric Service'),
                //       DealCard('Plumbing Service Discount', 'Save 15% on Plumbing'),
                //       DealCard('Cleaning Service Discount', 'Save 10% on Cleaning'),
                //       DealCard('Gardening Service Discount', 'Save 25% on Gardening'),
                //     ],
                //   ),
                CarouselSlider(
                    items: List.generate(
                      10,
                      (index) => Container(
                        height: size.height / 2,
                        width: size.width * 2 / 2.4,
                        color: Colors.black,
                      ),
                    ),
                    options: CarouselOptions(
                        autoPlay: true, enlargeCenterPage: true)),
          ),
          // Recent Work Ratings Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Work & Ratings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          RecentWorkTile('John Doe', 'Electrician', 4.5),
          RecentWorkTile('Jane Smith', 'Plumber', 4.7),
          RecentWorkTile('Robert Brown', 'Cleaner', 4.0),
          RecentWorkTile('Emily White', 'Gardener', 4.8),
        ],
      ),
    );
  }
}
