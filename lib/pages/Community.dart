import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Container(
        child: Text("동네생활 body"),
      ),
    );
  }
}
