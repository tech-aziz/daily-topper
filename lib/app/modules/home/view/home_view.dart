import 'package:daily_topper/app/modules/screens/screen1/view/screen1_view.dart';
import 'package:daily_topper/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/components/text_style.dart';
import '../../../config/style/app_string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Stack(
        children: [
          // Image covering the AppBar area
          Container(
            width: size.width,
            height: size.height * 0.5, // Adjust the height to cover AppBar area
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
              Expanded(
                flex: 1,
                child: Container(
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
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              AppString.subTitleTextTwo,
                              style: textStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              AppString.sourceBy,
                              style: textStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 10.sp),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: InkWell(
                          onTap: ()=> Get.to(()=> const ScreenOneView()),
                          child: Container(
                            height: 62.sp,
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
                                    // Set the opacity for the image only
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
                                                // Ensuring white text color
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                            Text(
                                              'Related News',
                                              style: TextStyle(
                                                color: Colors.white,
                                                // Ensuring white text color
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 32.sp,
                                          width: 32.sp,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey.withOpacity(
                                                0.5), // Adjusted container color
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                            // Icon color remains white
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
