import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'data.dart';

/// A widget that displays an avatar with various customization options.
///
/// 显示具有各种自定义选项的头像的组件。
///
/// This widget allows you to display avatars with custom dimensions, border
/// radius, background color, and an optional background image. You can specify
/// both network and local images for the avatar.
///
/// 此组件允许您显示具有自定义尺寸、边框半径、背景颜色和可选背景图像的头像。
/// 您可以为头像指定网络和本地图像。
///
/// Example usage:
/// ```dart
/// Avatar(
///   width: 150,
///   height: 150,
///   borderRadius: 75,
///   backgroundImage: 'https://example.com/avatar-background.jpg',
///   backgroundColor: Colors.blue,
///   image: 'assets/avatar.jpg',
///   margin: EdgeInsets.all(10),
///   padding: EdgeInsets.all(5),
/// )
/// ```
class Avatar extends StatelessWidget {
  /// The width of the avatar.
  /// 头像的宽度
  final double width;

  /// The height of the avatar.
  /// 头像的高度
  final double height;

  /// The border radius of the avatar.
  /// 头像的边框半径
  final double borderRadius;

  /// The URL for the background image of the avatar.
  /// 头像的背景图像的URL
  final String? backgroundImage;

  /// The background color of the avatar.
  /// 头像的背景颜色
  final Color backgroundColor;

  /// The image for the avatar.
  /// 头像的图像
  final String image;

  /// The margin around the avatar.
  /// 头像周围的边距
  final EdgeInsetsGeometry margin;

  /// The padding within the avatar, affecting only the avatar image.
  /// 头像内部的填充，仅影响头像图像
  final EdgeInsetsGeometry padding;

  /// The interlayer border for the avatar.
  /// 头像的中间层边框
  final Border? interlayerBorder;

  /// The border for the avatar;
  final Border? border;

  /// Creates an Avatar widget.
  /// 创建Avatar组件
  ///
  /// The [width] and [height] parameters determine the dimensions of the
  /// avatar, and the [borderRadius] parameter controls the corner radius of
  /// the avatar.
  ///
  /// [width]和[height]参数确定了头像的尺寸，[borderRadius]参数控制了头像的角半径。
  ///
  /// The [backgroundImage] can be a URL to an image that serves as the avatar's
  /// background. If specified, it will be displayed behind the avatar.
  ///
  /// [backgroundImage]可以是头像背景图像的URL。如果指定，它将显示在头像后面。
  ///
  /// The [backgroundColor] parameter sets the background color of the avatar if
  /// [backgroundImage] is not provided.
  ///
  /// 如果没有提供[backgroundImage]，则[backgroundColor]参数设置头像的背景颜色。
  ///
  /// The [image] parameter is used to set the avatar's image, which can be
  /// either a network URL or a local asset path.
  ///
  /// [image]参数用于设置头像的图像，可以是网络URL或本地资源路径。
  ///
  /// The [margin] parameter controls the margin around the entire avatar, and
  /// the [padding] parameter is used to apply internal padding, affecting only
  /// the avatar's image.
  ///
  /// [margin]参数控制整个头像周围的边距，[padding]参数用于应用内部填充，仅影响头像图像。
  const Avatar({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 50,
    this.backgroundImage,
    this.backgroundColor = const Color.fromARGB(255, 82, 82, 82),
    this.image = '',
    this.margin = EdgeInsets.zero, // 默认内边距为0
    this.padding = EdgeInsets.zero, // 默认内边距为0
    this.interlayerBorder,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Stack(
        children: [
          // 1. Background Layer
          // 1. 背景层
          Center(
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
          ),

          // 2. 中间层
          // 2. interlayer
          SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // 透明背景
                  border: interlayerBorder, // 中间层边框
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),

          // 3. Avatar Layer
          // 3. 头像层
          Center(
            child: SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    width: width, // 设置头像层宽度
                    height: height, // 设置头像层高度
                    margin: padding, // 应用内边距，仅影响头像图片
                    child: image.startsWith('http')
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: width, // 设置头像图像宽度
                            height: height, // 设置头像图像高度
                            errorBuilder: (context, error, stackTrace) {
                              // 加载网络图片失败时显示 base64 头像
                              return Image.memory(
                                Uint8List.fromList(base64Decode(base64Avatar)),
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // 加载本地图片失败时显示 base64 头像
                              return Image.memory(
                                Uint8List.fromList(base64Decode(base64Avatar)),
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
          ),
          // 4. 边框层
          // 4. border layer
          SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // 透明背景
                  border: border, // 边框
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
