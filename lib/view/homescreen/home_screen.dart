// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool ismore = false;

//   Widget build(BuildContext context) {
// var size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.search),
//       ),
//       bottomNavigationBar: NavigationBar(destinations: [
//         NavigationDestination(icon: Icon(Icons.home), label: ''),
//         NavigationDestination(icon: Icon(Icons.home), label: ''),
//         NavigationDestination(icon: Icon(Icons.home), label: ''),
//         NavigationDestination(icon: Icon(Icons.home), label: ''),
//       ]),
//       appBar: PreferredSize(
//         preferredSize: size / 13,
//         child: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('Homescreen'),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 backgroundColor: Colors.black,
//               ),
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
// CarouselSlider(
//     items: List.generate(
//       10,
//       (index) => Container(
//         height: size.height / 2,
//         width: size.width * 2 / 2.4,
//         color: Colors.red,
//       ),
//     ),
//     options:
//         CarouselOptions(autoPlay: true, enlargeCenterPage: true)),
// SizedBox(
//   height: 20,
// ),
//               Container(
//                 height: ismore ? 300 : 200,
//                 width: double.infinity,
//                 color: Colors.green,
//                 child: GridView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: (ismore ? 11 : 8), // Ensure the button always fits
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                   ),
//                   itemBuilder: (context, index) {
//                     // Place the button in the last position
//                     if (index == (ismore ? 10 : 7)) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               ismore = !ismore; // Toggle the grid state
//                             });
//                           },
//                           child: Text(ismore ? "Show Less" : "Show More"),
//                         ),
//                       );
//                     }

//                     // Regular grid items
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         color: Colors.yellow,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               CarouselSlider(
//                   items: List.generate(
//                     10,
//                     (index) => Container(
//                       height: 200,
//                       width: 300,
//                       color: Colors.red,
//                     ),
//                   ),
//                   options: CarouselOptions())
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
              child:
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  // ServiceTile('Electric', Icons.electric_bolt),
                  //     ServiceTile('Plumbing', Icons.plumbing),
                  //     ServiceTile('Cleaning', Icons.cleaning_services),
                  //     ServiceTile('Gardening', Icons.grass),
                  //     ServiceTile('Repairing', Icons.build),
                  //   ],
                  // ),
                  GridView.builder(
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
