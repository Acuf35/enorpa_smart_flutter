import 'dart:math';

import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class UcyvanaKalibrasyon extends StatefulWidget {
  String tur = "";

  UcyvanaKalibrasyon.deger(String x) {
    tur = x;
  }

  @override
  State<StatefulWidget> createState() {
    return UcyvanaKalibrasyonState.deger(tur);
  }
}

class UcyvanaKalibrasyonState extends State<UcyvanaKalibrasyon> {
  String tur = "";

  UcyvanaKalibrasyonState.deger(String x) {
    tur = x;
    print(tur);
  }

  final dbHelper = DatabaseHelper.instance;


  String dilSecimi = "TR";

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    //SystemChrome.setEnabledSystemUIOverlays([]);

    

    var oran;

    try {
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    oran = sqrt(carpim/300441.0);
    } catch (Exception) {
      print("Hata VAR!!!");
    }

    //region SCAFFOLD

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(218, 99, 56, 1.0),
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                  //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10*oran),
                        child: Text(
                          SelectLanguage().selectStrings(dilSecimi, 'tv46'),
                          textScaleFactor: oran,style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: 'Audio wide',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20*oran),
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AlarmOnline()));
                          },
                          child: Image.asset(
                            'assets/images/alarm_icon_pasif.png',
                            scale: 6/oran,
                          )),
                    )
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 0, bottom: 0, left: 120*oran, right: 120*oran),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(216, 27, 96, 1.0),
                  height: 2,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10*oran),
                              child: Text(
                                _turMethot(tur),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 16, fontFamily: 'Audio wide'),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[


                                    Container(
                                      padding: EdgeInsets.only(left: 30*oran,right: 30*oran),
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: <Color>[
                                                  Color(0xFF1B2178),
                                                  //Color(0xFF1976D2),
                                                  Color(0xFF414471),
                                                ],
                                                begin: FractionalOffset
                                                    .topCenter,
                                                end: FractionalOffset
                                                    .bottomCenter),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: FlatButton(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            padding: EdgeInsets.only(
                                                top: 15*oran, bottom: 15*oran),
                                            onPressed: () {},
                                            child: Text(
                                              SelectLanguage()
                                                  .selectStrings(
                                                      dilSecimi, "tv45"),
                                              textScaleFactor: oran,style: TextStyle(
                                                  fontFamily: 'Kelly Slab',
                                                  fontSize: 23,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Colors.white),
                                            ))),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Padding(
                                          padding: EdgeInsets.only(right: 10*oran),
                                          child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv40'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                          ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                        ),
                                        Text(SelectLanguage().selectStrings(dilSecimi, 'tv43'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                        ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)


                                      ],
                                    )




                                  ],
                                ),
                              ),
                            ),

                            //Kazan 2 ye GEÇİŞ

                            Container(
                              margin: EdgeInsets.only(top: 40*oran, bottom: 40*oran),
                              alignment: Alignment.center,
                              color: Color.fromRGBO(216, 27, 96, 1.0),
                              width: 2,
                            ),

                            Expanded(
                              child: Container(
                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv41'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                      ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                    ),
                                    Text("80.0",textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                    ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 55),),
                                    Text(SelectLanguage().selectStrings(dilSecimi, 'tv39'),textScaleFactor: oran,style: TextStyle(fontSize: 18),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            margin: EdgeInsets.all(5*oran),
            padding: EdgeInsets.only(top: 0),
            alignment: Alignment.center,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 50*oran,
        height: 50*oran,
        margin: EdgeInsets.only(top: 70*oran,right: 5*oran),
        
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size:50*oran,color: Colors.black,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

    //endregion
  }


  _languageClick(BuildContext context) {
    dbHelper.veriYOKSAekleVARSAguncelle(13, dilSecimi, "0", "0", "0");
  }

  _turMethot(String x) {
    String sonuc = "";
    if (x == "k1")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv32");
    else if (x == "k2")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv33");
    else if (x == "s1")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv8");
    else if (x == "s2")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv9");
    else if (x == "s3")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv10");
    else if (x == "s4") 
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv11");

    return sonuc;
  }


}
