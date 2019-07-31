import 'package:enorpa_smart/enorpa/com/products.dart';
import 'package:enorpa_smart/enorpa/com/social_media.dart';
import 'package:enorpa_smart/enorpa/com/webpage.dart';
import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/ayarlar.dart';
import 'package:enorpa_smart/kontrol/baslangic_baglanti_ayarlari.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DenemeState();
  }
}

class DenemeState extends State<Deneme> {
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
          child: Column(
            children: <Widget>[
              Text(
                "KEŞFET  &  KONTROL ET",
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
                                            "REFERANSLAR",
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
                                          "HABERLER",
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
                                            "SOSYAL MEDYA",
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
                                          "İLETİŞİM",
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
                      child: Container(
                        //color: Colors.orange,

                        child: Column(
                          children: <Widget>[
                            //Image.asset("assets/images/giris_sabit_icon.png",scale: 1,),
                            Text(
                              "KONTROL",
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
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
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

    //endregion
  }

_satirlar(List<Map> satirlar) {
    if (satSay > 0) {
      kurulumDurum = satirlar[0]["veri1"];
    }
    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

    
  }

  _kontrolClick(BuildContext context) {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => kurulumDurum=="ok" ? Ayarlar() : BaslangicBaglantiAyarlari()));

      print("kurulum durum: $kurulumDurum");

  }


}
