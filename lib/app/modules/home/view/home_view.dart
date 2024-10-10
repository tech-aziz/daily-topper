import 'package:daily_topper/app/config/style/color.dart';
import 'package:daily_topper/app/modules/home/view/home_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../categories/view/categories_view.dart';
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

  final List<CustomCategory> categoryList = [
    const CustomCategory(
        img: 'assets/images/img1.jpeg', title: 'International'),
    const CustomCategory(img: 'assets/images/img2.jpg', title: 'National'),
    const CustomCategory(img: 'assets/images/img2.jpg', title: 'Sports'),
    const CustomCategory(img: 'assets/images/img3.jpg', title: 'Politics'),
    const CustomCategory(img: 'assets/images/img4.jpg', title: 'Finance'),
    const CustomCategory(img: 'assets/images/img5.jpg', title: 'Entertainment'),
    const CustomCategory(img: 'assets/images/img6.jpg', title: 'International'),
    const CustomCategory(img: 'assets/images/img1.jpeg', title: 'National'),
    const CustomCategory(img: 'assets/images/img2.jpg', title: 'Sports'),
    const CustomCategory(img: 'assets/images/img3.jpg', title: 'Politics'),
    const CustomCategory(img: 'assets/images/img4.jpg', title: 'Finance'),
    const CustomCategory(img: 'assets/images/img5.jpg', title: 'Entertainment'),
    const CustomCategory(img: 'assets/images/img6.jpg', title: 'International'),
    const CustomCategory(img: 'assets/images/img1.jpeg', title: 'National'),
    const CustomCategory(img: 'assets/images/img2.jpg', title: 'Sports'),
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
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200, // Set height to 50
                width: double.infinity, // Set width to take up full screen
                alignment: Alignment.center, // Align the column to the center
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centers content vertically
                  children: [
                    Image.asset(
                      'assets/images/daily_topper.png',
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.trending_up_rounded,
                    color: Colors.black.withOpacity(0.6)),
                title: Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.black.withOpacity(0.6)),
                title: Text(
                  'Top 10 Today',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.network_locked_sharp,
                    color: Colors.black.withOpacity(0.6)),
                title: Text(
                  'Archived News',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.edit_note, color: Colors.black.withOpacity(0.6)),
                title: Text(
                  'Marked News',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context); // Closes the drawer
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Archived News',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const CategoriesView()),
                      child: Row(
                        children: [
                          Text(
                            'view all',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 25,
                            color: Colors.black..withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCategory(
                          img: categoryList[index].img,
                          title: categoryList[index].title,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: SizedBox(
                              height: 50,
                              width: 65,
                              child: Image.asset(
                                'assets/images/dummy.jpg',
                                fit: BoxFit.cover,
                              )),
                          title: const Text(
                            'কোটা সংস্কারের দাবিতে বঙ্গভবনে স্মারকলিপি দিলেন শিক্ষার্থীরা',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                ),
              )
            ],
          ),
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
            icon: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/person.png',
                      ),
                      fit: BoxFit.contain)),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
