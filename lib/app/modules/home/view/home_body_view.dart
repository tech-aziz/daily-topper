import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/components/custom_container.dart';
import '../../../config/components/text_style.dart';
import '../../../config/style/app_string.dart';
import '../../screens/screen1/view/screen1_view.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView>
    with SingleTickerProviderStateMixin {
  bool isTapped = false; // Controls whether AppBar and bottom widget show
  late TabController tabController;
  List<String> items = ['All', 'Trending', 'Reels', 'Insights', 'Album'];
  int selectedIndex = 0;
  int selectedIndexBottom = -1;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void toggleTap() {
    setState(() {
      isTapped =
          !isTapped; // Toggle between showing and hiding AppBar/bottom part
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Custom container widget for each item
  Widget customContainer({required String text, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = items.indexOf(text); // Update the selected index
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.black
              : Colors.transparent, 
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.2))// Black background when selected
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            // White text if selected, black otherwise
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }



  // Custom container widget for the bottom icons
  Widget customBottomContainer({required IconData icon, required String text, required int index}) {
    bool isSelected = selectedIndexBottom == index; // Check if the container is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexBottom = index; // Update the selected index
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black.withOpacity(0.7) : Colors.transparent, // Black background if selected
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1.6,color: isSelected ? Colors.black : Colors.black.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black, // White icon if selected
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.black.withOpacity(0.4), // White text if selected
            ),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            isTapped = !isTapped;
          });
          // Toggle AppBar and bottom part on tap anywhere on the screen
        },
        child: Stack(
          children: [
            // Background image covering the top half of the screen
            Container(
              width: size.width,
              height: size.height * 0.5,
              // Adjust the height to cover half the screen
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Main content area
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // Keep image visible
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppString.titleTextOne,
                            style: textStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Animated bottom container
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            topLeft: Radius.circular(26),
                          ),
                        ),
                        height: size.height * .42,
                        width: size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppString.postedByPartOne,
                                        style: textStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                        AppString.postedByName,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                        AppString.postedByPartTwo,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 10.sp),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    AppString.subTitleTextTwo,
                                    style: textStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    AppString.sourceBy,
                                    style: textStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 10.sp),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: InkWell(
                                onTap: () =>
                                    Get.to(() => const ScreenOneView()),
                                child: Container(
                                  height: 60.sp,
                                  width: size.width.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black, // Background color
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      children: [
                                        // Image with opacity
                                        Opacity(
                                          opacity: 0.3,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/sport1.png'),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Content over the image
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Paris Olympiad 2024',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Related News',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 32.sp,
                                                width: 32.sp,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                                child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.white,
                                                  size: 18.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Container sliding from the top
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              // Slow animation
              top: isTapped ? 0 : -150,
              // Moves container down when tapped
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: items
                      .map(
                        (item) => customContainer(
                            text: item,
                            isSelected: selectedIndex == items.indexOf(item)),
                      )
                      .toList(),
                ),
              ),
            ),

            // Container sliding from the bottom
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              // Slow animation
              bottom: isTapped ? 0 : -150,
              // Moves container up when tapped
              left: 0,
              right: 0,
              child: Container(
                height: 140,
                color: Colors.white,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customBottomContainer(icon: Icons.archive, text: 'Archive',index: 0),
                    const SizedBox(width: 20,),
                    customBottomContainer(icon: Icons.edit_rounded, text: 'Highlight',index: 1),
                    const SizedBox(width: 20,),
                    customBottomContainer(icon: Icons.share, text:  'Share',index: 2),

                  ],
                ),
              ),
            ),
            // Place "Daily Topper" on top of everything
            Positioned(
              right: 15,
              bottom: size.height * 0.45, // Adjust this value as needed
              child: GestureDetector(
                onTap: () {
                  // Daily Topper specific logic here
                  print("Daily Topper tapped");
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2, color: Colors.black.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: Text(
                      'Daily Topper',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
