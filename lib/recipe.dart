import 'package:flutter/material.dart';
import 'package:designthinking/yogurtrecipe.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  '추천 레시피 음식',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              RaisedButton(
                elevation: 10,
                highlightElevation: 3,
                color: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 270,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'lib/assets/yogurt.jpeg',
                        height: 220,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 5),
                            child: Text(
                              '수제 요거트',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 25, right: 5, top: 20),
                            child: Text(
                              '디저트',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 25, right: 5, top: 20),
                            child: Text(
                              '우유, 발효유, 견과류',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YogurtRecipe()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
