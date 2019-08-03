import 'dart:math';

import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel/deger_giris_tarih.dart';
import 'package:enorpa_smart/genel/deger_giris_verituru.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Veri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VeriState();
  }
}

class VeriState extends State<Veri> {
  final dbHelper = DatabaseHelper.instance;

  String kazan_yuk_sic = "80.0";
  String kazan_dus_sic = "20.0";
  String sek_yuk_sic = "40.0";
  String sek_dus_sic = "10.0";
  String sek_yuk_nem = "85.0";
  String sek_dus_nem = "30.0";

  

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

  int ipt_bru_ari = 0;
  int ipt_pom_ter_atti = 0;
  int ipt_mek_dus_sic = 0;
  int ipt_mek_yuk_sic = 0;
  int ipt_acil_stop = 0;
  int ipt_faz_hata = 0;
  int ipt_kaz_yuk_sic = 0;
  int ipt_kaz_dus_sic = 0;
  int ipt_sek_yuk_sic = 0;
  int ipt_sek_dus_sic = 0;
  int ipt_sek_yuk_nem = 0;
  int ipt_sek_dus_nem = 0;
  int ipt_kuz_sen_hata = 0;
  int ipt_orta_sen_hata = 0;
  int ipt_guney_sen_hata = 0;
  int ipt_kaz_sen_hata = 0;
  int ipt_donus_su_sen_hata = 0;

  int gun = 01;
  int ay = 01;
  int yil = 2019;

