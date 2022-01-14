import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> usedItems = [];
  late String currentLocation;
  final Map<String,String> locationTypeToString = {
    "ara" : "아라동",
    "yeouido" : "여의동",
    "daebang" : "대방동",
    "singil" : "신길동",
  };

  @override
  void initState() {
    log("initState() 시작");
    super.initState();
    currentLocation = "yeouido";
    usedItems = [
      {
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "LA 갈비",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "치약",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "태블릿",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "LA 갈비",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "치약",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "태블릿",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "치약",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "태블릿",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "2"
      },
    ];
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  PreferredSizeWidget _appbarWidget() {
    log("_appbarWidget 시작");
    return AppBar(
      title: GestureDetector(
          onTap: () {
            print("click");
          },
          child: PopupMenuButton<String>(
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                1
            ),
            onSelected: (String where) {
              setState(() {
                currentLocation = where;
              });
            },
            itemBuilder: (BuildContext context) {
              // 내동네 리스트가 대체해야하는 부분
              // 실제 당근 마켓에선 최소 1개 최대 2개를 지정할 수 있음
              return [
                 PopupMenuItem(
                  value: "yeouido",
                  child: Text("여의동"),
                ),
                PopupMenuItem(
                  value: "daebang",
                  child: Text("대방동"),
                ),
                PopupMenuItem(
                  value: "singil",
                  child: Text("신길동"),
                ),
              ];
            },
            child: Row(
              children: [
                Text(
                  locationTypeToString[currentLocation]!,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          )),
      backgroundColor: Colors.orange,
      actions: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune, color: Colors.black),
        ),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/bell.svg",
              width: 22,
            )),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  usedItems[index]["image"]!,
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usedItems[index]["title"]!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        usedItems[index]["location"]!,
                        style: TextStyle(color: Colors.black.withOpacity(0.3)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        calcStringToWon(usedItems[index]["price"]!),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/heart_off.svg",
                                width: 13,
                                height: 13,
                              ),
                              SizedBox(width: 5),
                              Text(usedItems[index]["likes"]!),
                            ],
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
      },
      itemCount: 10,
      separatorBuilder: (BuildContext _context, int index) {
        return Container(
          height: 1,
          color: Colors.black,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}

// Widget _homePageWidget() {
//
// }
