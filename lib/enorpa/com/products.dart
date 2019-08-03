import 'dart:math';

import 'package:flutter/material.dart';

import 'package:enorpa_smart/enorpa/com/buhar_jeneratoru.dart';
import 'package:enorpa_smart/enorpa/com/buhar_kazani.dart';
import 'package:enorpa_smart/enorpa/com/sera_isitma_sistemleri.dart';
import 'package:enorpa_smart/enorpa/com/sicak_hava_apareyi.dart';
import 'package:enorpa_smart/enorpa/com/sicak_su_kazani.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    var oran = sqrt(carpim/300441.0);

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(218, 99, 56, 1.0),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xFF696969), const Color(0xFF353536)],
                //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter),
          ),
          child: Stack(children: <Widget>[


 Opacity(opacity: 0.07,
                      child: Container(
              margin: EdgeInsets.only(left: 5*oran,right: 5*oran,bottom: 5*oran),
  child: new OverflowBox(
    minWidth: 0.0, 
    minHeight: 0.0, 
    maxWidth: double.infinity, 
    child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Image(
            image: new AssetImage('assets/images/heating.jpg'), 
            fit: BoxFit.cover),
      ],
    )) 
),
          ),



          Column(
            children: <Widget>[
              Text(
                "ÜRÜNLERİMİZ",
                textScaleFactor: oran,
                style: TextStyle(
                    color: Colors.grey.shade100,
                    fontFamily: 'Audio wide',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(

                    children: <Widget>[

                      Expanded(
                        flex: 1,
                        child: Container(

                        alignment: Alignment.center,

                      ),
                      ),

                      Expanded(
                        flex: 4,
                        child: Container(


                        child: Row(
                          children: <Widget>[

                            Expanded(child:

                            Column(
                              children: <Widget>[

                                Text(
                                  "SICAK SU KAZANI",
                                  textScaleFactor: oran,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0)),
                                ),

                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SicakSuKazani()));
                                    },
                                    child: Image.asset(
                                      'assets/images/products_icon.png',
                                      scale: 7/oran,
                                    ))

                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),

                            ),

                            Expanded(child:

                            Column(
                              children: <Widget>[

                                Text(
                                  "BUHAR KAZANI",
                                  textScaleFactor: oran,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0)),
                                ),

                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BuharKazani()));
                                    },
                                    child: Image.asset(
                                      'assets/images/products_icon.png',
                                      scale: 7/oran,
                                    ))

                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),

                            ),

                            Expanded(child:

                            Column(
                              children: <Widget>[

                                Text(
                                  "SICAK HAVA APAREYİ",
                                  textScaleFactor: oran,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0)),
                                ),

                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SicakHavaApareyi()));
                                    },
                                    child: Image.asset(
                                      'assets/images/products_icon.png',
                                      scale: 7/oran,
                                    ))

                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),

                            ),



                          ],

                        ),
                        alignment: Alignment.center,

                      ),
                      ),

                      Expanded(
                        flex: 4,
                        child: Container(


                        child: Row(
                          children: <Widget>[

                            Column(
                              children: <Widget>[

                                Text(
                                  "BUHAR\nJENERATÖRÜ",
                                  textScaleFactor: oran,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0),
                                  ),
                                ),

                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BuharJeneratoru()));
                                    },
                                    child: Image.asset(
                                      'assets/images/products_icon.png',
                                      scale: 7/oran,
                                    ))

                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),

                            Column(
                              children: <Widget>[

                                Text(
                                  "SERA ISITMA\nSİSTEMLERİ",
                                  textScaleFactor: oran,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0)),
                                ),

                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SeraIsitmaSistemleri()));
                                    },
                                    child: Image.asset(
                                      'assets/images/products_icon.png',
                                      scale: 7/oran,
                                    ))

                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),

                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        alignment: Alignment.center,

                      ),
                      ),


                      Expanded(
                        flex: 1,
                        child: Container(
                        alignment: Alignment.center,

                      ),
                      ),


                    ],

                  ),
                ),
              )
            ],
          ),
          
          


          ],),
          
          
          
          margin: EdgeInsets.all(5*oran),
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5*oran),
        ),
      ),
      floatingActionButton: Container(
        width: 50*oran,
        height: 50*oran,
        margin: EdgeInsets.only(right: 10*oran,bottom: 10*oran),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size: 40*oran,color: Colors.black,),
        ),
      ),
    );
  }
}
