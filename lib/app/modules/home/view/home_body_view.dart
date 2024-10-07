import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void toggleTap() {
    setState(() {
      isTapped = !isTapped; // Toggle between showing and hiding AppBar/bottom part
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      // GestureDetector wrapping the entire Scaffold body to detect taps anywhere on the screen

      // Conditionally show the AppBar based on isTapped
      appBar: isTapped
          ? AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Trending"),
            Tab(text: "Reels Insights"),
            Tab(text: "Album"),
          ],
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
        ),
      )
          : null,
      body: GestureDetector(
        onTap: () {
          toggleTap(); // Toggle AppBar and bottom part on tap anywhere on the screen
        },
        child: Stack(
          children: [
            // Background image covering the top half of the screen
            Container(
              width: size.width,
              height: size.height * 0.5, // Adjust the height to cover half the screen
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
                // Show bottom container when isTapped is true
                if (isTapped)
                  Container(
                    color: Colors.white,
                    height: 100,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Archive", style: TextStyle(color: Colors.black)),
                          Text("Highlight", style: TextStyle(color: Colors.black)),
                          Text("Share", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                // Default Expanded Widget when isTapped is false
                if (!isTapped)
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppString.postedByPartOne,
                                          style: textStyle(
                                              color: Colors.black.withOpacity(0.4),
                                              fontSize: 10.sp),
                                        ),
                                        Text(
                                          AppString.postedByName,
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(0.8),
                                              fontSize: 10.sp),
                                        ),
                                        Text(
                                          AppString.postedByPartTwo,
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(0.4),
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
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: InkWell(
                                  onTap: () => Get.to(() => const ScreenOneView()),
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
                                                  image: AssetImage('assets/images/sport1.png'),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Content over the image
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    borderRadius: BorderRadius.circular(100),
                                                    color: Colors.grey.withOpacity(0.5),
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
            // Place "Daily Topper" on top of everything
            Positioned(
              right: 15,
              bottom: size.height * 0.44, // Adjust this value as needed
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
