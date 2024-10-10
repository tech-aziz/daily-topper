// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../config/components/text_style.dart';
// import '../../../config/style/app_string.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimatedPageView(),
//     );
//   }
// }
//
// class AnimatedPageView extends StatefulWidget {
//   @override
//   _AnimatedPageViewState createState() => _AnimatedPageViewState();
// }
//
// class _AnimatedPageViewState extends State<AnimatedPageView> {
//   PageController _pageController = PageController();
//   bool isDrawerOpen = false; // Track if the drawer is open
//   double _drawerPosition = -1; // Initial position for the drawer
//
//   // List of images and text for the fixed 4 pages
//   final List<Map<String, String>> pages = [
//     {
//       'image':
//       'https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=600',
//       'details': 'Details of Image 1',
//     },
//     {
//       'image':
//       'https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&w=600',
//       'details': 'Details of Image 2',
//     },
//     {
//       'image':
//       'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=600',
//       'details': 'Details of Image 3',
//     },
//     {
//       'image':
//       'https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600',
//       'details': 'Details of Image 4',
//     },
//   ];
//
//   // Function to toggle drawer visibility
//   void toggleDrawer() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen;
//       _drawerPosition = isDrawerOpen ? 0 : -MediaQuery.of(context).size.width; // Update position
//     });
//   }
//
//   // Build individual pages
//   Widget _buildPage(BuildContext context, int index) {
//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         // Background image covering the top half of the screen
//         Container(
//           width: size.width,
//           height: size.height * 0.5,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: CachedNetworkImageProvider(pages[index]['image']!),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         // Main content area
//         Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 width: size.width,
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent, // Keep image visible
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         AppString.titleTextOne,
//                         style: textStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Animated bottom container
//             Expanded(
//               flex: 1,
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(26),
//                         topLeft: Radius.circular(26),
//                       ),
//                     ),
//                     height: size.height * .42,
//                     width: size.width,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     AppString.postedByPartOne,
//                                     style: textStyle(
//                                         color: Colors.black.withOpacity(0.4),
//                                         fontSize: 10),
//                                   ),
//                                   Text(
//                                     AppString.postedByName,
//                                     style: TextStyle(
//                                         color: Colors.black.withOpacity(0.8),
//                                         fontSize: 10),
//                                   ),
//                                   Text(
//                                     AppString.postedByPartTwo,
//                                     style: TextStyle(
//                                         color: Colors.black.withOpacity(0.4),
//                                         fontSize: 10),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 AppString.subTitleTextTwo,
//                                 style: textStyle(
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 12),
//                               Text(
//                                 AppString.sourceBy,
//                                 style: textStyle(
//                                     color: Colors.black.withOpacity(0.4),
//                                     fontSize: 10),
//                               ),
//                               const SizedBox(height: 20),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: InkWell(
//                         onTap: () {},
//                         child: Container(
//                           height: 60,
//                           width: size.width,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.black, // Background color
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Stack(
//                               children: [
//                                 // Image with opacity
//                                 Opacity(
//                                   opacity: 0.3,
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/images/sport1.png'),
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // Content over the image
//                                 Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Paris Olympiad 2024',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                             ),
//                                           ),
//                                           Text(
//                                             'Related News',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 8,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Container(
//                                         height: 32,
//                                         width: 32,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(100),
//                                           color: Colors.grey.withOpacity(0.5),
//                                         ),
//                                         child: Icon(
//                                           Icons.keyboard_arrow_right,
//                                           color: Colors.white,
//                                           size: 18,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: pages.length,
//             scrollDirection: Axis.vertical, // Set scroll direction to vertical
//             itemBuilder: (context, index) {
//               return _buildPage(context, index);
//             },
//           ),
//           // Drawer page
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 300),
//             left: _drawerPosition,
//             top: 0,
//             bottom: 0,
//             child: GestureDetector(
//               onTap: () {
//                 // Close the drawer on tap
//                 if (isDrawerOpen) {
//                   toggleDrawer();
//                 }
//               },
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.blue, // Background color for the drawer
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 220,
//                       color: Colors.white,
//                       child: const Center(
//                         child: Text(
//                           'Drawer Header',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.message),
//                       title: Text('Messages'),
//                       onTap: () {
//                         // Handle tap
//                       },
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.account_circle),
//                       title: Text('Profile'),
//                       onTap: () {
//                         // Handle tap
//                       },
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.settings),
//                       title: Text('Settings'),
//                       onTap: () {
//                         // Handle tap
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Gesture Detector for Swipe
//           GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               if (details.delta.dx > 0) {
//                 // Swipe right
//                 toggleDrawer();
//               } else if (details.delta.dx < 0 && isDrawerOpen) {
//                 // Swipe left (close drawer)
//                 toggleDrawer();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
