import 'dart:math';

import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel_ayarlar.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/kontrol/kalibrasyon.dart';
import 'package:enorpa_smart/kontrol/veri.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'alarm.dart';
import 'baslangic_baglanti_ayarlari.dart';
import 'izleme.dart';
import 'kontrol.dart';
import 'manuel.dart';

class Ayarlar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AyarlarState();
  }
}

class AyarlarState extends State<Ayarlar> {

  final dbHelper = DatabaseHelper.instance;

  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi="TR";







  int _counter = 0;
  bool _buttonPressed = false;
  bool _loopActive = false;
  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        _counter++;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }

    _loopActive = false;
  }







  @override
  Widget build(BuildContext context) {

    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    //SystemChrome.setEnabledSystemUIOverlays([]);


    satirlar = dbHelper.satirlariCek();
    final satirSayisi = dbHelper.satirSayisi();
    satirSayisi.then((int satirSayisi) => satSay = satirSayisi);
    satirSayisi.whenComplete(() {
      if (sayac == 0) {
        satirlar.then((List<Map> satir) => _satirlar(satir));
        sayac++;
      }
    });


    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    var oran = sqrt(carpim/300441.0);

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
                          SelectLanguage().selectStrings(dilSecimi, 'tv12'),
                          textScaleFactor: oran,
                          style: TextStyle(
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
                        )
                      ),
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

/*
                      CustomButton(
                      onPressed: () {
                print("Tapped Me");
                },
                ),



                      Listener(
                        onPointerDown: (details) {
                          _buttonPressed = true;
                          _increaseCounterWhilePressed();
                        },
                        onPointerUp: (details) {
                          _buttonPressed = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
                          padding: EdgeInsets.all(16.0),
                          child: Text('Value: $_counter'),
                        ),
                      ),

        */

                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: (){


                                  //Navigator.push(context,MaterialPageRoute(builder: (context) =>Kontrol()));

                                  Navigator.pushNamed(context, '/kontrol');



                                },
                                child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 2.3/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn25'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                            Expanded(
                              child: FlatButton(onPressed: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Izleme()));

                              }, child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 2.3/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn14'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                            Expanded(
                              child: FlatButton(onPressed: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Manuel()));

                              }, child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 2.3/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn16'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                          ],

                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: <Widget>[


                            Expanded(

                              child: Visibility(
                                visible: false,
                                                              child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(5*oran),
                                        margin: EdgeInsets.only(bottom: 10*oran),
                                        color: dilSecimi=="TR" ? Colors.deepOrange : Colors.transparent,
                                        //padding: EdgeInsets.only(left: 20,right: 20),
                                        child: Container(
                                          padding: EdgeInsets.all(3*oran),
                                          color: dilSecimi=="TR" ? Colors.white : Colors.transparent,
                                          child: RawMaterialButton(
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            constraints: BoxConstraints(),
                                            padding: EdgeInsets.all(0), // optional, in order to add additional space around text if needed
                                            child: Text('TR',style: TextStyle(fontSize: 25*oran,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),
                                            onPressed: (){
                                              dilSecimi="TR";
                                              _languageClick(context);
                                              setState(() {});
                                              },

                                          ),
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.all(5*oran),
                                        margin: EdgeInsets.only(bottom: 10*oran),
                                        color: dilSecimi=="EN" ? Colors.deepOrange : Colors.transparent,
                                        //padding: EdgeInsets.only(left: 20,right: 20),
                                        child: Container(
                                          padding: EdgeInsets.all(3*oran),
                                          color: dilSecimi=="EN" ? Colors.white : Colors.transparent,
                                          child: RawMaterialButton(
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            constraints: BoxConstraints(),
                                            padding: EdgeInsets.all(0), // optional, in order to add additional space around text if needed
                                            child: Text('EN',style: TextStyle(fontSize: 25*oran,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),
                                            onPressed: (){
                                              dilSecimi="EN";
                                              _languageClick(context);
                                              setState(() {});
                                              },

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              flex: 1,

                            ),

                            Expanded(
                              flex: 2,
                              child: FlatButton(onPressed: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Alarm()));

                              }, child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 3.2/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn15'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: FlatButton(onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Veri()));

                              }, child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 3.2/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn13'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: FlatButton(onPressed: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Kalibrasyon()));
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[

                                  Image.asset(
                                    'assets/images/giris_rotate_icon_beyaz.png',
                                    scale: 3.2/oran,
                                  ),


                                  Text(
                                    SelectLanguage().selectStrings(dilSecimi, 'btn12'),
                                    textScaleFactor: oran,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Audio wide'),
                                  )


                                ],
                              ),

                              ),
                            ),

                            Expanded(


                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 10*oran),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[

                                    Text(SelectLanguage().selectStrings(dilSecimi, 'tv13'),style: TextStyle(fontFamily: 'Audio wide'),textScaleFactor: oran,),
                                    FlatButton(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      //constraints: BoxConstraints(),
                                      padding: EdgeInsets.all(0), // optional, in order to add additional space around text if needed
                                      child: Image.asset(
                                        'assets/images/settings_icon.png',
                                        scale: 3/oran,
                                      ),
                                      onPressed: (){

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BaslangicBaglantiAyarlari()));

                                      },

                                    ),
                                  ],
                                ),
                              ),

                              flex: 1,

                            )
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

            //Navigator.of(context).pop();
            Navigator.popUntil(context, ModalRoute.withName('/genelAyarlar'));
            
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size:50*oran,color: Colors.black,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

    //endregion


  }

  _satirlar(List<Map> satirlar) {
    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }
    print(satirlar);
    setState(() {});
  }


  _languageClick(BuildContext context) {

    dbHelper.veriYOKSAekleVARSAguncelle(
        13, dilSecimi, "0", "0", "0");

  }



}
