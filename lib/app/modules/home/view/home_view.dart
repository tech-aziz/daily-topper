import 'package:daily_topper/app/config/style/color.dart';
import 'package:daily_topper/app/modules/home/view/home_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../screens/message_view.dart';
import '../../screens/notification_view.dart';
import '../../screens/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List screens = [
    const HomeBodyView(),
    const MessageView(),
    const NotificationView(),
    const ProfileView()
  ];

  @override
  void initState() {
    super.initState();

    // Set the status bar color and icon brightness
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make the status bar transparent
        statusBarIconBrightness:
        Brightness.light, // Light icons to remove shadows
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.3),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon:
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/person.png',),fit: BoxFit.contain)
              ),
            )
            ,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
