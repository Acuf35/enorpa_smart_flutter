import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel_ayarlar.dart';
import 'package:enorpa_smart/kontrol/ayarlar.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'baslangic_sektor_ayarlari.dart';

class BaslangicBaglantiAyarlari extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaslangicBaglantiAyarlariState();
  }
}

class BaslangicBaglantiAyarlariState extends State<BaslangicBaglantiAyarlari> {
  final dbHelper = DatabaseHelper.instance;
  String seraAdi = "";
  String yerelIP_1 = "";
  String yerelIP_2 = "";
  String yerelIP_3 = "";
  String yerelIP_4 = "";
  String wifiAdi = "";
  String uzakIP_1 = "";
  String uzakIP_2 = "";
  String uzakIP_3 = "";
  String uzakIP_4 = "";
  String plcIP_1 = "";
  String plcIP_2 = "";
  String plcIP_3 = "";
  String plcIP_4 = "";
  int sayac = 0;
  int click_sayac = 0;
  bool cbox1_value = true;
  bool cbox2_value = false;
  var satirlar;
  int satSay = 0;
  String dilSecimi="TR";
  String kurulumDurum="0";



  @override
  Widget build(BuildContext context) {
/*
    final val1 = dbHelper.veriCek(1,3);
    val1.then((String message) => seraAdi=message);
    val1.whenComplete(() {
      if(sayac==0) {
        setState(() {});
        sayac++;
      }

    });
    print(seraAdi);



    _insert(2, "Sera A", "", "", "");
    _insert(3, "192", "168", "2", "1");
    _insert(4, "enorpasmartAP", "", "", "");
    _insert(5, "188", "59", "21", "122");
    _insert(6, "192", "168", "2", "121");
    */

/*

    final yy = dbHelper.satirCek(9);
    final xx = dbHelper.satirCek(1);
    //xx.then((List<Map> satir) => seraAdi=satir[0]["veri3"]);
    yy.then((List<Map> satir) => plcIP=satir[0]["veri1"]);
    xx.then((List<Map> satir) => satirGetir(satir[0]["veri1"], satir[0]["veri2"], satir[0]["veri3"], satir[0]["veri4"]));
    xx.whenComplete(() {
      if(sayac==0) {
        setState(() {});
        sayac++;
      }

    });
    print(seraAdi);
*/

    satirlar = dbHelper.satirlariCek();
    final satirSayisi = dbHelper.satirSayisi();
    satirSayisi.then((int satirSayisi) => satSay = satirSayisi);
    satirSayisi.whenComplete(() {
      if (sayac == 0) {
        satirlar.then((List<Map> satir) => _satirlar(satir));
        sayac++;
      }
    });

    var txt1 = new TextEditingController(text: seraAdi);
    var txt2_1 = new TextEditingController(text: yerelIP_1);
    var txt2_2 = new TextEditingController(text: yerelIP_2);
    var txt2_3 = new TextEditingController(text: yerelIP_3);
    var txt2_4 = new TextEditingController(text: yerelIP_4);
    var txt3 = new TextEditingController(text: wifiAdi);
    var txt4_1 = new TextEditingController(text: uzakIP_1);
    var txt4_2 = new TextEditingController(text: uzakIP_2);
    var txt4_3 = new TextEditingController(text: uzakIP_3);
    var txt4_4 = new TextEditingController(text: uzakIP_4);
    var txt5_1 = new TextEditingController(text: plcIP_1);
    var txt5_2 = new TextEditingController(text: plcIP_2);
    var txt5_3 = new TextEditingController(text: plcIP_3);
    var txt5_4 = new TextEditingController(text: plcIP_4);

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


                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 5*oran),
                    child: Text(
                      SelectLanguage().selectStrings(dilSecimi, "tv1"),
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
                  margin:
                      EdgeInsets.only(top: 5*oran, bottom: 0, left: 80*oran, right: 80*oran),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(216, 27, 96, 1.0),
                  height: 2,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      //color: Colors.grey.shade500,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20*oran, right: 20*oran),

                      child: Column(
                        children: <Widget>[


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Expanded(
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(

                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[

                                            Padding(
                                              padding: EdgeInsets.only(top: 5*oran,right: 5*oran,bottom: 5*oran),
                                              child: InkWell(
                                      onTap: () {
          setState(() {
            cbox1_value = !cbox1_value;
            cbox2_value=false;
          });
        },

                                                                            child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: cbox1_value==true ? Colors.deepOrange : Colors.grey.shade600),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: cbox1_value
                ? Icon(
                    Icons.check,
                    size: 30.0*oran,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.remove_circle,
                    size: 30.0*oran,
                    color: Colors.grey.shade300,
                  ),
          ),
        ),
                                    ),
                                            ),

  
                                                
                                            Padding(
                                              padding: EdgeInsets.only(top: 5*oran),
                                              child: Text(SelectLanguage().selectStrings(dilSecimi, "cbox1"),textScaleFactor: oran,),
                                            )
                                          
                                          
                                          ],
                                        ),
                                      ),
                                    ),


                                 

                                  ],
                                ),
                              ),




                            ],

                          ),



                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 27,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 5*oran, right: 10*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      seraAdi = x;
                                                      click_sayac = 0;
                                                    },
                                                    controller: txt1,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration: new InputDecoration(
                                                        hintText:
                                                        SelectLanguage().selectStrings(dilSecimi, "hint1"),
                                                      
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                top: 5,
                                                                bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "tv2"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        216, 27, 96, 1.0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              flex: 7,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      yerelIP_1 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt2_1,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      yerelIP_2 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt2_2,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      yerelIP_3 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt2_3,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 5*oran, right: 10*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      yerelIP_4 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt2_4,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "tv3"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        216, 27, 96, 1.0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              flex: 7,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 27,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 5*oran, right: 10*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      wifiAdi = x;
                                                    },
                                                    controller: txt3,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration: new InputDecoration(
                                                        hintText:
                                                        SelectLanguage().selectStrings(dilSecimi, "hint2"),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                top: 5,
                                                                bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "tv4"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        216, 27, 96, 1.0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              flex: 7,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      uzakIP_1 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt4_1,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      uzakIP_2 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt4_2,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      uzakIP_3 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt4_3,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 5*oran, right: 10*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value ||
                                                                cbox2_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      uzakIP_4 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt4_4,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value ||
                                                            cbox2_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "tv5"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              flex: 7,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      plcIP_1 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt5_1,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      plcIP_2 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt5_2,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      plcIP_3 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt5_3,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                ".",
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 10*oran),
                                                color: Color.fromRGBO(
                                                    218, 99, 56, 1.0),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: cbox1_value
                                                            ? [
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                                const Color(
                                                                    0xFFFFFFFF)
                                                              ]
                                                            : [
                                                                const Color(
                                                                    0xFFDFDDDD),
                                                                const Color(
                                                                    0xFFBBBBBC),
                                                              ],
                                                        //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                        begin: FractionalOffset
                                                            .topCenter,
                                                        end: FractionalOffset
                                                            .bottomCenter),
                                                  ),

                                                  child: TextField(
                                                    onChanged: (String x) {
                                                      plcIP_4 = x;
                                                    },
                                                    maxLength: 3,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: txt5_4,
                                                    style:
                                                        TextStyle(fontSize: 18*oran),
                                                    decoration:
                                                        new InputDecoration(
                                                            counterStyle:
                                                                TextStyle(
                                                              height: double
                                                                  .minPositive,
                                                            ),
                                                            counterText: "",
                                                            hintText: "000",
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5)),
                                                    enabled: cbox1_value
                                                        ? true
                                                        : false,
                                                  ),

                                                  margin: EdgeInsets.all(1*oran),
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                SelectLanguage().selectStrings(dilSecimi, "tv38"),
                                                textScaleFactor: oran,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        216, 27, 96, 1.0),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              flex: 7,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    //color: Colors.yellow,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: FlatButton(
                                          onPressed: () {
                                            cbox1_value==true ? _baslaClick() : null;
                                          },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                          Image.asset(
                                            cbox1_value
                                                ? 'assets/images/giris_rotate_icon_beyaz.png'
                                                : 'assets/images/giris_rotate_icon_gri.png',
                                            scale: 2.8/oran,
                                          ),
                                          Text(
                                            SelectLanguage().selectStrings(dilSecimi, "btn1"),
                                            textScaleFactor: oran,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontFamily:
                                                'Audio wide'),
                                          )
                                      ],
                                    ),
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
                                top: 10*oran, bottom: 10*oran, left: 40*oran, right: 40*oran),
                            alignment: Alignment.center,
                            color: Color.fromRGBO(216, 27, 96, 1.0),
                            height: 2,
                          ),
                          Column(
                            children: <Widget>[
/*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Checkbox(
                                      value: monVal,
                                      checkColor: Colors.white,
                                      activeColor: Colors.deepOrange,
                                      onChanged: (bool value) {
                                        setState(() {
                                          monVal = value;
                                        });

                                        print(monVal.toString());
                                      }),
                                  Text("Kurulum ayarlarını sistemden çek")
                                ],
                              ),

*/
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.end,
                                            children: <Widget>[


                                             
                                            Padding(
                                              padding: EdgeInsets.only(top: 5*oran,right: 5*oran),
                                              child: InkWell(
                                      onTap: () {
          setState(() {
            cbox2_value = !cbox2_value;
            cbox1_value=false;
          });
        },

                                                                            child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: cbox2_value==true ? Colors.deepOrange : Colors.grey.shade600),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: cbox2_value
                ? Icon(
                    Icons.check,
                    size: 30.0*oran,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.remove_circle,
                    size: 30.0*oran,
                    color: Colors.grey.shade300,
                  ),
          ),
        ),
                                    ),
                                            ),

  
                                                
                                            Padding(
                                              padding: EdgeInsets.only(top: 5*oran,right: 24*oran),
                                              child: Text(SelectLanguage().selectStrings(dilSecimi, "cbox2"),textScaleFactor: oran,),
                                            )
                                          
                                            
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10*oran,top: 5*oran),
                                                  color: Color.fromRGBO(
                                                      218, 99, 56, 1.0),
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: cbox2_value
                                                              ? [
                                                                  const Color(
                                                                      0xFFFFFFFF),
                                                                  const Color(
                                                                      0xFFFFFFFF)
                                                                ]
                                                              : [
                                                                  const Color(
                                                                      0xFFDFDDDD),
                                                                  const Color(
                                                                      0xFFBBBBBC),
                                                                ],
                                                          //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                                                          begin:
                                                              FractionalOffset
                                                                  .topCenter,
                                                          end: FractionalOffset
                                                              .bottomCenter),
                                                    ),

                                                    child: TextField(
                                                      style: TextStyle(
                                                          fontSize: 18*oran),
                                                      decoration: new InputDecoration(
                                                          hintText:
                                                          SelectLanguage().selectStrings(dilSecimi, "hint3"),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 5,
                                                                  bottom: 5)),
                                                      enabled: cbox2_value
                                                          ? true
                                                          : false,
                                                      obscureText: true,
                                                    ),

                                                    margin: EdgeInsets.all(1*oran),
                                                    alignment: Alignment.center,
                                                    //padding: EdgeInsets.only(top: 20),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  SelectLanguage().selectStrings(dilSecimi, "tv6"),
                                                  textScaleFactor: oran,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          216, 27, 96, 1.0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                flex: 2,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      //color: Colors.yellow,
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: FlatButton(
                                              onPressed: () {},
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    cbox2_value
                                                        ? 'assets/images/giris_rotate_icon_beyaz.png'
                                                        : 'assets/images/giris_rotate_icon_gri.png',
                                                    scale: 5/oran,
                                                  ),
                                                  Text(
                                                    SelectLanguage().selectStrings(dilSecimi, "btn2"),
                                                    textScaleFactor: oran,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Audio wide'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.all(5*oran),
            alignment: Alignment.center,
            //padding: EdgeInsets.only(top: 5),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 50*oran,
        height: 50*oran,
        margin: EdgeInsets.only(top: 70*oran,right: 5*oran),
        
        child: FloatingActionButton(
          onPressed: (){
            kurulumDurum=="ok" ?
            Navigator.popUntil(context, ModalRoute.withName('/ayarlar'))
            :
            Navigator.popUntil(context, ModalRoute.withName('/genelAyarlar'));
            //Navigator.of(context).pop();


          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.arrow_back,size:50*oran,color: Colors.black,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

    //endregion
  }

/*
  void _query() async {

    final allRows = await dbHelper.veriCek(1,3);
    seraAdi=allRows;
    print('gelen veri : $allRows');
  }

  void _insert(int idNo, String v1,String v2, String v3, String v4) {

    final id =  dbHelper.veriEkle(idNo, v1, v2, v3, v4);

    if(id==0)
      print("girilen id zaten var");
    else
      print('girilen id li veri eklendi');


  }


  satirGetir (String sAdi, String yIP, String wAdi, String uIP){

    seraAdi= sAdi;
    yerelIP=yIP;
    wifiAdi=wAdi;
    uzakIP=uIP;

  }

  */

  _satirlar(List<Map> satirlar) {

    if (satSay > 0) {
      kurulumDurum = satirlar[0]["veri1"];
    }
    if (satSay > 1) {
      seraAdi = satirlar[1]["veri1"];
    }
    if (satSay > 2) {
      yerelIP_1 = satirlar[2]["veri1"];
      yerelIP_2 = satirlar[2]["veri2"];
      yerelIP_3 = satirlar[2]["veri3"];
      yerelIP_4 = satirlar[2]["veri4"];
    }
    if (satSay > 3) {
      wifiAdi = satirlar[3]["veri1"];
    }
    if (satSay > 4) {
      uzakIP_1 = satirlar[4]["veri1"];
      uzakIP_2 = satirlar[4]["veri2"];
      uzakIP_3 = satirlar[4]["veri3"];
      uzakIP_4 = satirlar[4]["veri4"];
    }
    if (satSay > 5) {
      plcIP_1 = satirlar[5]["veri1"];
      plcIP_2 = satirlar[5]["veri2"];
      plcIP_3 = satirlar[5]["veri3"];
      plcIP_4 = satirlar[5]["veri4"];
    }

    if (satSay > 12) {
      dilSecimi = satirlar[12]["veri1"];
    }

    setState(() {});
    print("SATIR SAYISI: $satSay");
  }

  _baslaClick() {
    if (seraAdi == "")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast7"), context, duration: 2);
    else if (yerelIP_1 == "" ||
        yerelIP_2 == "" ||
        yerelIP_3 == "" ||
        yerelIP_4 == "")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast8"), context, duration: 2);
    else if (wifiAdi == "")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast9"), context, duration: 2);
    else if (uzakIP_1 == "" ||
        uzakIP_2 == "" ||
        uzakIP_3 == "" ||
        uzakIP_4 == "")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast10"), context, duration: 2);
    else if (plcIP_1 == "" || plcIP_2 == "" || plcIP_3 == "" || plcIP_4 == "")
      Toast.show(SelectLanguage().selectStrings(dilSecimi, "toast11"), context, duration: 2);
    else {
      dbHelper.veriYOKSAekleVARSAguncelle(2, seraAdi, "dnm", "dnm", "dnm");
      dbHelper.veriYOKSAekleVARSAguncelle(
          3, yerelIP_1, yerelIP_2, yerelIP_3, yerelIP_4);
      dbHelper.veriYOKSAekleVARSAguncelle(4, wifiAdi, "dnm", "dnm", "dnm");
      dbHelper.veriYOKSAekleVARSAguncelle(
          5, uzakIP_1, uzakIP_2, uzakIP_3, uzakIP_4);
      dbHelper.veriYOKSAekleVARSAguncelle(
          6, plcIP_1, plcIP_2, plcIP_3, plcIP_4);

        

          Navigator.push(context,
          MaterialPageRoute(builder: (context) => BaslangicSektorAyarlari()));

          //Navigator.pushReplacement(context, 
          //MaterialPageRoute(builder: (context) => BaslangicSektorAyarlari()));
    }
  }


  _languageClick(BuildContext context) {

    dbHelper.veriYOKSAekleVARSAguncelle(
        13, dilSecimi, "0", "0", "0");

  }



}
