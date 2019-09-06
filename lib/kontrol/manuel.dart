import 'dart:math';

import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class Manuel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  ManuelState();
  }
}

class  ManuelState extends State< Manuel> {

  final dbHelper = DatabaseHelper.instance;



  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi="TR";
  String k2_aktif="0";
  String s1_aktif="0";
  String s2_aktif="0";
  String s3_aktif="0";
  String s4_aktif="0";
  int sektorSayisi=0;



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

    var oran;
    var oran_en;

    try {
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    var x=MediaQuery.of(context).size.width;
    var y=MediaQuery.of(context).size.height;
    oran = sqrt(carpim/300441.0);
    oran_en = (x-568) <= 0 ? 0.5 : ((x-568)>=800 ? 1.0 : (0.5+(x/1600)));

    }catch(Exception){
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
                          SelectLanguage().selectStrings(dilSecimi, 'tv47'),
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
                  EdgeInsets.only(top: 0, bottom: 10*oran, left: 120*oran, right: 120*oran),
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
                              child: Container(
                                margin: EdgeInsets.only(right: k2_aktif=="1" ? 10 : 160*oran,left: k2_aktif=="1" ? 0 : 160*oran),
                                child: Row(
                                  children: <Widget>[

                                    Expanded(

                                      child: Column(
                                        children: <Widget>[

                                          Expanded(
                                            flex:5,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Stack(
                                                //alignment: AlignmentDirectional.center,
                                                children: <Widget>[
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/images/kazan_icon.png',
                                                    ),
                                                  ),

                                                  Container(
                                                    child: Text("1",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                    padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
                                                  )

                                                ],

                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(bottom: 5*oran,left: 10*oran,right: 10*oran),
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF1B2178),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF414471),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                      ),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn28'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  ),
                                                )

                                              ],
                                            ),
                                          )

                                        ],
                                      ),

                                    ),

                                    Expanded(

                                        child: Column(
                                          children: <Widget>[

                                            Expanded(
                                              child: Row(
                                                children: <Widget>[


                                                  Expanded(flex:3,
                                                      child: Container(
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <Color>[
                                                                    Color(0xFF747576),
                                                                    //Color(0xFF1976D2),
                                                                    Color(0xFF393939),
                                                                  ],
                                                                  begin: FractionalOffset.topCenter,
                                                                  end: FractionalOffset.bottomCenter),

                                                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                              onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn5'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )
                                                ],
                                              ),
                                            ),

                                            Container(
                                              //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                              alignment: Alignment.center,
                                              color: Color.fromRGBO(216, 27, 96, 1.0),
                                              height: 2,
                                            ),

                                            Expanded(
                                              child: Row(
                                                children: <Widget>[

                                                  Expanded(flex:3,
                                                      child: Container(
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <Color>[
                                                                    Color(0xFF747576),
                                                                    //Color(0xFF1976D2),
                                                                    Color(0xFF393939),
                                                                  ],
                                                                  begin: FractionalOffset.topCenter,
                                                                  end: FractionalOffset.bottomCenter),

                                                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                              onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn6'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )


                                                ],
                                              ),
                                            ),

                                            Container(
                                              //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                              alignment: Alignment.center,
                                              color: Color.fromRGBO(216, 27, 96, 1.0),
                                              height: 2,
                                            ),

                                            Expanded(
                                              child: Row(
                                                children: <Widget>[


                                                  Expanded(flex:3,
                                                      child: Container(
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <Color>[
                                                                    Color(0xFF747576),
                                                                    //Color(0xFF1976D2),
                                                                    Color(0xFF393939),
                                                                  ],
                                                                  begin: FractionalOffset.topCenter,
                                                                  end: FractionalOffset.bottomCenter),

                                                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                              onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn26'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )

                                                ],
                                              ),
                                            ),

                                            Container(
                                              //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                              alignment: Alignment.center,
                                              color: Color.fromRGBO(216, 27, 96, 1.0),
                                              height: 2,
                                            ),

                                            Expanded(
                                              child: Row(
                                                children: <Widget>[


                                                  Expanded(flex:3,
                                                      child: Container(
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <Color>[
                                                                    Color(0xFF747576),
                                                                    //Color(0xFF1976D2),
                                                                    Color(0xFF393939),
                                                                  ],
                                                                  begin: FractionalOffset.topCenter,
                                                                  end: FractionalOffset.bottomCenter),

                                                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                              onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn26'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )

                                                ],
                                              ),
                                            ),



                                          ],
                                        )




                                    )

                                  ],
                                ),
                              ),
                            ),



                            //Kazan 2 ye GEÇİŞ


                            Visibility(
                              visible: k2_aktif=="1" ? true : false,
                              child: Container(
                                margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                                alignment: Alignment.center,
                                color: Color.fromRGBO(
                                    216, 27, 96, 1.0),
                                width: 2,
                              ),
                            ),

                            Visibility(
                              visible: k2_aktif=="1" ? true : false,
                              child: Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: k2_aktif=="1" ? 10*oran : 180*oran,left: k2_aktif=="1" ? 0 : 180*oran),
                                  child: Row(
                                    children: <Widget>[

                                      Expanded(

                                        child: Column(
                                          children: <Widget>[

                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  //alignment: AlignmentDirectional.center,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/kazan_icon.png',
                                                      ),
                                                    ),

                                                    Container(
                                                      child: Text("2",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                      padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
                                                    )

                                                  ],

                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                        margin: EdgeInsets.only(bottom: 5*oran,left: 10*oran,right: 10*oran),
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF1B2178),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF414471),
                                                                ],
                                                                begin: FractionalOffset.topCenter,
                                                                end: FractionalOffset.bottomCenter
                                                            ),
                                                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                        ),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn28'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    ),
                                                  )

                                                ],
                                              ),
                                            )

                                          ],
                                        ),

                                      ),

                                      Expanded(

                                          child: Column(
                                            children: <Widget>[

                                              Expanded(
                                                child: Row(
                                                  children: <Widget>[


                                                    Expanded(flex:3,
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    colors: <Color>[
                                                                      Color(0xFF747576),
                                                                      //Color(0xFF1976D2),
                                                                      Color(0xFF393939),
                                                                    ],
                                                                    begin: FractionalOffset.topCenter,
                                                                    end: FractionalOffset.bottomCenter),

                                                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                            //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                            child: FlatButton(
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn5'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white),))
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(216, 27, 96, 1.0),
                                                height: 2,
                                              ),

                                              Expanded(
                                                child: Row(
                                                  children: <Widget>[

                                                    Expanded(flex:3,
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    colors: <Color>[
                                                                      Color(0xFF747576),
                                                                      //Color(0xFF1976D2),
                                                                      Color(0xFF393939),
                                                                    ],
                                                                    begin: FractionalOffset.topCenter,
                                                                    end: FractionalOffset.bottomCenter),

                                                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                            //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                            child: FlatButton(
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn6'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white),))
                                                        )
                                                    )


                                                  ],
                                                ),
                                              ),

                                              Container(
                                                //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(216, 27, 96, 1.0),
                                                height: 2,
                                              ),

                                              Expanded(
                                                child: Row(
                                                  children: <Widget>[


                                                    Expanded(flex:3,
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    colors: <Color>[
                                                                      Color(0xFF747576),
                                                                      //Color(0xFF1976D2),
                                                                      Color(0xFF393939),
                                                                    ],
                                                                    begin: FractionalOffset.topCenter,
                                                                    end: FractionalOffset.bottomCenter),

                                                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                            //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                            child: FlatButton(
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn26'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white),))
                                                        )
                                                    )

                                                  ],
                                                ),
                                              ),

                                              Container(
                                                //margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(216, 27, 96, 1.0),
                                                height: 2,
                                              ),

                                              Expanded(
                                                child: Row(
                                                  children: <Widget>[


                                                    Expanded(flex:3,
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    colors: <Color>[
                                                                      Color(0xFF747576),
                                                                      //Color(0xFF1976D2),
                                                                      Color(0xFF393939),
                                                                    ],
                                                                    begin: FractionalOffset.topCenter,
                                                                    end: FractionalOffset.bottomCenter),

                                                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                            //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                            child: FlatButton(
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn26'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white),))
                                                        )
                                                    )

                                                  ],
                                                ),
                                              ),



                                            ],
                                          )




                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),








                          ],

                        ),
                      ),

                      Container(
                        margin:
                        EdgeInsets.only(top: 0, bottom: 0, left: 40*oran, right: 40*oran),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(216, 27, 96, 1.0),
                        height: 2,
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: sektorSayisi==4 ? 0 : (sektorSayisi==3 ? 120*oran_en : (sektorSayisi==2 ? 200*oran_en : (sektorSayisi==1 ? 280*oran_en : 280*oran_en))) ,
                              right: sektorSayisi==4 ? 0 : (sektorSayisi==3 ? 120*oran_en : (sektorSayisi==2 ? 200*oran_en : (sektorSayisi==1 ? 280*oran_en : 280*oran_en)))),
                          child: Row(
                            children: <Widget>[


                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10*oran),
                                    child: Column(
                                      children: <Widget>[

                                        Text(SelectLanguage().selectStrings(dilSecimi, "tv23"),textScaleFactor: oran,style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontFamily: 'Audio wide'),),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[




                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn11"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )
                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn26"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn27"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),



                                      ],
                                    ),
                                  )




                              ),

                              Visibility(
                                visible: sektorSayisi>1 ? true : false,
                                child: Container(
                                  margin: EdgeInsets.all(10*oran),
                                  alignment: Alignment.center,
                                  color: Color.fromRGBO(
                                      216, 27, 96, 1.0),
                                  width: 2,
                                ),
                              ),


                              Visibility(
                                visible: sektorSayisi>1 ? true : false,
                                child: Expanded(
                                    child: Column(
                                      children: <Widget>[

                                        Text(SelectLanguage().selectStrings(dilSecimi, "tv24"),textScaleFactor: oran,style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontFamily: 'Audio wide'),),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[




                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn11"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )
                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn26"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn27"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),



                                      ],
                                    )




                                ),
                              ),


                              Visibility(
                                visible: sektorSayisi>2 ? true : false,
                                child: Container(
                                  margin: EdgeInsets.all(10*oran),
                                  alignment: Alignment.center,
                                  color: Color.fromRGBO(
                                      216, 27, 96, 1.0),
                                  width: 2,
                                ),
                              ),

                              Visibility(
                                visible: sektorSayisi>2 ? true : false,
                                child: Expanded(
                                    child: Column(
                                      children: <Widget>[

                                        Text(SelectLanguage().selectStrings(dilSecimi, "tv25"),textScaleFactor: oran,style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontFamily: 'Audio wide'),),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[




                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn11"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )
                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn26"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(216, 27, 96, 1.0),
                                          height: 2,
                                        ),

                                        Expanded(
                                          child: Row(
                                            children: <Widget>[


                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF747576),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF393939),
                                                              ],
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter),

                                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn27"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),



                                      ],
                                    )




                                ),
                              ),

                              Visibility(
                                visible: sektorSayisi>3 ? true : false,
                                child: Container(
                                  margin: EdgeInsets.all(10*oran),
                                  alignment: Alignment.center,
                                  color: Color.fromRGBO(
                                      216, 27, 96, 1.0),
                                  width: 2,
                                ),
                              ),

                              Visibility(
                                visible: sektorSayisi>3 ? true : false,
                                child: Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Column(
                                        children: <Widget>[

                                          Text(SelectLanguage().selectStrings(dilSecimi, "tv26"),textScaleFactor: oran,style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontFamily: 'Audio wide'),),

                                          Expanded(
                                            child: Row(
                                              children: <Widget>[




                                                Expanded(flex:3,
                                                    child: Container(
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF747576),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF393939),
                                                                ],
                                                                begin: FractionalOffset.topCenter,
                                                                end: FractionalOffset.bottomCenter),

                                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn11"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )
                                              ],
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                            alignment: Alignment.center,
                                            color: Color.fromRGBO(216, 27, 96, 1.0),
                                            height: 2,
                                          ),

                                          Expanded(
                                            child: Row(
                                              children: <Widget>[


                                                Expanded(flex:3,
                                                    child: Container(
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF747576),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF393939),
                                                                ],
                                                                begin: FractionalOffset.topCenter,
                                                                end: FractionalOffset.bottomCenter),

                                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn26"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )


                                              ],
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(top: 0, bottom: 0, left: 10*oran, right: 10*oran),
                                            alignment: Alignment.center,
                                            color: Color.fromRGBO(216, 27, 96, 1.0),
                                            height: 2,
                                          ),

                                          Expanded(
                                            child: Row(
                                              children: <Widget>[


                                                Expanded(flex:3,
                                                    child: Container(
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF747576),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF393939),
                                                                ],
                                                                begin: FractionalOffset.topCenter,
                                                                end: FractionalOffset.bottomCenter),

                                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){}, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn27"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )


                                              ],
                                            ),
                                          ),



                                        ],
                                      ),
                                    )




                                ),
                              ),

                            ],

                          ),
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


  _satirlar(List<Map> satirlar) {

    if (satSay > 7) {
      k2_aktif = satirlar[7]["veri1"];
    }

    if (satSay > 8) {
      satirlar[8]["veri1"]=="1" || satirlar[8]["veri2"]=="1" ? s1_aktif="1" : s1_aktif="0";
      satirlar[9]["veri1"]=="1" || satirlar[9]["veri2"]=="1" ? s2_aktif="1" : s2_aktif="0";
      satirlar[10]["veri1"]=="1" || satirlar[10]["veri2"]=="1" ? s3_aktif="1" : s3_aktif="0";
      satirlar[11]["veri1"]=="1" || satirlar[11]["veri2"]=="1" ? s4_aktif="1" : s4_aktif="0";
    }

    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

    if(s1_aktif=="1")
      sektorSayisi++;
    if(s2_aktif=="1")
      sektorSayisi++;
    if(s3_aktif=="1")
      sektorSayisi++;
    if(s4_aktif=="1")
      sektorSayisi++;

    setState(() {});
  }


  _languageClick(BuildContext context) {

    dbHelper.veriYOKSAekleVARSAguncelle(
        13, dilSecimi, "0", "0", "0");

  }




}





