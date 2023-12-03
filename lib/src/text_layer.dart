import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// 定义一个TextAvatar类，继承自StatelessWidget，表示一个无状态的widget
class TextLayer extends StatelessWidget {
  // 定义一些属性，包括形状、背景颜色、文本颜色、大小、文本、字体大小、字母数量、字体权重、字体家族和是否大写
  final EdgeInsetsGeometry padding;
  final String text;

  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? size;

  final double? fontSize;

  final FontWeight? fontWeight;
  final String? fontFamily;

  // 定义构造函数，初始化各个属性
  const TextLayer({
    super.key,
    required this.size,
    required this.text,
    this.textColor,
    this.backgroundColor,
    required this.borderRadius,
    this.fontWeight = FontWeight.bold,
    this.fontFamily,
    this.fontSize,
    required this.padding,
  });

  // 重写build方法，返回一个Widget
  @override
  Widget build(BuildContext context) {
    // 返回一个文本显示的Widget
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: size,
          height: size,
          margin: padding,
          child: Center(
            child: AutoSizeText(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: (fontSize ?? size)! / 2,
                fontWeight: fontWeight,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
