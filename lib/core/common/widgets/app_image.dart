import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjust to your preferred size
      width: 80, // Adjust to your preferred size
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        // Smooth rounded corners
        color: Colors.white, // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the image
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain, // Ensure the image fits inside the container
        ),
      ),
    );
  }
}
