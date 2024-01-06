import 'package:flutter/material.dart';


class DogCatcherImageWidget extends StatelessWidget {
  const DogCatcherImageWidget({
    super.key,
    required this.imageUrl,
    required this.width
  });
  final String imageUrl;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: width,
    );
  }
}
