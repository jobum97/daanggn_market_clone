import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class usedItemPage extends StatefulWidget {
  const usedItemPage({Key? key}) : super(key: key);

  @override
  _usedItemPageState createState() => _usedItemPageState();
}

class _usedItemPageState extends State<usedItemPage> {
  List<Map<String, String>> usedItems = [];

  late int _currentPageIndex;

  @override
  void initState() {
    log("initState() 시작");
    super.initState();
    _currentPageIndex = 0;
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

  PreferredSizeWidget _appbarWidget() {
    log("_appbarWidget 시작");
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: Row(
          children: [
            Text("여의도동", style: Theme.of(context).textTheme.bodyText2),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
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

  final oCcy = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
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

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}.svg",
          width: 22,
        ),
      ),
      label: label,
    );
  }

  Widget _bottomNaviagtionWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        log("click BottomNavigationBar Index : ${index}");
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedFontSize: 12,
      currentIndex: _currentPageIndex,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedLabelStyle: TextStyle(color: Colors.black),
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        _bottomNavigationBarItem("home_off", "홈"),
        _bottomNavigationBarItem("notes_off", "동네생활"),
        _bottomNavigationBarItem("chat_off", "채팅"),
        _bottomNavigationBarItem("user_off", "나의 당근"),
      ],
    );
  }

  Widget _floatingActionButton(){
    return FloatingActionButton(
      child: Icon(Icons.edit),
      backgroundColor: Colors.orange,
      onPressed: () {
        log("click edit btn");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomNaviagtionWidget(),
    );
  }
}
