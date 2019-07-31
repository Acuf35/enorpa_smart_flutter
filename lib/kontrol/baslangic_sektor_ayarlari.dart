import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/baslangic_baglanti_ayarlari.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'ayarlar.dart';

class BaslangicSektorAyarlari extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaslangicSektorAyarlariState();
  }
}

class BaslangicSektorAyarlariState extends State<BaslangicSektorAyarlari> {


  final dbHelper = DatabaseHelper.instance;
  String kazan_1_aktif="0";
  String kazan_1_pompa="0";
  String kazan_1_sont="0";
  String kazan_1_3yv="0";
  String kazan_2_aktif="0";
  String kazan_2_pompa="0";
  String kazan_2_sont="0";
  String kazan_2_3yv="0";
  String sektor_1_k1="0";
  String sektor_1_k2="0";
  String sektor_1_3yv="0";
  String sektor_1_p="0";
  String sektor_2_k1="0";
  String sektor_2_k2="0";
  String sektor_2_3yv="0";
  String sektor_2_p="0";
  String sektor_3_k1="0";
  String sektor_3_k2="0";
  String sektor_3_3yv="0";
  String sektor_3_p="0";
  String sektor_4_k1="0";
  String sektor_4_k2="0";
  String sektor_4_3yv="0";
  String sektor_4_p="0";

  String dilSecimi="TR";

  var satirlar;
  int satSay=0;
  int sayac=0;




