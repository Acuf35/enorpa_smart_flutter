import 'dart:math';

import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class VeriTuru extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VeriTuruState();
  }
}

class VeriTuruState extends State<VeriTuru> {
  final dbHelper = DatabaseHelper.instance;

  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi = "TR";
  String k1_aktif = "0";
  String k2_aktif = "0";
  String s1_aktif = "0";
  String s2_aktif = "0";
  String s3_aktif = "0";
  String s4_aktif = "0";
  int sektorSayisi = 0;

  int aktif_kazan = 1;
  int aktif_sektor = 1;

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
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          SelectLanguage().selectStrings(dilSecimi, 'tv98'),
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
                          onPressed: () {},
                          child: Image.asset(
                            'assets/images/alarm_icon_pasif.png',
                            scale: 6/oran,
                          )),
                    )
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 0, bottom: 10*oran, left: 40*oran, right: 40*oran),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(216, 27, 96, 1.0),
                  height: 2,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                //color: Colors.yellow,
                                margin: EdgeInsets.only(right: 5*oran, left: 5*oran),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _kazanAktifPasifEnabledButton(
                                                            k1_aktif,
                                                            aktif_kazan,
                                                            1),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (k1_aktif == "1") {
                                                            aktif_kazan = 1;
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          SelectLanguage().selectStrings(dilSecimi, 'btn8'),
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                              SizedBox(width: 2*oran,),
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _kazanAktifPasifEnabledButton(
                                                            k2_aktif,
                                                            aktif_kazan,
                                                            2),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (k2_aktif == "1") {
                                                            aktif_kazan = 2;
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          SelectLanguage().selectStrings(dilSecimi, 'btn9'),
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(
                                                                      0xFF1B2178),
                                                                  //Color(0xFF1976D2),
                                                                  Color(
                                                                      0xFF414471),
                                                                ],
                                                                begin: FractionalOffset
                                                                    .topCenter,
                                                                end: FractionalOffset
                                                                    .bottomCenter),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7*oran,
                                                                bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          Navigator.of(context).pop(1);
                                                        },
                                                        child: Text(
                                                          "KAZAN SICAKLIĞI",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                                Container(
                                                  margin: EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(
                                                                      0xFF1B2178),
                                                                  //Color(0xFF1976D2),
                                                                  Color(
                                                                      0xFF414471),
                                                                ],
                                                                begin: FractionalOffset
                                                                    .topCenter,
                                                                end: FractionalOffset
                                                                    .bottomCenter),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7*oran,
                                                                bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          Navigator.of(context).pop(2);
                                                        },
                                                        child: Text(
                                                          "DÖNÜŞ SUYU SICAKLIĞI",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                              alignment: Alignment.center,
                              color: Color.fromRGBO(216, 27, 96, 1.0),
                              width: 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.lightBlue,
                                margin: EdgeInsets.only(right: 5*oran, left: 5*oran),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _sektorAktifPasifEnabledButton(
                                                            s1_aktif,
                                                            aktif_sektor,
                                                            1),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (s1_aktif == "1") {
                                                            aktif_sektor = 1;
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          "SEKTÖR 1",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                              SizedBox(width: 2*oran,),
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _sektorAktifPasifEnabledButton(
                                                            s2_aktif,
                                                            aktif_sektor,
                                                            2),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (s2_aktif == "1") {
                                                            aktif_sektor = 2;
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          "SEKTÖR 2",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                              SizedBox(width: 2*oran,),
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _sektorAktifPasifEnabledButton(
                                                            s3_aktif,
                                                            aktif_sektor,
                                                            3),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (s3_aktif == "1") {
                                                            aktif_sektor = 3;
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          "SEKTÖR 3",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                              SizedBox(width: 2*oran,),
                                              Expanded(
                                                                                              child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5*oran, right: 5*oran),
                                                    decoration:
                                                        _sektorAktifPasifEnabledButton(
                                                            s4_aktif,
                                                            aktif_sektor,
                                                            4),
                                                    //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                    child: FlatButton(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        padding: EdgeInsets.only(
                                                            top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                                                        onPressed: () {
                                                          if (s4_aktif == "1") {
                                                            aktif_sektor = 4;
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          "SEKTÖR 4",
                                                          textScaleFactor: oran,style: TextStyle(
                                                              fontFamily:
                                                                  'Kelly Slab',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10*oran,
                                                  bottom: 10*oran,
                                                  left: 100*oran,
                                                  right: 100*oran),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5*oran, right: 5*oran),
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <
                                                                      Color>[
                                                                    Color(
                                                                        0xFF213E51),
                                                                    //Color(0xFF1976D2),
                                                                    Color(
                                                                        0xFF3C6D8C),
                                                                  ],
                                                                  begin: FractionalOffset
                                                                      .topCenter,
                                                                  end: FractionalOffset
                                                                      .bottomCenter),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: RawMaterialButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran, left:7*oran,right:7*oran),
                                                          constraints:
                                                              BoxConstraints(),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(3);
                                                          },
                                                          child: Text(
                                                            "ORTALAMA SICAKLIK",
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5*oran, right: 5*oran),
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <
                                                                      Color>[
                                                                    Color(
                                                                        0xFF213E51),
                                                                    //Color(0xFF1976D2),
                                                                    Color(
                                                                        0xFF3C6D8C),
                                                                  ],
                                                                  begin: FractionalOffset
                                                                      .topCenter,
                                                                  end: FractionalOffset
                                                                      .bottomCenter),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: RawMaterialButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran, left:7*oran,right:7*oran),
                                                          constraints:
                                                              BoxConstraints(),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(4);
                                                          },
                                                          child: Text(
                                                            "KUZEY BÖLGE SICAKLIĞI",
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5*oran, right: 5*oran),
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <
                                                                      Color>[
                                                                    Color(
                                                                        0xFF213E51),
                                                                    //Color(0xFF1976D2),
                                                                    Color(
                                                                        0xFF3C6D8C),
                                                                  ],
                                                                  begin: FractionalOffset
                                                                      .topCenter,
                                                                  end: FractionalOffset
                                                                      .bottomCenter),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: RawMaterialButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran, left:7*oran,right:7*oran),
                                                          constraints:
                                                              BoxConstraints(),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(5);
                                                          },
                                                          child: Text(
                                                            "ORTA BÖLGE SICAKLIĞI",
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5*oran, right: 5*oran),
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <
                                                                      Color>[
                                                                    Color(
                                                                        0xFF213E51),
                                                                    //Color(0xFF1976D2),
                                                                    Color(
                                                                        0xFF3C6D8C),
                                                                  ],
                                                                  begin: FractionalOffset
                                                                      .topCenter,
                                                                  end: FractionalOffset
                                                                      .bottomCenter),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: RawMaterialButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          constraints:
                                                              BoxConstraints(),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran, left:7*oran,right:7*oran),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(6);
                                                          },
                                                          child: Text(
                                                            "GÜNEY BÖLGE SICAKLIĞI",
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5*oran, right: 5*oran),
                                                      decoration:
                                                          const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: <
                                                                      Color>[
                                                                    Color(
                                                                        0xFF213E51),
                                                                    //Color(0xFF1976D2),
                                                                    Color(
                                                                        0xFF3C6D8C),
                                                                  ],
                                                                  begin: FractionalOffset
                                                                      .topCenter,
                                                                  end: FractionalOffset
                                                                      .bottomCenter),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: RawMaterialButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          constraints:
                                                              BoxConstraints(),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran, left:7*oran,right:7*oran),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(7);
                                                          },
                                                          child: Text(
                                                            "NEM DEĞERİ",
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0, bottom: 0, left: 40*oran, right: 40*oran),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(216, 27, 96, 1.0),
                        height: 2,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                          padding: EdgeInsets.only(left: 50*oran, right: 50*oran),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF213E51),
                                    //Color(0xFF1976D2),
                                    Color(0xFF3C6D8C),
                                  ],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: FlatButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.only(top: 7*oran, bottom: 7*oran, left:7*oran,right:7*oran),
                              onPressed: () {
                                Navigator.of(context).pop(8);
                              },
                              child: Text(
                                "ALARM GEÇMİŞİ",
                                textScaleFactor: oran,style: TextStyle(
                                    fontFamily: 'Kelly Slab',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))),
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
    );

    //endregion
  }

  _satirlar(List<Map> satirlar) {
    if (satSay > 6) {
      k1_aktif = satirlar[6]["veri1"];
    }

    if (satSay > 7) {
      k2_aktif = satirlar[7]["veri1"];
    }

    if (satSay > 8) {
      satirlar[8]["veri1"] == "1" || satirlar[8]["veri2"] == "1"
          ? s1_aktif = "1"
          : s1_aktif = "0";
      satirlar[9]["veri1"] == "1" || satirlar[9]["veri2"] == "1"
          ? s2_aktif = "1"
          : s2_aktif = "0";
      satirlar[10]["veri1"] == "1" || satirlar[10]["veri2"] == "1"
          ? s3_aktif = "1"
          : s3_aktif = "0";
      satirlar[11]["veri1"] == "1" || satirlar[11]["veri2"] == "1"
          ? s4_aktif = "1"
          : s4_aktif = "0";
    }

    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

    if (s1_aktif == "1") sektorSayisi++;
    if (s2_aktif == "1") sektorSayisi++;
    if (s3_aktif == "1") sektorSayisi++;
    if (s4_aktif == "1") sektorSayisi++;

    if (k1_aktif == "1")
      aktif_kazan = 1;
    else if (k2_aktif == "1")
      aktif_kazan = 2;
    else
      aktif_kazan = 0;

    if (s1_aktif == "1")
      aktif_sektor = 1;
    else if (s2_aktif == "1")
      aktif_sektor = 2;
    else if (s3_aktif == "1")
      aktif_sektor = 3;
    else if (s4_aktif == "1")
      aktif_sektor = 4;
    else
      aktif_kazan = 0;

    setState(() {});
  }

  _languageClick(BuildContext context) {
    dbHelper.veriYOKSAekleVARSAguncelle(13, dilSecimi, "0", "0", "0");
  }

  _kazanAktifPasifEnabledButton(String aktifMi, int aktif_Kazan, int kazNo) {
    var decoration;

    if (aktifMi == "1" && aktif_Kazan == kazNo) {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0F8714),
                //Color(0xFF1976D2),
                Color(0xFF69F51E),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    } else if (aktifMi == "1" && aktif_Kazan != kazNo) {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF1B2178),
                //Color(0xFF1976D2),
                Color(0xFF414471),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    } else {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF747576),
                //Color(0xFF1976D2),
                Color(0xFF393939),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }

    return decoration;
  }

  _sektorAktifPasifEnabledButton(String aktifMi, int aktif_Sektor, sekNo) {
    var decoration;

    if (aktifMi == "1" && aktif_Sektor == sekNo) {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0F8714),
                //Color(0xFF1976D2),
                Color(0xFF69F51E),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    } else if (aktifMi == "1" && aktif_Sektor != sekNo) {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF213E51),
                //Color(0xFF1976D2),
                Color(0xFF3C6D8C),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    } else {
      decoration = const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF747576),
                //Color(0xFF1976D2),
                Color(0xFF393939),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }

    return decoration;
  }
}
