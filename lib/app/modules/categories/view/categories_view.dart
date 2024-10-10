import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8)),
        ),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // Maximum width of grid items
              childAspectRatio: 0.8, // Adjusts height based on width
              crossAxisSpacing: 8, // Spacing between grid items horizontally
              mainAxisSpacing: 8,  // Spacing between grid items vertically
            ),
            itemBuilder: (context, index) {
              return CustomCategory(
                img: categoryList[index].img,
                title: categoryList[index].title,
              );
            },
          ),
        ),

    );
  }
}


class CustomCategory extends StatefulWidget {
  final String img;
  final String title;

  const CustomCategory({super.key, required this.img, required this.title});

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(widget.img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8), // Add some space between the image and title
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

