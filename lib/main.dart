import 'dart:async';
import 'dart:math';
import 'package:enorpa_smart/kontrol/ayarlar.dart';
import 'package:enorpa_smart/kontrol/kontrol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'genel/database_helper.dart';
import 'genel_ayarlar.dart';
import 'languages/select.dart';


void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ENORPA SMART",
    home: AnaSayfa(),
    routes: <String, WidgetBuilder> {
    '/kontrol': (BuildContext context) => new Kontrol(),
    '/genelAyarlar': (BuildContext context) => new GenelAyarlar(),
    '/ayarlar': (BuildContext context) => new Ayarlar(),
  },
  ));
}

class AnaSayfa extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnaSayfaYapi();
  }
}


class AnaSayfaYapi extends State<AnaSayfa> with TickerProviderStateMixin{

  final dbHelper = DatabaseHelper.instance;

  var satirlar;
  int satSay = 0;
  int sayacX = 0;
  String dilSecimi="TR";

  //region counter ile döndürme miktarı

/*

  int repeatNumber = 0;

  AnimationController _controller1;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed && repeatNumber < 1) {
        repeatNumber++;
        _controller1.reset();
        _controller1.forward();
      }
    });

    _controller1.forward();
  }

*/

//endregion


  AnimationController _controller1;
  int sayac=0;

  @override
  Future initState() {

    super.initState();

    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(
          context,
          '/genelAyarlar'),
        );


    _controller1=AnimationController(vsync:this,duration: Duration(milliseconds: 2000));

    Duration _periot = new Duration(seconds: 2,milliseconds: 0);

    _controller1.animateBack(1.0,duration: _periot,curve: Curves.easeInOut);


  }




  @override
  Widget build(BuildContext context) {

    satirlar = dbHelper.satirlariCek();
    final satirSayisi = dbHelper.satirSayisi();
    satirSayisi.then((int satirSayisi) => satSay = satirSayisi);
    satirSayisi.whenComplete(() {
      if (sayacX == 0) {
        satirlar.then((List<Map> satir) => _satirlar(satir));
        sayacX++;
      }
    });

/*
    var width = MediaQuery.of(context).size.width* MediaQuery.of(context).devicePixelRatio;
    var height = MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio;
    var carpim=width*height;
    var oran=carpim/2073600.0;
*/

    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    var oran = sqrt(carpim/300441.0);


    SystemChrome.setEnabledSystemUIOverlays([]);
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);



    // TODO: implement build
    _landscapeModeOnly();


    return Scaffold(
        body: Container(
      color: Color.fromRGBO(218, 99, 56, 1.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF696969), const Color(0xFF353536)],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
        ),
        margin: EdgeInsets.all(5*oran),
        child: Column(

          children: <Widget>[

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[

                  RotationTransition(turns: _controller1,

                    child: RotationTransition(turns: _controller1,

                      child: Image.asset("assets/images/giris_rotate_icon.png",scale: 1.8/oran,),

                    ),

                  ),

                  Image.asset("assets/images/giris_sabit_icon.png",scale: 1.8/oran,),


                ],
              )
            ),
            Center(
              child: Text(SelectLanguage().selectStrings(dilSecimi, 'slogan'),style: TextStyle(color:Colors.white,fontFamily: 'Kelly Slab',fontSize: 20*oran,fontWeight: FontWeight.bold,),),
              heightFactor: 3.0,
            ),
            
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
        alignment: Alignment.center,
      ),
      alignment: Alignment.center,

    ),

    );


  }


  _satirlar(List<Map> satirlar) {
    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }
    print(satirlar);
    setState(() {});
  }


}


void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}




