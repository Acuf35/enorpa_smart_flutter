import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel/deger_giris_2x1.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlarmState();
  }
}

class AlarmState extends State<Alarm> {
  final dbHelper = DatabaseHelper.instance;

  int _onlar=2;
  int _birler=1;
  int _ondalik=5;
  int _yuzler=0;
  int _degerNo=0;

  String kazan_yuk_sic="80.0";
  String kazan_dus_sic="20.0";
  String sek_yuk_sic="40.0";
  String sek_dus_sic="10.0";
  String sek_yuk_nem="85.0";
  String sek_dus_nem="30.0";

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

  int ipt_bru_ari=0;
  int ipt_pom_ter_atti=0;
  int ipt_mek_dus_sic=0;
  int ipt_mek_yuk_sic=0;
  int ipt_acil_stop=0;
  int ipt_faz_hata=0;
  int ipt_kaz_yuk_sic=0;
  int ipt_kaz_dus_sic=0;
  int ipt_sek_yuk_sic=0;
  int ipt_sek_dus_sic=0;
  int ipt_sek_yuk_nem=0;
  int ipt_sek_dus_nem=0;
  int ipt_kuz_sen_hata=0;
  int ipt_orta_sen_hata=0;
  int ipt_guney_sen_hata=0;
  int ipt_kaz_sen_hata=0;
  int ipt_donus_su_sen_hata=0;

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
      var width = MediaQuery.of(context).size.width *
          MediaQuery.of(context).devicePixelRatio;
      var height = MediaQuery.of(context).size.height *
          MediaQuery.of(context).devicePixelRatio;
      var carpim = width * height;
      oran = carpim / 2073600.0;
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
                          SelectLanguage().selectStrings(dilSecimi, 'tv89'),
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
                  EdgeInsets.only(top: 0, bottom: 10*oran, left: 80*oran, right: 80*oran),
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

/*

                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.center,
                              color: Color.fromRGBO(216, 27, 96, 1.0),
                              width: 2,
                            ),
*/

                            Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.lightBlue,
                                margin: EdgeInsets.only(right: 5*oran, left: 5*oran ),
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
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5*oran, right: 5*oran),
                                                  decoration:_kazanAktifPasifEnabledButton(k1_aktif,aktif_kazan,1),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {
                                                        if(k1_aktif=="1"){
                                                          aktif_kazan=1;
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                       SelectLanguage().selectStrings(dilSecimi, 'tv32'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5*oran, right: 5*oran),
                                                  decoration:_kazanAktifPasifEnabledButton(k2_aktif,aktif_kazan,2),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {
                                                        if(k2_aktif=="1"){
                                                          aktif_kazan=2;
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        SelectLanguage().selectStrings(dilSecimi, 'tv33'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5*oran, right: 5*oran),
                                                  decoration:_sektorAktifPasifEnabledButton(s1_aktif,aktif_sektor,1),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {

                                                        if(s1_aktif=="1"){
                                                          aktif_sektor=1;
                                                        }

                                                        setState(() {});

                                                      },
                                                      child: Text(
                                                        SelectLanguage().selectStrings(dilSecimi, 'tv8'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5*oran, right: 5*oran),
                                                  decoration:_sektorAktifPasifEnabledButton(s2_aktif,aktif_sektor,2),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {

                                                        if(s2_aktif=="1"){
                                                          aktif_sektor=2;
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        SelectLanguage().selectStrings(dilSecimi, 'tv9'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5*oran, right: 5*oran),
                                                  decoration:_sektorAktifPasifEnabledButton(s3_aktif,aktif_sektor,3),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {

                                                        if(s3_aktif=="1"){
                                                          aktif_sektor=3;
                                                        }
                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        SelectLanguage().selectStrings(dilSecimi, 'tv10'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  decoration:_sektorAktifPasifEnabledButton(s4_aktif,aktif_sektor,4),
                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: FlatButton(
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      padding: EdgeInsets.only(
                                                          top: 7*oran, bottom: 7*oran,right: 5*oran, left: 5*oran),
                                                      onPressed: () {
                                                        if(s4_aktif=="1"){
                                                          aktif_sektor=4;
                                                        }
                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                       SelectLanguage().selectStrings(dilSecimi, 'tv11'),
                                                        textScaleFactor: oran,style: TextStyle(
                                                            fontFamily:
                                                            'Kelly Slab',
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color:
                                                            Colors.white),
                                                      ))),
                                            ],
                                          ),


                                          Expanded(child: Row(
                                            children: <Widget>[

                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[


                                                    Row(
                                                      children: <Widget>[

                                                        Expanded(flex: 2,
                                                            child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv62'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold,color: Colors.deepOrange.shade800),))
                                                        ),

                                                        Expanded(flex: 1,
                                                            child: Container(alignment: Alignment.center,  margin: EdgeInsets.only(top: 10*oran),
                                                                child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv63'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold,color: Colors.deepOrange.shade800),))
                                                        ),

                                                      ],
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv64'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){

                                                                        _ondalik=int.parse(kazan_yuk_sic.split('')[3]);
                                                                        _birler=int.parse(kazan_yuk_sic.split('')[1]);
                                                                        _onlar=int.parse(kazan_yuk_sic.split('')[0]);
                                                                        _degerNo=1;

                                                                        _degergiris2X1();



                                                                      }, child: Text(kazan_yuk_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv65'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){
                                                                        _ondalik=int.parse(kazan_dus_sic.split('')[3]);
                                                                        _birler=int.parse(kazan_dus_sic.split('')[1]);
                                                                        _onlar=int.parse(kazan_dus_sic.split('')[0]);
                                                                        _degerNo=2;

                                                                        _degergiris2X1();
                                                                      }, child: Text(kazan_dus_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv66'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){
                                                                        _ondalik=int.parse(sek_yuk_sic.split('')[3]);
                                                                        _birler=int.parse(sek_yuk_sic.split('')[1]);
                                                                        _onlar=int.parse(sek_yuk_sic.split('')[0]);
                                                                        _degerNo=3;

                                                                        _degergiris2X1();
                                                                      }, child: Text(sek_yuk_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv67'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){
                                                                        _ondalik=int.parse(sek_dus_sic.split('')[3]);
                                                                        _birler=int.parse(sek_dus_sic.split('')[1]);
                                                                        _onlar=int.parse(sek_dus_sic.split('')[0]);
                                                                        _degerNo=4;

                                                                        _degergiris2X1();
                                                                      }, child: Text(sek_dus_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv68'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){
                                                                        _ondalik=int.parse(sek_yuk_nem.split('')[3]);
                                                                        _birler=int.parse(sek_yuk_nem.split('')[1]);
                                                                        _onlar=int.parse(sek_yuk_nem.split('')[0]);
                                                                        _degerNo=5;

                                                                        _degergiris2X1();
                                                                      }, child: Text(sek_yuk_nem,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv69'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
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
                                                                      onPressed: (){
                                                                        _ondalik=int.parse(sek_dus_nem.split('')[3]);
                                                                        _birler=int.parse(sek_dus_nem.split('')[1]);
                                                                        _onlar=int.parse(sek_dus_nem.split('')[0]);
                                                                        _degerNo=6;

                                                                        _degergiris2X1();
                                                                      }, child: Text(sek_dus_nem,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 23,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(10*oran),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(216, 27, 96, 1.0),
                                                width: 2,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[

                                                    

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv72'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_bru_ari),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){

                                                                      ipt_bru_ari==1 ? ipt_bru_ari=0 : ipt_bru_ari=1;

                                                                      setState(() {});

                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv73'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_pom_ter_atti),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_pom_ter_atti==1 ? ipt_pom_ter_atti=0 : ipt_pom_ter_atti=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv74'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_mek_dus_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_mek_dus_sic==1 ? ipt_mek_dus_sic=0 : ipt_mek_dus_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv75'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_mek_yuk_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_mek_yuk_sic==1 ? ipt_mek_yuk_sic=0 : ipt_mek_yuk_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv76'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_acil_stop),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_acil_stop==1 ? ipt_acil_stop=0 : ipt_acil_stop=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv77'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_faz_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_faz_hata==1 ? ipt_faz_hata=0 : ipt_faz_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv78'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_kaz_yuk_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_kaz_yuk_sic==1 ? ipt_kaz_yuk_sic=0 : ipt_kaz_yuk_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv79'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_kaz_dus_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_kaz_dus_sic==1 ? ipt_kaz_dus_sic=0 : ipt_kaz_dus_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv80'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_sek_yuk_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_sek_yuk_sic==1 ? ipt_sek_yuk_sic=0 : ipt_sek_yuk_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    


                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(10*oran),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(216, 27, 96, 1.0),
                                                width: 2,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv81'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_sek_dus_sic),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_sek_dus_sic==1 ? ipt_sek_dus_sic=0 : ipt_sek_dus_sic=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv82'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_sek_yuk_nem),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_sek_yuk_nem==1 ? ipt_sek_yuk_nem=0 : ipt_sek_yuk_nem=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv83'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_sek_dus_nem),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_sek_dus_nem==1 ? ipt_sek_dus_nem=0 : ipt_sek_dus_nem=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv84'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_kuz_sen_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_kuz_sen_hata==1 ? ipt_kuz_sen_hata=0 : ipt_kuz_sen_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv85'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_orta_sen_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_orta_sen_hata==1 ? ipt_orta_sen_hata=0 : ipt_orta_sen_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv86'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_guney_sen_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_guney_sen_hata==1 ? ipt_guney_sen_hata=0 : ipt_guney_sen_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv87'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_kaz_sen_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_kaz_sen_hata==1 ? ipt_kaz_sen_hata=0 : ipt_kaz_sen_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    
                                                    Expanded(
                                                      child: Row(
                                                        children: <Widget>[

                                                          Expanded(flex: 2,
                                                              child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: 10*oran),
                                                                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv88'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 14,fontWeight: FontWeight.bold),))
                                                          ),

                                                          Expanded(flex:1,
                                                              child: Container(
                                                                  decoration: _iptalEnabledButton(ipt_donus_su_sen_hata),
                                                                  //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                                  child: RawMaterialButton(
                                                                    constraints: BoxConstraints(),
                                                                    padding: EdgeInsets.only(left: 15*oran,right: 15*oran,top: 5*oran,bottom: 5*oran),
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      onPressed: (){
                                                                        ipt_donus_su_sen_hata==1 ? ipt_donus_su_sen_hata=0 : ipt_donus_su_sen_hata=1;

                                                                      setState(() {});
                                                                      }, child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn19'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.white),))
                                                              )
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                    


                                                  ],
                                                ),
                                              ),

                                            ],
                                          ))









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


  _kazanAktifPasifEnabledButton(String aktifMi, int aktif_Kazan,int kazNo){

    var decoration;

    if(aktifMi=="1" && aktif_Kazan==kazNo){
      decoration=const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0F8714),
                //Color(0xFF1976D2),
                Color(0xFF69F51E),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }else if(aktifMi=="1" && aktif_Kazan!=kazNo){
      decoration=const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF1B2178),
                //Color(0xFF1976D2),
                Color(0xFF414471),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }else{
      decoration=const BoxDecoration(
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

  _sektorAktifPasifEnabledButton(String aktifMi, int aktif_Sektor,sekNo){

    var decoration;

    if(aktifMi=="1" && aktif_Sektor==sekNo){
      decoration=const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0F8714),
                //Color(0xFF1976D2),
                Color(0xFF69F51E),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }else if(aktifMi=="1" && aktif_Sektor!=sekNo){
      decoration=const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF213E51),
                //Color(0xFF1976D2),
                Color(0xFF3C6D8C),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          borderRadius:
          BorderRadius.all(Radius.circular(10.0)));
    }else{
      decoration=const BoxDecoration(
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

_iptalEnabledButton(int deger){

    var decoration;

    if(deger==1){
      decoration=const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0F8714),
                //Color(0xFF1976D2),
                Color(0xFF69F51E),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0)));
    }else{
      decoration=const BoxDecoration(
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



  Future _degergiris2X1() async {

    // flutter defined function

    await showDialog(
      barrierDismissible: false,

      context: context,

      builder: (BuildContext context) {

        // return object of type Dialog

        return DegerGiris2X1.Deger(_onlar,_birler,_ondalik,_degerNo);

      },

    ).then((val){
      _onlar=val[0];
      _birler=val[1];
      _ondalik=val[2];
      _degerNo=val[3];

      if(_degerNo==1)
        kazan_yuk_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==2)
        kazan_dus_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==3)
        sek_yuk_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==4)
        sek_dus_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==5)
        sek_yuk_nem=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==6)
        sek_dus_nem=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
    

      setState(() {

      });
    });

  }



}