  @override
  Widget build(BuildContext context) {


    satirlar = dbHelper.satirlariCek();
    final satirSayisi = dbHelper.satirSayisi();
    satirSayisi.then((int satirSayisi) => satSay=satirSayisi);
    satirSayisi.whenComplete((){

      if(sayac==0) {
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
                      child: Text(
            SelectLanguage().selectStrings(dilSecimi, "tv7"),
            textScaleFactor: oran,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'Audio wide',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 80*oran,top: 5*oran,bottom: 5*oran),

                      child: RaisedButton(
                        padding: EdgeInsets.only(right: 20*oran,left: 20*oran,top: 5*oran,bottom: 5*oran),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {_tamamlaClick();},
                        color: Colors.indigo.shade700,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                        child: Text(
                          SelectLanguage().selectStrings(dilSecimi, "btn3"),
                          textScaleFactor: oran,
                          style: TextStyle(
                              fontFamily: 'Audio wide',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )


                  ],
                ),




                Container(
                  margin:
                      EdgeInsets.only(top: 4*oran, bottom: 0, left: 80*oran, right: 80*oran),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(216, 27, 96, 1.0),
                  height: 2,
                ),


                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 5*oran),
                                  alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[

                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            //alignment: AlignmentDirectional.center,
                                            children: <Widget>[
                                              Center(
                                                child: Image.asset(
                                                  'assets/images/kazan_icon.png',
                                                  scale: 3/oran,
                                                ),
                                              ),
                                              
                                              Container(
                                                  child: Text("1",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                padding: EdgeInsets.only(left: 20*oran,top: 20*oran),
                                              )
                                              
                                            ],

                                          ),
                                        ),

                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                            children: <Widget>[


                                              FlatButton(
                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  onPressed: () {
                                                  if(kazan_1_aktif=="0")
                                                    kazan_1_aktif="1";
                                                  else {
                                                    kazan_1_aktif = "0";
                                                    sektor_1_k1="0";
                                                    sektor_2_k1="0";
                                                    sektor_3_k1="0";
                                                    sektor_4_k1="0";
                                                  }

                                                  setState(() {});
                                                  },
                                                  color: kazan_1_aktif=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                  child: Text(
                                                    SelectLanguage().selectStrings(dilSecimi, "btn4"),
                                                    textScaleFactor: oran,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  ),

                                              ),

                                              FlatButton(
                                                  padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  onPressed: () {
                                                    if(kazan_1_pompa=="0")
                                                      kazan_1_pompa="1";
                                                    else
                                                      kazan_1_pompa="0";

                                                    setState(() {});
                                                  },
                                                  color: kazan_1_pompa=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                  child: Text(
                                                    SelectLanguage().selectStrings(dilSecimi, "btn5"),
                                                    textScaleFactor: oran,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  )),

                                              FlatButton(
                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  onPressed: () {
                                                    if(kazan_1_sont=="0")
                                                      kazan_1_sont="1";
                                                    else
                                                      kazan_1_sont="0";

                                                    setState(() {});
                                                  },
                                                  color: kazan_1_sont=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                  child: Text(
                                                    SelectLanguage().selectStrings(dilSecimi, "btn6"),
                                                    textScaleFactor: oran,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  )),

                                              FlatButton(
                                                  padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  onPressed: () {
                                                    if(kazan_1_3yv=="0")
                                                      kazan_1_3yv="1";
                                                    else
                                                      kazan_1_3yv="0";

                                                    setState(() {});
                                                  },
                                                  color: kazan_1_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                  child: Text(
                                                    SelectLanguage().selectStrings(dilSecimi, "btn7"),
                                                    textScaleFactor: oran,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                  )),


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
                              color: Color.fromRGBO(
                                  216, 27, 96, 1.0),
                              width: 2,
                            ),

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 5*oran),
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      flex: 3,
                                      child: Stack(
                                        //alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          Center(
                                            child: Image.asset(
                                              'assets/images/kazan_icon.png',
                                              scale: 3/oran,
                                            ),
                                          ),

                                          Container(
                                            child: Text("2",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                            padding: EdgeInsets.only(left: 20*oran,top: 20*oran),
                                          )

                                        ],

                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                        children: <Widget>[


                                          FlatButton(
                                            padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onPressed: () {
                                              if(kazan_2_aktif=="0")
                                                kazan_2_aktif="1";
                                              else{
                                                kazan_2_aktif="0";
                                                sektor_1_k2="0";
                                                sektor_2_k2="0";
                                                sektor_3_k2="0";
                                                sektor_4_k2="0";
                                              }

                                              setState(() {});
                                            },
                                            color: kazan_2_aktif=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                            child: Text(
                                              SelectLanguage().selectStrings(dilSecimi, "btn4"),
                                              textScaleFactor: oran,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                          ),

                                          FlatButton(
                                              padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              onPressed: () {
                                                if(kazan_2_pompa=="0")
                                                  kazan_2_pompa="1";
                                                else
                                                  kazan_2_pompa="0";

                                                setState(() {});
                                              },
                                              color: kazan_2_pompa=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "btn5"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),

                                          FlatButton(
                                              padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              onPressed: () {
                                                if(kazan_2_sont=="0")
                                                  kazan_2_sont="1";
                                                else
                                                  kazan_2_sont="0";

                                                setState(() {});
                                              },
                                              color: kazan_2_sont=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "btn6"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),

                                          FlatButton(
                                              padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              onPressed: () {
                                                if(kazan_2_3yv=="0")
                                                  kazan_2_3yv="1";
                                                else
                                                  kazan_2_3yv="0";

                                                setState(() {});
                                              },
                                              color: kazan_2_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "btn7"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),


                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        alignment: Alignment.center,
                      )),

                      Container(
                        margin: EdgeInsets.only(right: 30*oran, left: 30*oran),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(
                            216, 27, 96, 1.0),
                        height: 2,
                      ),

                      Expanded(
                          child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.center,


                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[

                                                  Expanded(flex: 1,
                                                      child: Text(SelectLanguage().selectStrings(dilSecimi, "tv8"),textScaleFactor: oran,style: TextStyle(fontFamily: "Audio wide",color: Colors.grey.shade700),)),

                                                  Expanded(flex: 3,
                                                    child: Image.asset(
                                                      'assets/images/sektor_icon.png',
                                                      scale: 3/oran,
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_1_aktif=="1") {
                                                                    if (sektor_1_k1 ==
                                                                        "0") {
                                                                      sektor_1_k1 =
                                                                      "1";
                                                                      sektor_1_k2 =
                                                                      "0";
                                                                    }
                                                                    else {
                                                                      sektor_1_k1 =
                                                                      "0";
                                                                    }

                                                                    setState(() {});
                                                                  }else{
                                                                    Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast5"), context,
                                                                        duration: 2);
                                                                  }
                                                                },
                                                                color: sektor_1_k1=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn8"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_2_aktif=="1") {
                                                                    if (sektor_1_k2 ==
                                                                        "0") {
                                                                      sektor_1_k2 =
                                                                      "1";
                                                                      sektor_1_k1 =
                                                                      "0";
                                                                    }
                                                                    else
                                                                      sektor_1_k2 =
                                                                      "0";

                                                                    setState(() {});
                                                                  }else{
                                                                    Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast6"), context,
                                                                        duration: 2);
                                                                  }

                                                                },
                                                                color: sektor_1_k2=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn9"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_1_3yv=="0")
                                                                    sektor_1_3yv="1";
                                                                  else
                                                                    sektor_1_3yv="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_1_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn10"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_1_p=="0")
                                                                    sektor_1_p="1";
                                                                  else
                                                                    sektor_1_p="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_1_p=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn11"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),





                                                ],
                                              )



                                          )
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                                        alignment: Alignment.center,
                                        color: Color.fromRGBO(
                                            216, 27, 96, 1.0),
                                        width: 2,
                                      ),

                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.center,

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[

                                                  Expanded(flex: 1,
                                                      child: Text(SelectLanguage().selectStrings(dilSecimi, "tv9"),textScaleFactor: oran,style: TextStyle(fontFamily: "Audio wide",color: Colors.grey.shade700),)),

                                                  Expanded(flex: 3,
                                                    child: Image.asset(
                                                      'assets/images/sektor_icon.png',
                                                      scale: 3/oran,
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_1_aktif=="1"){
                                                                  if(sektor_2_k1=="0") {
                                                                    sektor_2_k1 = "1";
                                                                    sektor_2_k2 = "0";
                                                                  }
                                                                  else
                                                                    sektor_2_k1="0";

                                                                  setState(() {});
                                                                  }
                                                                  else{
                                                                  Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast5"), context,
                                                                  duration: 2);
                                                                  }
                                                                },
                                                                color: sektor_2_k1=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn8"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_2_aktif=="1") {
                                                                    if (sektor_2_k2 ==
                                                                        "0") {
                                                                      sektor_2_k2 =
                                                                      "1";
                                                                      sektor_2_k1 =
                                                                      "0";
                                                                    }
                                                                    else
                                                                      sektor_2_k2 =
                                                                      "0";

                                                                    setState(() {});
                                                                  }else{
                                                                    Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast6"), context,
                                                                        duration: 2);
                                                                  }

                                                                },
                                                                color: sektor_2_k2=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn9"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_2_3yv=="0")
                                                                    sektor_2_3yv="1";
                                                                  else
                                                                    sektor_2_3yv="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_2_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn10"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_2_p=="0")
                                                                    sektor_2_p="1";
                                                                  else
                                                                    sektor_2_p="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_2_p=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn11"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),





                                                ],
                                              )



                                          )
                                      ),
                                    ],
                                  ),
                                )
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                              alignment: Alignment.center,
                              color: Color.fromRGBO(
                                  216, 27, 96, 1.0),
                              width: 2,
                            ),

                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.center,


                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[

                                                  Expanded(flex: 1,
                                                      child: Text(SelectLanguage().selectStrings(dilSecimi, "tv10"),textScaleFactor: oran,style: TextStyle(fontFamily: "Audio wide",color: Colors.grey.shade700),)),

                                                  Expanded(flex: 3,
                                                    child: Image.asset(
                                                      'assets/images/sektor_icon.png',
                                                      scale: 3/oran,
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_1_aktif=="1") {
                                                                    if (sektor_3_k1 ==
                                                                        "0") {
                                                                      sektor_3_k1 =
                                                                      "1";
                                                                      sektor_3_k2 =
                                                                      "0";
                                                                    }
                                                                    else
                                                                      sektor_3_k1 =
                                                                      "0";

                                                                    setState(() {});
                                                                  }
                                                                    else {
                                                                    Toast.show(
                                                                        SelectLanguage().selectStrings(dilSecimi, "toast5"), context,
                                                                        duration: 2);
                                                                  }
                                                                },
                                                                color: sektor_3_k1=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn8"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_2_aktif=="1") {
                                                                    if (sektor_3_k2 ==
                                                                        "0") {
                                                                      sektor_3_k2 =
                                                                      "1";
                                                                      sektor_3_k1 =
                                                                      "0";
                                                                    }
                                                                    else
                                                                      sektor_3_k2 =
                                                                      "0";

                                                                    setState(() {});
                                                                  }else{
                                                                    Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast6"), context,
                                                                        duration: 2);
                                                                  }

                                                                },
                                                                color: sektor_3_k2=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn9"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_3_3yv=="0")
                                                                    sektor_3_3yv="1";
                                                                  else
                                                                    sektor_3_3yv="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_3_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn10"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_3_p=="0")
                                                                    sektor_3_p="1";
                                                                  else
                                                                    sektor_3_p="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_3_p=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn11"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),





                                                ],
                                              )



                                          )
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                                        alignment: Alignment.center,
                                        color: Color.fromRGBO(
                                            216, 27, 96, 1.0),
                                        width: 2,
                                      ),

                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.center,


                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[

                                                  Expanded(flex: 1,
                                                      child: Text(SelectLanguage().selectStrings(dilSecimi, "tv11"),textScaleFactor: oran,style: TextStyle(fontFamily: "Audio wide",color: Colors.grey.shade700),)),

                                                  Expanded(flex: 3,
                                                    child: Image.asset(
                                                      'assets/images/sektor_icon.png',
                                                      scale: 3/oran,
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_1_aktif=="1") {
                                                                    if (sektor_4_k1 ==
                                                                        "0") {
                                                                      sektor_4_k1 =
                                                                      "1";
                                                                      sektor_4_k2 =
                                                                      "0";
                                                                    }
                                                                    else
                                                                      sektor_4_k1 =
                                                                      "0";

                                                                    setState(() {});
                                                                  }else {
                                                                    Toast.show(
                                                                        SelectLanguage().selectStrings(dilSecimi, "toast5"), context,
                                                                        duration: 2);
                                                                  }
                                                                },
                                                                color: sektor_4_k1=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn8"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(kazan_2_aktif=="1"){
                                                                  if(sektor_4_k2=="0") {
                                                                    sektor_4_k2 = "1";
                                                                    sektor_4_k1 = "0";
                                                                  }
                                                                  else
                                                                    sektor_4_k2="0";

                                                                  setState(() {});
                                                                  }else{
                                                                    Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast6"), context,
                                                                        duration: 2);
                                                                  }

                                                                },
                                                                color: sektor_4_k2=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn9"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Expanded(flex:2,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_4_3yv=="0")
                                                                    sektor_4_3yv="1";
                                                                  else
                                                                    sektor_4_3yv="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_4_3yv=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn10"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            margin:EdgeInsets.only(right: 5*oran,left: 5*oran),
                                                            child: FlatButton(
                                                                padding: EdgeInsets.only(bottom:10*oran,top:10*oran),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                onPressed: () {
                                                                  if(sektor_4_p=="0")
                                                                    sektor_4_p="1";
                                                                  else
                                                                    sektor_4_p="0";

                                                                  setState(() {});
                                                                },
                                                                color: sektor_4_p=="0" ? Colors.grey.shade700 : Colors.green.shade500,
                                                                child: Text(
                                                                  SelectLanguage().selectStrings(dilSecimi, "btn11"),
                                                                  textScaleFactor: oran,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),





                                                ],
                                              )



                                          )
                                      ),
                                    ],
                                  ),

                                )
                            ),
                          ],
                        ),

                        alignment: Alignment.center,
                      )),
                    ],
                  ),
                )),
              ],
            ),
            margin: EdgeInsets.all(5*oran),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5*oran),
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
            //Navigator.pushReplacement(context, 
            //MaterialPageRoute(builder: (context) => BaslangicBaglantiAyarlari()));
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size:50*oran,color: Colors.black,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

    //endregion
  }



  void _insert(int idNo, String v1,String v2, String v3, String v4) {

    final id =  dbHelper.veriYOKSAekleVARSAguncelle(idNo, v1, v2, v3, v4);

    if(id==0)
      print("girilen id zaten var");
    else
      print('girilen id li veri eklendi');

  }
  
  
  


  _satirlar(List<Map> satirlar) {

    if(satSay>6){
      kazan_1_aktif=satirlar[6]["veri1"];
      kazan_1_pompa=satirlar[6]["veri2"];
      kazan_1_sont=satirlar[6]["veri3"];
      kazan_1_3yv=satirlar[6]["veri4"];
    }

    if(satSay>7){
      kazan_2_aktif=satirlar[7]["veri1"];
      kazan_2_pompa=satirlar[7]["veri2"];
      kazan_2_sont=satirlar[7]["veri3"];
      kazan_2_3yv=satirlar[7]["veri4"];
    }

    if(satSay>8){
      sektor_1_k1=satirlar[8]["veri1"];
      sektor_1_k2=satirlar[8]["veri2"];
      sektor_1_3yv=satirlar[8]["veri3"];
      sektor_1_p=satirlar[8]["veri4"];
    }

    if(satSay>9){
      sektor_2_k1=satirlar[9]["veri1"];
      sektor_2_k2=satirlar[9]["veri2"];
      sektor_2_3yv=satirlar[9]["veri3"];
      sektor_2_p=satirlar[9]["veri4"];
    }

    if(satSay>10){
      sektor_3_k1=satirlar[10]["veri1"];
      sektor_3_k2=satirlar[10]["veri2"];
      sektor_3_3yv=satirlar[10]["veri3"];
      sektor_3_p=satirlar[10]["veri4"];
    }

    if(satSay>11){
      sektor_4_k1=satirlar[11]["veri1"];
      sektor_4_k2=satirlar[11]["veri2"];
      sektor_4_3yv=satirlar[11]["veri3"];
      sektor_4_p=satirlar[11]["veri4"];
    }

    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }


    setState(() {});
    print("SATIR SAYISI: $satSay : $satirlar");

  }





  _tamamlaClick() {
    if (kazan_1_aktif == "0" && kazan_2_aktif == "0")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast1"), context,
          duration: 2);
    else if (kazan_1_aktif == "1" && kazan_1_pompa == "0")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast2"), context,
          duration: 2);
    else if (kazan_2_aktif == "1" && kazan_2_pompa == "0")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast3"), context,
          duration: 2);
    else if (sektor_1_k1 == "0" && sektor_1_k2 == "0" &&
        sektor_2_k1 == "0" && sektor_2_k2 == "0" &&
        sektor_3_k1 == "0" && sektor_3_k2 == "0" &&
        sektor_4_k1 == "0" && sektor_4_k2 == "0")
      Toast.show(
          SelectLanguage().selectStrings(dilSecimi, "toast4"),
          context, duration: 2);
    else {
      dbHelper.veriYOKSAekleVARSAguncelle(
          1, "ok", "0", "0", "0");
      dbHelper.veriYOKSAekleVARSAguncelle(
          7, kazan_1_aktif, kazan_1_pompa, kazan_1_sont, kazan_1_3yv);
      dbHelper.veriYOKSAekleVARSAguncelle(
          8, kazan_2_aktif, kazan_2_pompa, kazan_2_sont, kazan_2_3yv);
      dbHelper.veriYOKSAekleVARSAguncelle(
          9, sektor_1_k1, sektor_1_k2, sektor_1_3yv, sektor_1_p);
      dbHelper.veriYOKSAekleVARSAguncelle(
          10, sektor_2_k1, sektor_2_k2, sektor_2_3yv, sektor_2_p);
      dbHelper.veriYOKSAekleVARSAguncelle(
          11, sektor_3_k1, sektor_3_k2, sektor_3_3yv, sektor_3_p);
      dbHelper.veriYOKSAekleVARSAguncelle(
          12, sektor_4_k1, sektor_4_k2, sektor_4_3yv, sektor_4_p);


      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Ayarlar()));
    }
  }
  
}
