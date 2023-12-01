import 'package:flutter/material.dart';

import 'data.dart';

class ImagerLayer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final String image;
  final double borderRadius;

  const ImagerLayer({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
    required this.image,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: width,
              height: height,
              margin: padding,
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: width,
                      height: height,
                      errorBuilder: (context, error, stackTrace) {
                        return memoryImage;
                      },
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return memoryImage;
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
