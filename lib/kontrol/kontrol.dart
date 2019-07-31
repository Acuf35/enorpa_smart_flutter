import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel/deger_giris_3x0.dart';
import 'package:enorpa_smart/genel/deger_giris_2x1.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class Kontrol extends StatefulWidget {
  static const String routeName = '/kontrol';
  @override
  State<StatefulWidget> createState() {
    return KontrolState();
  }
}

class KontrolState extends State<Kontrol> {

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

  int _onlar=2;
  int _birler=1;
  int _ondalik=5;
  int _yuzler=0;
  int _degerNo=0;

  String k1_set_sic="21.5";
  String k1_dog_bol="03.0";
  String k1_max_yuz="70";
  String k2_set_sic="21.5";
  String k2_dog_bol="03.0";
  String k2_max_yuz="70";
  String s1_set_sic="21.5";
  String s1_dog_bol="03.0";
  String s2_set_sic="21.5";
  String s2_dog_bol="03.0";
  String s3_set_sic="21.5";
  String s3_dog_bol="03.0";
  String s4_set_sic="21.5";
  String s4_dog_bol="03.0";



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

    var oran;

    try {
      var width = MediaQuery
          .of(context)
          .size
          .width *
          MediaQuery
              .of(context)
              .devicePixelRatio;
      var height = MediaQuery
          .of(context)
          .size
          .height *
          MediaQuery
              .of(context)
              .devicePixelRatio;
      var carpim = width * height;
      oran = carpim / 2073600.0;

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
                          SelectLanguage().selectStrings(dilSecimi, 'tv15'),
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
                  EdgeInsets.only(top: 0, bottom: 0, left: 80*oran, right: 80*oran),
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
                                margin: EdgeInsets.only(right: k2_aktif=="1" ? 20*oran : 180*oran,left: k2_aktif=="1" ? 0 : 180*oran),
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      flex:3,

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
                                                    padding: EdgeInsets.only(left: 20*oran,top: 20*oran),
                                                  )

                                                ],

                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(SelectLanguage().selectStrings(dilSecimi, "tv21"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,),
                                                Padding(padding: EdgeInsets.only(left: 20*oran),
                                                    child: Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),)),
                                                Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),





                                    ),

                                    Expanded(
                                      flex: 2,



                                      child: Column(
                                        children: <Widget>[

                                          Expanded(
                                            child: Row(
                                              children: <Widget>[

                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(flex:3,
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
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){

                                                            _ondalik=int.parse(k1_set_sic.split('')[3]);
                                                            _birler=int.parse(k1_set_sic.split('')[1]);
                                                            _onlar=int.parse(k1_set_sic.split('')[0]);
                                                            _degerNo=1;

                                                            _degergiris2X1();

                                                          }, child: Text(k1_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(flex:3,
                                                    child: Container(
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF213E51),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF3C6D8C),
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
                                                            onPressed: (){
                                                              _ondalik=int.parse(k1_dog_bol.split('')[3]);
                                                              _birler=int.parse(k1_dog_bol.split('')[1]);
                                                              _onlar=int.parse(k1_dog_bol.split('')[0]);
                                                              _degerNo=2;

                                                              _degergiris2X1();

                                                            }, child: Text(k1_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv20"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(flex:3,
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
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){

                                                              if(k1_max_yuz.length==2){
                                                                _birler=int.parse(k1_max_yuz.split('')[1]);
                                                                _onlar=int.parse(k1_max_yuz.split('')[0]);
                                                                _yuzler=0;
                                                              }
                                                              if(k1_max_yuz.length==3){
                                                                _birler=int.parse(k1_max_yuz.split('')[2]);
                                                                _onlar=int.parse(k1_max_yuz.split('')[1]);
                                                                _yuzler=int.parse(k1_max_yuz.split('')[0]);
                                                              }
                                                              _degerNo=13;

                                                              _degergiris3X0();

                                                            }, child: Text(k1_max_yuz,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )

                                              ],
                                            ),
                                          )



                                        ],
                                      )




                                    )

                                  ],
                                ),
                              ),
                            ),

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
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20*oran),
                                  child: Row(
                                    children: <Widget>[

                                      Expanded(
                                        flex:3,

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
                                                      padding: EdgeInsets.only(left: 20*oran,top: 20*oran),
                                                    )

                                                  ],

                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(SelectLanguage().selectStrings(dilSecimi, "tv21"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,),
                                                  Padding(padding: EdgeInsets.only(left: 20*oran),
                                                      child: Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),)),
                                                  Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                            )

                                          ],
                                        ),





                                      ),

                                      Expanded(
                                          flex: 2,



                                          child: Column(
                                            children: <Widget>[

                                              Expanded(
                                                child: Row(
                                                  children: <Widget>[

                                                    Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center)),
                                                    Expanded(flex:3,
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
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){
                                                                  _ondalik=int.parse(k2_set_sic.split('')[3]);
                                                                  _birler=int.parse(k2_set_sic.split('')[1]);
                                                                  _onlar=int.parse(k2_set_sic.split('')[0]);
                                                                  _degerNo=3;

                                                                  _degergiris2X1();

                                                                }, child: Text(k2_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                    Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textAlign: TextAlign.center,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),)),
                                                    Expanded(flex:3,
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    colors: <Color>[
                                                                      Color(0xFF213E51),
                                                                      //Color(0xFF1976D2),
                                                                      Color(0xFF3C6D8C),
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
                                                                onPressed: (){
                                                                  _ondalik=int.parse(k2_dog_bol.split('')[3]);
                                                                  _birler=int.parse(k2_dog_bol.split('')[1]);
                                                                  _onlar=int.parse(k2_dog_bol.split('')[0]);
                                                                  _degerNo=4;

                                                                  _degergiris2X1();

                                                                }, child: Text(k2_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                    Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv20"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                    Expanded(flex:3,
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
                                                                padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                                onPressed: (){
                                                                  if(k2_max_yuz.length==2){
                                                                    _birler=int.parse(k2_max_yuz.split('')[1]);
                                                                    _onlar=int.parse(k2_max_yuz.split('')[0]);
                                                                  }
                                                                  if(k2_max_yuz.length==3){
                                                                    _birler=int.parse(k2_max_yuz.split('')[2]);
                                                                    _onlar=int.parse(k2_max_yuz.split('')[1]);
                                                                    _yuzler=int.parse(k2_max_yuz.split('')[0]);
                                                                  }

                                                                  _degerNo=14;

                                                                  _degergiris3X0();

                                                                }, child: Text(k2_max_yuz,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white),))
                                                        )
                                                    )

                                                  ],
                                                ),
                                              )



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
                          padding: EdgeInsets.only(left: sektorSayisi==4 ? 0 : (sektorSayisi==3 ? 120*oran : (sektorSayisi==2 ? 200*oran : (sektorSayisi==1 ? 280*oran : 280*oran))) ,
                              right: sektorSayisi==4 ? 0 : (sektorSayisi==3 ? 120*oran : (sektorSayisi==2 ? 200*oran : (sektorSayisi==1 ? 280*oran : 280*oran)))),
                          child: Row(
                            children: <Widget>[


                              Expanded(
                                  child: Column(
                                    children: <Widget>[

                                      Text(SelectLanguage().selectStrings(dilSecimi, "tv23"),textScaleFactor: oran,style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontFamily: 'Audio wide'),),

                                      Expanded(
                                        child: Row(
                                          children: <Widget>[



                                            Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                            Expanded(flex:3,
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
                                                        padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                        onPressed: (){

                                                          _ondalik=int.parse(s1_set_sic.split('')[3]);
                                                          _birler=int.parse(s1_set_sic.split('')[1]);
                                                          _onlar=int.parse(s1_set_sic.split('')[0]);
                                                          _degerNo=5;

                                                          _degergiris2X1();

                                                          }, child: Text(s1_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                            Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                            Expanded(flex:3,
                                                child: Container(
                                                    decoration: const BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: <Color>[
                                                              Color(0xFF213E51),
                                                              //Color(0xFF1976D2),
                                                              Color(0xFF3C6D8C),
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
                                                        onPressed: (){
                                                          _ondalik=int.parse(s1_dog_bol.split('')[3]);
                                                          _birler=int.parse(s1_dog_bol.split('')[1]);
                                                          _onlar=int.parse(s1_dog_bol.split('')[0]);
                                                          _degerNo=6;

                                                          _degergiris2X1();

                                                        }, child: Text(s1_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                            Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv22"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),),
                                                  Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                      )



                                    ],
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



                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(flex:3,
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
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){
                                                            _ondalik=int.parse(s2_set_sic.split('')[3]);
                                                            _birler=int.parse(s2_set_sic.split('')[1]);
                                                            _onlar=int.parse(s2_set_sic.split('')[0]);
                                                            _degerNo=7;

                                                            _degergiris2X1();
                                                          }, child: Text(s2_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF213E51),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF3C6D8C),
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
                                                          onPressed: (){
                                                            _ondalik=int.parse(s2_dog_bol.split('')[3]);
                                                            _birler=int.parse(s2_dog_bol.split('')[1]);
                                                            _onlar=int.parse(s2_dog_bol.split('')[0]);
                                                            _degerNo=8;

                                                            _degergiris2X1();

                                                          }, child: Text(s2_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv22"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(
                                                flex: 3,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),),
                                                    Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        )



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



                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(flex:3,
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
                                                          padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                          onPressed: (){
                                                            _ondalik=int.parse(s3_set_sic.split('')[3]);
                                                            _birler=int.parse(s3_set_sic.split('')[1]);
                                                            _onlar=int.parse(s3_set_sic.split('')[0]);
                                                            _degerNo=9;

                                                            _degergiris2X1();
                                                          }, child: Text(s3_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(flex:3,
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: <Color>[
                                                                Color(0xFF213E51),
                                                                //Color(0xFF1976D2),
                                                                Color(0xFF3C6D8C),
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
                                                          onPressed: (){
                                                            _ondalik=int.parse(s3_dog_bol.split('')[3]);
                                                            _birler=int.parse(s3_dog_bol.split('')[1]);
                                                            _onlar=int.parse(s3_dog_bol.split('')[0]);
                                                            _degerNo=10;

                                                            _degergiris2X1();
                                                          }, child: Text(s3_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                              Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv22"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                              Expanded(
                                                flex: 3,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),),
                                                    Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        )



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



                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv18"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(flex:3,
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
                                                            padding: EdgeInsets.only(top: 7*oran,bottom: 7*oran),
                                                            onPressed: (){
                                                              _ondalik=int.parse(s4_set_sic.split('')[3]);
                                                              _birler=int.parse(s4_set_sic.split('')[1]);
                                                              _onlar=int.parse(s4_set_sic.split('')[0]);
                                                              _degerNo=11;

                                                              _degergiris2X1();
                                                            }, child: Text(s4_set_sic,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv19"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(flex:3,
                                                    child: Container(
                                                        decoration: const BoxDecoration(
                                                            gradient: LinearGradient(
                                                                colors: <Color>[
                                                                  Color(0xFF213E51),
                                                                  //Color(0xFF1976D2),
                                                                  Color(0xFF3C6D8C),
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
                                                            onPressed: (){
                                                              _ondalik=int.parse(s4_dog_bol.split('')[3]);
                                                              _birler=int.parse(s4_dog_bol.split('')[1]);
                                                              _onlar=int.parse(s4_dog_bol.split('')[0]);
                                                              _degerNo=12;

                                                              _degergiris2X1();
                                                            }, child: Text(s4_dog_bol,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab',fontSize: 24,
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

                                                Expanded(flex:2,child: Text(SelectLanguage().selectStrings(dilSecimi, "tv22"),textScaleFactor: oran,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),textAlign: TextAlign.center,)),
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("80,0",textScaleFactor: oran,style: TextStyle(fontSize: 30,fontFamily:'Kelly Slab',fontWeight: FontWeight.bold,color: Colors.white, ),),
                                                      Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 20),),
                                                    ],
                                                  ),
                                                )

                                              ],
                                            ),
                                          )



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
        k1_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==2)
        k1_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==3)
        k2_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==4)
        k2_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==5)
        s1_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==6)
        s1_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==7)
        s2_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==8)
        s2_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==9)
        s3_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==10)
        s3_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==11)
        s4_set_sic=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==12)
        s4_dog_bol=_onlar.toString()+_birler.toString()+"."+_ondalik.toString();

      setState(() {

      });
    });

  }


  Future _degergiris3X0() async {

    // flutter defined function

    await showDialog(
      barrierDismissible: false,

      context: context,

      builder: (BuildContext context) {

        // return object of type Dialog



        return DegerGiris3X0.Deger(_yuzler,_onlar,_birler,_degerNo);

      },

    ).then((val){
      _yuzler=val[0];
      _onlar=val[1];
      _birler=val[2];
      _degerNo=val[3];

      if(_degerNo==13)
        k1_max_yuz=(_yuzler==0 ? '' : _yuzler.toString()) +_onlar.toString()+_birler.toString();
      if(_degerNo==14)
        k2_max_yuz=(_yuzler==0 ? '' : _yuzler.toString()) +_onlar.toString()+_birler.toString();
      

      setState(() {

      });
    });

  }




}





