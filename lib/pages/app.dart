import 'package:daanggn_market_clone/pages/Chatting.dart';
import 'package:daanggn_market_clone/pages/Community.dart';
import 'package:daanggn_market_clone/pages/Home.dart';
import 'package:daanggn_market_clone/pages/Mypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  late int _currentPageIndex;

  @override
  void initState() {
    log("initState() 시작");
    super.initState();
    _currentPageIndex = 0;

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

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      //홈화면
      case 0:
        return Home();
        break;
      //동네생활
      case 1:
        return Community();
        break;
      //채팅
      case 2:
        return Chatting();
        break;
      //나의 당근
      case 3:
        return Mypage();
        break;
    }

    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_off.svg",
          width: 22,
        ),
      ),
      activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset(
            "assets/svg/${iconName}_on.svg",
            width: 22,
          )),
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
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("notes", "동네생활"),
        _bottomNavigationBarItem("chat", "채팅"),
        _bottomNavigationBarItem("user", "나의 당근"),
      ],
    );
  }

  Widget _floatingActionButton() {
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
      //appBar: _appbarWidget(),
      body: _bodyWidget(),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomNaviagtionWidget(),
    );
  }
}
