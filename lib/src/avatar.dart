import 'package:flutter/material.dart';
import 'background_layer.dart';
import 'text_layer.dart';
import 'image_layer.dart';

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
///   size: 150,
///   borderRadius: 75,
///   backgroundImage: 'https://example.com/avatar-background.jpg',
///   backgroundColor: Colors.blue,
///   image: 'assets/avatar.jpg',
///   margin: EdgeInsets.all(10),
///   padding: EdgeInsets.all(5),
/// )
/// ```
class Avatar extends StatelessWidget {
  /// The size of the avatar.
  /// 头像的大小
  final double size;

  /// The border radius of the avatar.
  /// 头像的边框半径
  final double borderRadius;

  /// The URL for the background image of the avatar.
  /// 头像的背景图像的URL
  final String? backgroundImage;

  /// The background color of the avatar.
  /// 头像的背景颜色
  final Color? backgroundColor;

  /// The image for the avatar.
  /// 头像的图像
  final String image;

  /// The text for the avatar
  /// 文字头像的文本
  final String text;

  /// Whether to use text avatar mode
  /// 是否启用文本头像模式，默认为 false
  final bool textMode;

  /// Use capital letters
  /// 文本转大写
  final bool upperCase;

  /// Number of words, used to display the first characters of multiple words.
  /// 单词数量，用于显示多个单词的首字符
  final int? wordsCount;

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
    super.key,
    this.size = 100,
    this.borderRadius = 50,
    this.backgroundImage,
    this.backgroundColor,
    this.image = '',
    this.text = '?',
    this.margin = EdgeInsets.zero, // 默认内边距为0
    this.padding = EdgeInsets.zero, // 默认内边距为0
    this.interlayerBorder,
    this.border,
    this.textMode = false,
    this.upperCase = false,
    this.wordsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: size,
      height: size,
      child: Stack(
        children: [
          // 1. Background Layer
          // 1. 背景层
          BackgroundLayer(
            size: size,
            backgroundColor: _getBgColor(),
            borderRadius: borderRadius,
          ),

          // 2. 中间层
          // 2. interlayer
          Center(
            child: SizedBox(
              width: size,
              height: size,
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
          ),

          // 3.1 Avatar Layer
          // 3.1 图像层
          // 3.2 文字层
          textMode
              ? TextLayer(
                  size: size,
                  padding: padding,
                  text: _getDisplayStr(),
                  borderRadius: borderRadius,
                )
              : ImagerLayer(
                  size: size,
                  padding: padding,
                  image: image,
                  borderRadius: borderRadius,
                ),

          // 4. 边框层
          // 4. border layer
          Center(
            child: SizedBox(
              width: size,
              height: size,
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
          ),
        ],
      ),
    );
  }

  // 获取需要显示的字符串
  String _getDisplayStr() {
    String str = String.fromCharCodes(
      text.runes.toList(),
    );

    str = upperCase ? str.toUpperCase() : str;
    List<String> charList = str.trim().split(' ');

    // 如果charList的长度大于 1 且等于 wordsCount
    if (charList.length > 1 && charList.length == wordsCount) {
      // 返回charList的第一个和第二个元素的首字母
      return '${charList[0][0].trim()}${charList[1][0].trim()}';
    }
    print('DisplayStr ========================= ${str[0]}');
    // 否则，返回newText的首字母
    return str[0];
  }

  // 配置背景颜色
  Color _getBgColor() {
    if (backgroundColor != null) {
      return backgroundColor!;
    } else if (textMode &&
        RegExp(r'[A-Z]|').hasMatch(
          _getDisplayStr(),
        )) {
      var colorKey = _getDisplayStr()[0].toLowerCase().toString();
      var colorMap = {
        "a": const Color.fromARGB(255, 255, 110, 94),
        "b": const Color.fromARGB(255, 255, 108, 157),
        "c": const Color.fromARGB(255, 236, 128, 255),
        "d": const Color.fromARGB(255, 180, 134, 255),
        "e": const Color.fromARGB(255, 144, 159, 255),
        "f": const Color.fromARGB(255, 95, 153, 255),
        "g": const Color.fromARGB(255, 74, 198, 255),
        "h": const Color.fromARGB(255, 77, 234, 255),
        "i": const Color.fromARGB(255, 60, 255, 235),
        "j": const Color.fromARGB(255, 255, 189, 67),
        "k": const Color.fromARGB(255, 191, 255, 118),
        "l": const Color.fromARGB(255, 97, 69, 224),
        "m": const Color.fromARGB(255, 255, 225, 57),
        "n": const Color.fromARGB(255, 219, 178, 27),
        "o": const Color.fromARGB(255, 243, 164, 7),
        "p": const Color.fromARGB(255, 255, 132, 87),
        "q": const Color.fromARGB(255, 204, 204, 204),
        "r": const Color.fromARGB(255, 169, 194, 207),
        "s": const Color.fromARGB(255, 161, 106, 83),
        "t": const Color.fromARGB(255, 156, 156, 156),
        "u": const Color.fromARGB(255, 169, 175, 224),
        "v": const Color.fromARGB(255, 198, 164, 255),
        "w": const Color.fromARGB(255, 214, 214, 214),
        "x": const Color.fromARGB(255, 132, 241, 255),
        "y": const Color.fromARGB(255, 216, 169, 153),
        "z": const Color.fromARGB(255, 130, 231, 99),
      };

      return colorMap.containsKey(colorKey)
          ? colorMap[colorKey]!
          : const Color.fromARGB(255, 82, 82, 82);
    }
    return const Color.fromARGB(255, 82, 82, 82);
  }
}
