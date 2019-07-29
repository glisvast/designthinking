import 'package:flutter/material.dart';
import 'package:designthinking/recipe.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 70, bottom: 30, left: 29),
                child: Text(
                  '유통기한 달력',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.white,
                highlightColor: Colors.white,
                child: Image.asset('lib/assets/graph.png'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecipePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
