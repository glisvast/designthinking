import 'package:flutter/material.dart';
import 'package:designthinking/main.dart';
import 'package:camera/camera.dart';
import 'dart:async';

// Firebase Cloud_Firestore
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:designthinking/calendar.dart';

class Home1Page extends StatefulWidget {
  final CameraDescription camera;

  const Home1Page({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _Home1PageState createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  var loading = true;

  var list = [
    "7",
    null,
    null,
    null,
    "27",
    null,
    "14",
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  var names = [
    '다다기오이개국산',
    '프리미엄감숙왕송이',
    '그린믹스',
    '레드믹스',
    '세척_모듬쌈채소_',
    '전주무동약콩나물',
    '제주밀감',
    '새벽양상추통',
    '계란말이용채소_',
    '감자짱',
    '측촉한초코칩',
    '대상쌀국수소고기맛',
    '미닛메이드오렌지',
    '미닛메이드포도',
    '전단할인',
    '스위트아메리카노',
    '마스터라떼',
    '제주삼치살',
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(new Duration(milliseconds: 4000), () {
      setState(() {
        loading = false;
      });
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 70, bottom: 30, left: 29),
                    child: Text(
                      '남은 재료',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 12),
                        child: Image.asset(
                          'lib/assets/milk.png',
                          width: 38,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '우유',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('2019.7.4 ~ 2019.7.14'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('3일',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Text(' 남음'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                    stream: Firestore.instance.collection('201907').snapshots(),
                    builder: (context, snapshot) {
                      if (loading == true) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: <Widget>[
                          for (var i = 0; i < 13; i++)
                            Container(
                              padding: EdgeInsets.only(top: 26),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 12),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 27),
                                      width: 10,
                                      height: 10,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        names[i],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text('2019.7.4 ~ ' +
                                            (list[i] == null
                                                ? ""
                                                : "2019.7." +
                                                    (4 + (int.parse(list[i])))
                                                        .toString())),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                            list[i] == null
                                                ? "유통기한 별도 기입"
                                                : list[i] + '일',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        list[i] == null
                                            ? Container(
                                                padding:
                                                    EdgeInsets.only(right: 24),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 24.0),
                                                child: Text(' 남음'),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  Container(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Row(
              children: <Widget>[
                RaisedButton(
                  color: const Color(0xFFBBC6ED),
                  elevation: 5,
                  highlightElevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    child: Text(
                      '영수증 스캔',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TakePictureScreen(camera: widget.camera)));
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                  color: const Color(0xFF998FD7),
                  elevation: 5,
                  highlightElevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    child: Text(
                      '유통기한 달력',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
