// import 'package:flutter/material.dart';
//
// class AnimatedScreen extends StatefulWidget {
//   const AnimatedScreen({Key? key}) : super(key: key);
//
//   @override
//   _AnimatedScreenState createState() => _AnimatedScreenState();
// }
//
// class _AnimatedScreenState extends State<AnimatedScreen>
//     with SingleTickerProviderStateMixin {
//   bool isTapped = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           setState(() {
//             isTapped = !isTapped; // Toggle between showing and hiding containers
//           });
//         },
//         child: Stack(
//           children: [
//             // Main content here (background or anything else)
//             Container(
//               width: size.width,
//               height: size.height,
//               color: Colors.blueAccent, // Just for background
//               child: const Center(
//                 child: Text(
//                   'Tap anywhere on the screen',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//
//             // Container sliding from the top
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 1500), // Slow animation
//               top: isTapped ? 0 : -150, // Moves container down when tapped
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 150,
//                 color: Colors.greenAccent,
//                 child: const Center(
//                   child: Text(
//                     'Sliding down from the top!',
//                     style: TextStyle(color: Colors.black, fontSize: 24),
//                   ),
//                 ),
//               ),
//             ),
//
//             // Container sliding from the bottom
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 1500), // Slow animation
//               bottom: isTapped ? 0 : -150, // Moves container up when tapped
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 150,
//                 color: Colors.orangeAccent,
//                 child: const Center(
//                   child: Text(
//                     'Sliding up from the bottom!',
//                     style: TextStyle(color: Colors.black, fontSize: 24),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(home: AnimatedScreen()));
// }
