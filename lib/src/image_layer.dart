import 'package:flutter/material.dart';

import 'data.dart';

class ImagerLayer extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry padding;
  final String image;
  final double borderRadius;

  const ImagerLayer({
    super.key,
    required this.size,
    required this.padding,
    required this.image,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: size,
              height: size,
              margin: padding,
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: size,
                      height: size,
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
