# easy_avatar

A plug-in that provides solutions to avatar-related problems in Flutter applications.
在 Flutter 应用程序中提供头像相关问题的解决方案的插件。

**Author**: [Jcak Lee](https://blog.csdn.net/qq_28550263)
**Email**: [291148484@163.com](mailto:291148484@163.com)
**Homepage**: [http://thispage.tech:9680/jclee1995/flutter-easy-avatar](http://thispage.tech:9680/jclee1995/flutter-easy-avatar)
**repository**: [https://github.com/jacklee1995/flutter_easy_avatar](https://github.com/jacklee1995/flutter_easy_avatar)
**issue_tracker**:  [https://github.com/jacklee1995/flutter_easy_avatar/issues](https://github.com/jacklee1995/flutter_easy_avatar/issues)

|![Alt text](./example/readme_images/qemu-system-x86_64_xwZukX8r5s.png)|
|-|

| ![Alt text](./example/readme_images/qemu-system-x86_64_WIemLM6fwV.png) | ![Alt text](./example/readme_images/qemu-system-x86_64_bnst46VJaj.png) | ![Alt text](./example/readme_images/qemu-system-x86_64_lAwJKTD6m8.png) |
|-|-|-|
| ![Alt text](./example/readme_images/qemu-system-x86_64_7WSEeCgXhe.gif) | ![Alt text](./example/readme_images/qemu-system-x86_64_fEu0UcyoNG.png) | ![Alt text](./example/readme_images/qemu-system-x86_64_dm65rAAqmW.png) |
|![Alt text](./example/readme_images/example_DjGtUHWhlD.png)|![Alt text](./example/readme_images/example_3fJsyuoR7S.png)|![Alt text](./example/readme_images/example_3OdyAPmXJn.png)|


---

## Getting Started

The simplest example is to use the default avatar and default parameters:
最简单的例子是使用默认头像及默认参数：

```dart
const Avatar()
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_WIemLM6fwV.png)

你也可以指定一些头像参数，但是如果你指定一个错误的头像地址，将自动地使用默认头像，例如：

```dart
Avatar(
  size: 100,
  backgroundColor: Colors.indigo,
  borderRadius: 40,
  padding: EdgeInsets.all(20),
  image: 'https://example.com/avatar.jpg',
),
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_bnst46VJaj.png)

如果要可以设置一个真实的网络图片URL作为头像，则它必须以http开头，例如：

```dart
const Avatar(
  size: 200,
  borderRadius: 100,
  image:
      'https://profile-avatar.csdnimg.cn/bb869bb0b79b48209c6206043890c985_qq_28550263.jpg',
),
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_lAwJKTD6m8.png)

Oh, this is me. An active user of the open source community!
哦，这就是我了。一个开源社区的活跃用户！

Actually, you can also use animation, which doesn't matter:
其实你还可以使用动图，这没关系的：

```dart
const Avatar(
  size: 200,
  margin: EdgeInsets.all(6),
  borderRadius: 60,
  image:
      'https://github.githubassets.com/images/mona-loading-dimmed.gif',
),
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_7WSEeCgXhe.gif)

If the avatar itself has a transparent background, you can see the default background color or background picture. Also, you can add an outer border for your avatar, such as:
如果头像本身是透明背景的，可以看到默认背景色 或 背景图片。并且，你还可以为你的头像添加外边框，例如：

```dart
Avatar(
  size: 200,
  padding: const EdgeInsets.all(10),
  margin: const EdgeInsets.all(10),
  borderRadius: 80,
  backgroundColor: Colors.white, // 如不设置，则为灰色
  // 可以为你的头像添加边框
  border: Border.all(
    color: const Color.fromARGB(255, 0, 0, 0),
    width: 6.0,
    style: BorderStyle.solid,
    strokeAlign: BorderSide.strokeAlignInside,
  ),
  image:
      'https://gitee.com/jacklee1995/example-pictures/raw/master/asian/asian-girl-avatar.png',
),
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_fEu0UcyoNG.png)

Next is an example of using a network picture as a background picture, which will cover the background color effect:
接下来是一个使用网络图片作为背景图的例子，这个网络图片将覆盖背景颜色效果：

```dart
const Avatar(
  size: 200,
  margin: EdgeInsets.all(10),
  borderRadius: 80,
  backgroundImage:
      'https://gitee.com/jacklee1995/example-pictures/raw/master/scenery/jonathanvasquez8950_scenery_2f6031d1-c4fe-41d7-8abf-d1c9c40d9981.png',
  image:
      'https://gitee.com/jacklee1995/example-pictures/raw/master/asian/asian-girl-avatar.png',
),
```

The effect of this code is as follows:
其运行效果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_dm65rAAqmW.png)

Now, let's explore some special effects - Avatar out of the box.

The `Avatar` class provides an intermediate layer border property called `interlayerBorder`. Using this property instead of the `border` property will help you achieve the effect of characters coming out of the frame. Here's an example code:
下面我们玩一点特效——人物出框。
`Avatar` 类提供了一个中间层边框属性 `interlayerBorder`，通过该属性而不是 `border` 属性设置的边框将帮助你完成人物出框的效果。示例代码如下：

```dart
Avatar(
  size: 200,
  interlayerBorder: Border.all(
    color: const Color.fromARGB(255, 255, 251, 3),
    width: 20.0,
    style: BorderStyle.solid,
    strokeAlign: BorderSide.strokeAlignInside,
  ),
  // margin: const EdgeInsets.all(6),
  borderRadius: 100,
  backgroundImage:
      'https://gitee.com/jacklee1995/example-pictures/raw/master/scenery/jonathanvasquez8950_scenery_2f6031d1-c4fe-41d7-8abf-d1c9c40d9981.png',
  image: 'assets/asian-boy-avatar.png', // 也可以使用本地图片资源
)
```

The effect of this code is as follows:
其效运行果如下：

![Alt text](./example/readme_images/qemu-system-x86_64_xwZukX8r5s.png)

### 文字头像（Text Avatar）

Since v2.0.0, a new layer has been added to display text, but the textMode must be turned on with the `textmode` parameter. If no text is specified, it will be displayed as "?" No, otherwise it is displayed as the text specified by using the `text` parameter.

从 v2.0.0 开始，添加了新的图层用于显示文字，但是必须使用 `textMode` 参数开启文字模式。如果没有指定文本，将显示为“?”号，否则显示为使用 `text` 参数所指定的文本。


examples:
例如：

```dart
const Avatar(textMode: true),
```

The effect of this code is as follows:
效果为：

![Alt text](./example/readme_images/example_DjGtUHWhlD.png)

```dart
const Avatar(
  textMode: true, // 文字模式必须启用此参数
  text: 'Lee', // 默认仅仅使用一个字符
),
```

The effect of this code is as follows:
效果为：

![Alt text](./example/readme_images/example_3fJsyuoR7S.png)


If the text consists of more than one word, you need to specify the number of words through the  `wordsCount` parameter to display more than one character:
如果文本由多个单词构成，需要通过 `wordsCount` 参数指定单词的数量以显示多个字符：

```dart
const Avatar(
  textMode: true,
  text: 'Jun Cai',
  borderRadius: 40,
  wordsCount: 2, // 单词数量，用于显示多个单词的首字符
),
```

The effect of this code is as follows:
效果为：

![Alt text](./example/readme_images/example_3OdyAPmXJn.png)

Let's enjoy it!~
尽情探索吧！~

---

## API 编程接口

## class Avatar

A widget that displays an avatar with various customization options.
此类是一个显示带有各种自定义选项的头像的组件。

This widget allows you to display avatars with custom dimensions, border radius, background color, and an optional background image. You can specify both network and local images for the avatar.

该组件允许您显示具有自定义尺寸、边框半径、背景颜色和可选背景图像的头像。可以为头像指定网络和本地图像。

### Example Usage 示例

```dart
Avatar(
  size: 150,
  borderRadius: 75,
  backgroundImage: 'https://example.com/avatar-background.jpg',
  backgroundColor: Colors.blue,
  image: 'assets/avatar.jpg',
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(5),
)
```

### Constructor 构造函数

#### 默认构造函数 `Avatar`

Creates an Avatar widget.

创建Avatar组件。

- `size` (double, optional): The size of the avatar. Default is 100.

  - 头像的尺寸。默认为100。

- `borderRadius` (double, optional): The border radius of the avatar. Default is 50.

  - 头像的边框半径。默认为50。

- `backgroundImage` (String, optional): The URL for the background image of the avatar.

  - 头像的背景图像的URL。

- `backgroundColor` (Color, optional): The background color of the avatar if `backgroundImage` is not provided. Default is a gray color.

  - 如果没有提供`backgroundImage`，则设置头像的背景颜色。默认为灰色。

- `image` (String, required): The image for the avatar, which can be either a network URL or a local asset path.

  - 用于设置头像的图像，可以是网络URL或本地资源路径。

- `text` (String, required): The text for the avatar.

  - 文字头像的文本。

- `textMode` (bool, optional): Whether to use text avatar mode. Default is false.

  - 是否启用文本头像模式，默认为 false。

- `upperCase` (bool, optional): Use capital letters. Default is false.

  - 文本转大写，默认为 false。

- `wordsCount` (int, optional): Number of words, used to display the first characters of multiple words.

  - 单词数量，用于显示多个单词的首字符。

- `margin` (EdgeInsetsGeometry, optional): The margin around the entire avatar. Default is no margin.

  - 控制整个头像周围的边距。默认没有边距。

- `padding` (EdgeInsetsGeometry, optional): The padding within the avatar, affecting only the avatar image. Default is no padding.

  - 应用于头像内部，仅影响头像图像的填充。默认没有填充。

- `border` (Border, optional): The border for the avatar.

  - 头像的边框。
  
- `interlayerBorder` (Border, optional): The interlayer border for the avatar.

  - 头像的中间层边框。

## Major Changes in v2.0.0
## v2.0.0 的重大变更

Starting from v2.0.0:
从 v2.0.0 开始：

- The width and height properties of the Avatar class have been removed, replaced by the size property.
- 删除了 **Avatar** 类的 `width` 属性和 `height` 属性，取而代之的为 `size` 属性。

- Added the functionality of text avatars.
- 新增了文字头像功能。


## Issue Tracker

你可以在 Github 上报告错误：[https://github.com/jacklee1995/flutter_easy_avatar/issues](https://github.com/jacklee1995/flutter_easy_avatar/issues)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

本项目根据MIT许可证许可 - 有关详细信息，请参阅[LICENSE](./LICENSE)文件。
