import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/baslangic_baglanti_ayarlari.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'package:enorpa_smart/enorpa/com/webpage.dart';




class SocialMedia extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return SocialMediaState();
  }
}

class SocialMediaState extends State<SocialMedia> {

  final dbHelper = DatabaseHelper.instance;

  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi = "TR";
  String kurulumDurum="0";

  @override
  Widget build(BuildContext context) {


    satirlar = dbHelper.satirlariCek();
    final satirSayisi = dbHelper.satirSayisi();
    satirSayisi.then((int satirSayisi) => satSay = satirSayisi);
    satirSayisi.whenComplete(() {
      if (sayac == 0) {
        satirlar.then((List<Map> satir) => _satirlar(satir));
        sayac++;
      }
    });





    var width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    var height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    var carpim = width * height;
    var oran = carpim / 2073600.0;

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
          child: Stack(
            children: <Widget>[


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
                SelectLanguage().selectStrings(dilSecimi, 'tv108'),
                textScaleFactor: oran,
                style: TextStyle(
                    color: Colors.grey.shade100,
                    fontFamily: 'Audio wide',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(

                    children: <Widget>[

                      Expanded(
                        flex: 1,
                        child: Container(

                          alignment: Alignment.center,

                        ),
                      ),

                      Expanded(
                        flex: 4,
                        child: Container(


                          child: Row(
                            children: <Widget>[

                              Expanded(child:

                              Column(
                                children: <Widget>[

                                  Text(
                                    "FACEBOOK",
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
                                                    Webpage("https://www.facebook.com/enorpaenerji")));


                                      },
                                      child: Image.asset(
                                        'assets/images/facebook.png',
                                        scale: 7/oran,
                                      ))

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),

                              ),

                              Expanded(child:

                              Column(
                                children: <Widget>[

                                  Text(
                                    "YOUTUBE",
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
                                                    Webpage("https://www.youtube.com/channel/UCDnCaH0SsRSsrng0-KDLe6A")));


                                      },
                                      child: Image.asset(
                                        'assets/images/youtube.png',
                                        scale: 7/oran,
                                      ))

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),

                              ),

                              Expanded(child:

                              Column(
                                children: <Widget>[

                                  Text(
                                    "TWITTER",
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
                                                    Webpage("https://twitter.com/enorpaenerji")));


                                      },
                                      child: Image.asset(
                                        'assets/images/twitter.png',
                                        scale: 7/oran,
                                      ))

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),

                              ),



                            ],

                          ),
                          alignment: Alignment.center,

                        ),
                      ),

                      Expanded(
                        flex: 4,
                        child: Container(


                          child: Row(
                            children: <Widget>[

                              Column(
                                children: <Widget>[

                                  Text(
                                    "LINKEDIN",
                                    textScaleFactor: oran,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Audio wide',
                                      color: Color.fromRGBO(
                                          218, 99, 56, 1.0),
                                    ),
                                  ),

                                  FlatButton(
                                      onPressed: () {

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Webpage("https://www.linkedin.com/company/enorpa")));


                                      },
                                      child: Image.asset(
                                        'assets/images/linkedin.png',
                                        scale: 7/oran,
                                      ))

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),

                              Column(
                                children: <Widget>[

                                  Text(
                                    "INSTAGRAM",
                                    textScaleFactor: oran,
                                    textAlign: TextAlign.center,
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
                                                    Webpage("https://www.instagram.com/enorpaenerji/")));


                                      },
                                      child: Image.asset(
                                        'assets/images/instagram.png',
                                        scale: 7/oran,
                                      ))

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),

                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          alignment: Alignment.center,

                        ),
                      ),


                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,

                        ),
                      ),


                    ],

                  ),
                ),
              )
            ],
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


}




















