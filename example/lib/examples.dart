import 'package:flutter/material.dart';
import 'package:easy_avatar/easy_avatar.dart';

class MyAvatarExample extends StatelessWidget {
  static const String url = '/MyAvatarExample';
  const MyAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Avatar Example'),
          ),
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverGrid.count(
                crossAxisCount: 2,
                children: [
                  // 默认头像
                  const Avatar(),
                  // 使用一个失效的地址，也将加载默认头像
                  const Avatar(
                    size: 100,
                    backgroundColor: Colors.indigo,
                    borderRadius: 40,
                    padding: EdgeInsets.all(20), // 可以用内边距限制头像大小（将转换未头像外边距）
                    image: 'https://example.com/avatar.jpg',
                  ),

                  // 文字头像，未指定文本
                  const Avatar(textMode: true),
                  // 文字头像，指定文本
                  const Avatar(
                    textMode: true, // 文字模式必须启用此参数
                    text: 'Lee', // 默认仅仅使用一个字符
                  ),
                  // 文字头像，使用多个文字
                  const Avatar(
                    textMode: true,
                    text: 'Jun Cai',
                    borderRadius: 40,
                    wordsCount: 2,
                  ),

                  // 可以设置一个真实的图片URL作为头像，但它必须以http开头
                  const Avatar(
                    size: 200,
                    borderRadius: 100,
                    image:
                        'https://profile-avatar.csdnimg.cn/bb869bb0b79b48209c6206043890c985_qq_28550263.jpg',
                  ),
                  // 即使是一个动图也无所谓，并且可以添加一点外边距
                  const Avatar(
                    size: 200,
                    margin: EdgeInsets.all(6),
                    borderRadius: 60,
                    image:
                        'https://github.githubassets.com/images/mona-loading-dimmed.gif',
                  ),
                  // 如果头像本身是透明背景的，可以看到默认背景色 或 背景图片
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

                  // 一个使用网络图片作为背景图的例子
                  const Avatar(
                    size: 200,
                    margin: EdgeInsets.all(10),
                    borderRadius: 80,
                    backgroundImage:
                        'https://gitee.com/jacklee1995/example-pictures/raw/master/scenery/jonathanvasquez8950_scenery_2f6031d1-c4fe-41d7-8abf-d1c9c40d9981.png',
                    image:
                        'https://gitee.com/jacklee1995/example-pictures/raw/master/asian/asian-girl-avatar.png',
                  ),

                  // 一个头像爬出相框的例子
                  Avatar(
                    size: 200,

                    interlayerBorder: Border.all(
                      color: const Color.fromARGB(255, 41, 0, 190),
                      width: 20.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                    padding: const EdgeInsets.all(10),
                    borderRadius: 100,
                    backgroundImage:
                        'https://gitee.com/jacklee1995/example-pictures/raw/master/scenery/jonathanvasquez8950_scenery_2f6031d1-c4fe-41d7-8abf-d1c9c40d9981.png',
                    image: 'assets/asian-boy-avatar.png', // 也可以使用本地图片资源
                  ),
                ],
              )
            ],
          )),
    );
  }
}
