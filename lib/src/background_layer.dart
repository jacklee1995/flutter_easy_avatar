import 'package:flutter/material.dart';

class BackgroundLayer extends StatelessWidget {
  final double width;
  final double height;
  final String? backgroundImage;
  final Color backgroundColor;
  final double borderRadius;

  const BackgroundLayer({
    Key? key,
    required this.width,
    required this.height,
    this.backgroundImage,
    required this.backgroundColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: backgroundImage != null
          // 如果指定了背景图片，则使用背景图片
          ? SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.network(
                  backgroundImage!,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // 如果背景图片加载失败，不再显示背景图
                    return Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        // border: interlayerBorder,
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: backgroundColor,
                      ),
                    );
                  },
                ),
              ),
            )

          // 未指定背景图时，采用纯色默认背景图
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                // border: interlayerBorder,
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundColor,
              ),
            ),
    );
  }
}