  int _gun1 = 0;
  int _gun2 = 1;
  int _ay1 = 0;
  int _ay2 = 1;
  int _yil1 = 2;
  int _yil2 = 0;
  int _yil3 = 1;
  int _yil4 = 9;

  
  String veriTuru = '';

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
                        padding: EdgeInsets.only(top: 10*oran),
                        child: Text(
                          SelectLanguage().selectStrings(dilSecimi, 'tv93'),
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
                          )),
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Colors.lightBlue,
                              margin: EdgeInsets.only(right: 5*oran, left: 5*oran),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10*oran, right: 10*oran),
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
                                                    top: 7*oran, bottom: 7*oran),
                                                onPressed: () {
                                                  

                                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VeriTuru())
                                            ).then((val){

                                              if(val==1)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn35');
                                              else if(val==2)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn36');
                                              else if(val==3)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn37');
                                              else if(val==4)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn38');
                                              else if(val==5)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn39');
                                              else if(val==6)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn40');
                                              else if(val==7)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn41');
                                              else if(val==8)
                                                veriTuru=SelectLanguage().selectStrings(dilSecimi, 'btn34');




                                            });





                                                },
                                                child: Text(
                                                  veriTuru=="" ? SelectLanguage().selectStrings(dilSecimi, 'btn32') : veriTuru,
                                                  textScaleFactor: oran,style: TextStyle(
                                                      fontFamily: 'Kelly Slab',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    SelectLanguage()
                                                        .selectStrings(
                                                            dilSecimi, 'tv96'),
                                                    textScaleFactor: oran,style: TextStyle(
                                                        fontFamily:
                                                            'Audio wide'),
                                                  ),
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
                                                      child: FlatButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran),
                                                          onPressed: () {

                                                            if(gun>9){
                                                            _gun1=int.parse(gun.toString().split('')[0]);
                                                            _gun2=int.parse(gun.toString().split('')[1]);
                                                            }else{
                                                              _gun1=0;
                                                            _gun2=gun;
                                                            }

                                                            if(gun>9){
                                                            _ay1=int.parse(ay.toString().split('')[0]);
                                                            _ay2=int.parse(ay.toString().split('')[1]);
                                                            }else{
                                                              _ay1=0;
                                                            _ay2=ay;
                                                            }

                                                            _yil1=int.parse(yil.toString().split('')[0]);
                                                            _yil2=int.parse(yil.toString().split('')[1]);
                                                            _yil3=int.parse(yil.toString().split('')[2]);
                                                            _yil4=int.parse(yil.toString().split('')[3]);


                                                            _degergirisTarih();
                                                          },
                                                          child: Text(
                                                            gun < 10
                                                                ? "0" +
                                                                    gun.toString()
                                                                : gun.toString(),
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 5*oran, right: 5*oran),
                                                child: Text(
                                                  "-",
                                                  textScaleFactor: oran,style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    SelectLanguage()
                                                        .selectStrings(
                                                            dilSecimi, 'tv94'),
                                                    textScaleFactor: oran,style: TextStyle(
                                                        fontFamily:
                                                            'Audio wide'),
                                                  ),
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
                                                      child: FlatButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran),
                                                          onPressed: () {
                                                            if(gun>9){
                                                            _gun1=int.parse(gun.toString().split('')[0]);
                                                            _gun2=int.parse(gun.toString().split('')[1]);
                                                            }else{
                                                              _gun1=0;
                                                            _gun2=gun;
                                                            }

                                                            if(gun>9){
                                                            _ay1=int.parse(ay.toString().split('')[0]);
                                                            _ay2=int.parse(ay.toString().split('')[1]);
                                                            }else{
                                                              _ay1=0;
                                                            _ay2=ay;
                                                            }

                                                            _yil1=int.parse(yil.toString().split('')[0]);
                                                            _yil2=int.parse(yil.toString().split('')[1]);
                                                            _yil3=int.parse(yil.toString().split('')[2]);
                                                            _yil4=int.parse(yil.toString().split('')[3]);


                                                            _degergirisTarih();
                                                          },
                                                          child: Text(
                                                            ay < 10
                                                                ? "0" +
                                                                    ay.toString()
                                                                : ay.toString(),
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 5*oran, right: 5*oran),
                                                child: Text(
                                                  "-",
                                                  textScaleFactor: oran,style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    SelectLanguage()
                                                        .selectStrings(
                                                            dilSecimi, 'tv95'),
                                                    textScaleFactor: oran,style: TextStyle(
                                                        fontFamily:
                                                            'Audio wide'),
                                                  ),
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
                                                      child: FlatButton(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7*oran,
                                                                  bottom: 7*oran),
                                                          onPressed: () {
                                                            if(gun>9){
                                                            _gun1=int.parse(gun.toString().split('')[0]);
                                                            _gun2=int.parse(gun.toString().split('')[1]);
                                                            }else{
                                                              _gun1=0;
                                                            _gun2=gun;
                                                            }

                                                            if(gun>9){
                                                            _ay1=int.parse(ay.toString().split('')[0]);
                                                            _ay2=int.parse(ay.toString().split('')[1]);
                                                            }else{
                                                              _ay1=0;
                                                            _ay2=ay;
                                                            }

                                                            _yil1=int.parse(yil.toString().split('')[0]);
                                                            _yil2=int.parse(yil.toString().split('')[1]);
                                                            _yil3=int.parse(yil.toString().split('')[2]);
                                                            _yil4=int.parse(yil.toString().split('')[3]);


                                                            _degergirisTarih();
                                                          },
                                                          child: Text(
                                                            yil.toString(),
                                                            textScaleFactor: oran,style: TextStyle(
                                                                fontFamily:
                                                                    'Kelly Slab',
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10*oran, right: 10*oran),
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
                                                    top: 7*oran, bottom: 7*oran),
                                                onPressed: () {
                                                  if (s4_aktif == "1") {
                                                    aktif_sektor = 4;
                                                  }
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  SelectLanguage()
                                                      .selectStrings(
                                                          dilSecimi, 'btn33'),
                                                  textScaleFactor: oran,style: TextStyle(
                                                      fontFamily: 'Kelly Slab',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15*oran, right: 15*oran, top: 15*oran, bottom: 10*oran),
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                color: Colors.deepOrange,
                                child: Text(
                                  SelectLanguage()
                                      .selectStrings(dilSecimi, 'tv97'),
                                  textScaleFactor: oran,style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Kelly Slab',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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

  _iptalEnabledButton(int deger) {
    var decoration;

    if (deger == 1) {
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
    } else {
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
    }

    return decoration;
  }

  Future _degergirisTarih() async {
    // flutter defined function

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        List tarih = [_gun1, _gun2, _ay1, _ay2, _yil1, _yil2, _yil3, _yil4];

        return DegerGirisTarih.Deger(tarih);
      },
    ).then((val) {
      gun = int.parse(val[0].toString() + val[1].toString());
      ay = int.parse(val[2].toString() + val[3].toString());
      yil = int.parse(val[4].toString() +
          val[5].toString() +
          val[6].toString() +
          val[7].toString());

      setState(() {});
    });
  }
}
