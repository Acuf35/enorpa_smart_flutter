import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel/deger_giris_2x1.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class AlarmOnline extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlarmOnlineState();
  }
}

class AlarmOnlineState extends State<AlarmOnline> {
  final dbHelper = DatabaseHelper.instance;


  var satirlar;
  int satSay = 0;
  int sayac = 0;
  String dilSecimi = "TR";


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
                          SelectLanguage().selectStrings(dilSecimi, 'tv91'),
                          textScaleFactor: oran,style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: 'Audio wide',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Container(
                  margin:
                  EdgeInsets.only(top: 10*oran, bottom: 10*oran, left: 80*oran, right: 80*oran),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(216, 27, 96, 1.0),
                  height: 2,
                ),



                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(left: 20*oran, right: 20*oran,top: 5*oran),
                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv92'),textScaleFactor: oran,),color: Colors.white, alignment: Alignment.center,),
                  ],
                ),




              
              
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
    

    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

    setState(() {});
  }


}
