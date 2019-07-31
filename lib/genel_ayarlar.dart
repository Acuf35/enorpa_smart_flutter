import 'dart:io';

import 'package:enorpa_smart/enorpa/com/products.dart';
import 'package:enorpa_smart/enorpa/com/social_media.dart';
import 'package:enorpa_smart/enorpa/com/webpage.dart';
import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/ayarlar.dart';
import 'package:enorpa_smart/kontrol/baslangic_baglanti_ayarlari.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GenelAyarlar extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return GenelAyarlarState();
  }
}

class GenelAyarlarState extends State<GenelAyarlar> {

  final dbHelper = DatabaseHelper.instance;

  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi = "TR";
  String kurulumDurum="0";

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
    var oran = carpim / 2073600.0;

    //region SCAFFOLD

    // TODO: implement build
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
                SelectLanguage().selectStrings(dilSecimi, "tv110"),
                style: TextStyle(
                  color: Colors.grey.shade100,
                  fontFamily: 'Audio wide',
                  fontSize: 20 * oran,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //color: Colors.blue,
                        margin: EdgeInsets.only(top: 20*oran),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          SelectLanguage().selectStrings(dilSecimi, "tv105"),
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
                                                          Products()));
                                            },
                                            child: Image.asset(
                                              'assets/images/products_icon.png',
                                              scale: 7/oran,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            SelectLanguage().selectStrings(dilSecimi, "tv106"),
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
                                                            Webpage(
                                                                "http://www.enorpa.com/tr/referanslar")));
                                              },
                                              child: Image.asset(
                                                'assets/images/reference_icon.png',
                                                scale: 7/oran,
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          SelectLanguage().selectStrings(dilSecimi, "tv107"),
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
                                                          Webpage(
                                                              "http://www.enorpa.com/tr/haberler")));
                                            },
                                            child: Image.asset(
                                              'assets/images/news_icon.png',
                                              scale: 7/oran,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            SelectLanguage().selectStrings(dilSecimi, "tv108"),
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
                                                            SocialMedia()));
                                              },
                                              child: Image.asset(
                                                'assets/images/social_icon.png',
                                                scale: 7/oran,
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          SelectLanguage().selectStrings(dilSecimi, "tv109"),
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
                                                          Webpage(
                                                              "http://www.enorpa.com/tr/iletisim")));
                                            },
                                            child: Image.asset(
                                              'assets/images/contact_icon.png',
                                              scale: 7/oran,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        alignment: Alignment.center,
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      flex: 2,

                      child: Stack(
                        children: <Widget>[

                          Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(5*oran),
                                          margin: EdgeInsets.only(right: 5*oran,top: 5*oran,bottom: 2*oran),
                                          color: dilSecimi=="TR" ? Colors.deepOrange : Colors.transparent,
                                          //padding: EdgeInsets.only(left: 20,right: 20),
                                          child: Container(
                                            padding: EdgeInsets.all(3*oran),
                                            color: dilSecimi=="TR" ? Colors.white : Colors.transparent,
                                            child: RawMaterialButton(
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              constraints: BoxConstraints(),
                                              padding: EdgeInsets.all(0), // optional, in order to add additional space around text if needed
                                              child: Text('TR',style: TextStyle(fontSize: 20*oran,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),
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
                                          margin: EdgeInsets.only(top: 5*oran,bottom: 2*oran,right: 60*oran),
                                          color: dilSecimi=="EN" ? Colors.deepOrange : Colors.transparent,
                                          //padding: EdgeInsets.only(left: 20,right: 20),
                                          child: Container(
                                            padding: EdgeInsets.all(3*oran),
                                            color: dilSecimi=="EN" ? Colors.white : Colors.transparent,
                                            child: RawMaterialButton(
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              constraints: BoxConstraints(),
                                              padding: EdgeInsets.all(0), // optional, in order to add additional space around text if needed
                                              child: Text('EN',style: TextStyle(fontSize: 20*oran,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),
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





                          Container(
                        //color: Colors.orange,

                        child: Column(
                          children: <Widget>[
                            //Image.asset("assets/images/giris_sabit_icon.png",scale: 1,),
                            Text(
                              SelectLanguage().selectStrings(dilSecimi, "btn17"),
                              textScaleFactor: oran,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Audio wide',
                                  color: Color.fromRGBO(218, 99, 56, 1.0),
                                  fontSize: 24),
                            ),
                            FlatButton(
                                onPressed: () {_kontrolClick(context);},
                                child: Image.asset(
                                  'assets/images/control_icon.png',
                                  scale: 3/oran,
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        alignment: Alignment.center,
                      ),
                      



                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
          




            
          ],),
          
          
          
          
          
          
          margin: EdgeInsets.all(5*oran),
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5*oran),
        )
        
        
        
        
     
      ),

floatingActionButton: Container(
        width: 50*oran,
        height: 50*oran,
        margin: EdgeInsets.only(right: 10*oran,bottom: 10*oran),
        child: FloatingActionButton(
          onPressed: (){
            _cikisAlert(dilSecimi);
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size: 40*oran,color: Colors.black,),
        ),
      ),




    );

    //endregion
  }

_satirlar(List<Map> satirlar) {
    if (satSay > 0) {
      kurulumDurum = satirlar[0]["veri1"];
    }
    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

setState(() {});
    
  }

  _kontrolClick(BuildContext context) {

    kurulumDurum == "ok" ? Navigator.pushNamed(context, '/ayarlar') :  

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BaslangicBaglantiAyarlari()));

      print("kurulum durum: $kurulumDurum");

  }

  _languageClick(BuildContext context) {

    dbHelper.veriYOKSAekleVARSAguncelle(
        13, dilSecimi, "0", "0", "0");

  }

  
  Future _cikisAlert(String x) async {

    // flutter defined function

    await showDialog(
      barrierDismissible: false,

      context: context,

      builder: (BuildContext context) {

        // return object of type Dialog



        return CikisAlert.deger(x);

      },

    );

  }




}









class CikisAlert extends StatefulWidget {

  String dilSecimi="TR";

  CikisAlert.deger(String x){
    print(x);
    dilSecimi=x;

  }


  @override
  _CikisAlertState createState() => new _CikisAlertState.deger(dilSecimi);
}



class _CikisAlertState extends State<CikisAlert> {

  String dilSecimi="TR";

  _CikisAlertState.deger(String x){

    dilSecimi=x;

  }

  

  @override
  Widget build(BuildContext context) {

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



    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),

      backgroundColor: Colors.deepOrange.shade800,

      title: Container(
        padding: EdgeInsets.all(10*oran),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

               Text(SelectLanguage().selectStrings(dilSecimi, 'tv111'),style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)


              ],
            ),


            Container(
              padding: EdgeInsets.only(top: 40*oran),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(right: 20*oran),
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){

                    exit(0);

                  },
                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn42'),
                  textScaleFactor: oran,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Audio wide'),),
                ),

              ),


              Container(
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(SelectLanguage().selectStrings(dilSecimi, 'btn43'),
                  textScaleFactor: oran,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Audio wide'),),
                ),
              ),

            ],
          ),
        ),



          ],
        ),
      ),
    );
  }
}

