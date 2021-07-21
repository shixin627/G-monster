import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:g_mon/todo_card.dart';
import 'package:g_mon/card_content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'G-mon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectitem = 0;

  List<String> images = [
    "assets/image/pet1.png",
    "assets/image/pet2.png",
    "assets/image/pet3.png",
  ];

  static List<String> lifeItems = [
    "吃飯",
    "睡覺",
    "打東東",
  ];

  static List<String> workItems = [
    "寫報告",
    "開會",
    "設計寵物",
    "寫程式",
  ];

  static List<String> shoppingItems = [
    "掃把",
    "苦瓜",
    "茄子",
    "四季豆",
    "便當",
    "海帶",
  ];

  List<CardContent> cardContents = [
    CardContent("生活", lifeItems, Colors.lightBlue[100]),
    CardContent("工作", workItems, Colors.orangeAccent[100]),
    CardContent("購物", shoppingItems, Colors.greenAccent[100])
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Container(
              height: height * 0.43,
              child: new Swiper(
                fade: 1,
                itemWidth: width * 0.3,
                viewportFraction: 0.7,
                scale: 0.6,
                itemBuilder: (BuildContext context, int index) {
                  print(cardContents[index].title);
                  return ToDoCard(cardContents: cardContents[index]);
                },
                itemCount: 3,
              ),
            ),
          ),
          Container(
            height: height * 0.35,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                );
              },
              itemCount: 3,
              control: new SwiperControl(
                iconPrevious: Icons.keyboard_arrow_left,
                iconNext: Icons.keyboard_arrow_right,
                size: 50,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: width * 0.18,
                      child: Image.asset(
                        'assets/image/history.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.22 - 25 - 5,
                      width: width * 0.5,
                      child: CupertinoPicker(
                        magnification: 1.3,
                        children: <Widget>[
                          Text(
                            "吃飯",
                          ),
                          Text(
                            "睡覺",
                          ),
                          Text(
                            "打東東",
                          ),
                          Text(
                            "買菜",
                          ),
                          Text(
                            "打球",
                          ),
                        ],
                        squeeze: 0.7,
                        itemExtent: 28, //height of each item
                        looping: false,
                        onSelectedItemChanged: (int index) {
                          _selectitem = index;
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.25,
                      child: Image.asset(
                        'assets/image/start.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
