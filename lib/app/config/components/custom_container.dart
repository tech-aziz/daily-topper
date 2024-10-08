import 'package:flutter/material.dart';

Widget customBottomContainer({required IconData icon, required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2, color: Colors.grey.withOpacity(.6)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12),
      )
    ],
  );
}
