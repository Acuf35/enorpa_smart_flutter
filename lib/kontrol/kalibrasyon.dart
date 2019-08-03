import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/kontrol/k_sensor_kalibrasyon.dart';
import 'package:enorpa_smart/kontrol/s_sensor_kalibrasyon.dart';
import 'package:enorpa_smart/kontrol/ucyvana_kalibrasyon.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class Kalibrasyon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  KalibrasyonState();
  }
}

class  KalibrasyonState extends State< Kalibrasyon> {

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
    oran = MediaQuery.of(context).textScaleFactor;

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
                          SelectLanguage().selectStrings(dilSecimi, 'tv27'),
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
                          )
                      ),
                    )


                  ],
                ),




                Container(
                  margin:
                  EdgeInsets.only(top: 0, bottom: 0, left: 120*oran, right: 120*oran),
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
                            child: Container(
                              margin: EdgeInsets.only(top:10*oran),
                              child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv28'),textScaleFactor: oran,style: TextStyle(fontSize: 16,fontFamily: 'Audio wide'),),alignment: Alignment.center,),
                          ),

                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv29'),textScaleFactor: oran,style: TextStyle(fontSize: 16,fontFamily: 'Audio wide'),),alignment: Alignment.center,),
                          ),
                        ],
                      ),


                      Expanded(
                        child: Row(
                          children: <Widget>[


                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: k2_aktif=="1" ? 10*oran : 70*oran,left: k2_aktif=="1" ? 0 : 70*oran),
                                child: Row(
                                  children: <Widget>[

                                    Expanded(

                                      child: Column(
                                        children: <Widget>[

                                          Expanded(
                                            flex:5,
                                            child: Container(
                                              margin: EdgeInsets.all(10*oran),
                                              alignment: Alignment.center,
                                              child: Stack(
                                                //alignment: AlignmentDirectional.center,
                                                children: <Widget>[
                                                  Center(
                                                    child: FlatButton(padding: EdgeInsets.all(10*oran),
                                                      onPressed: (){

                                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            KsensorKalibrasyon.deger("k1")));



                                                      },child: Image.asset(
                                                      'assets/images/kazan_icon.png',
                                                    ),)
                                                  ),

                                                  Container(
                                                    child: Text("1",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                    padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
                                                  )

                                                ],

                                              ),
                                            ),
                                          ),

                                          
                                        ],
                                      ),

                                    ),


                                    Visibility(
                                      visible: k2_aktif=="1" ? true : false,
                                                                          child: Expanded(

                                        child: Column(
                                          children: <Widget>[

                                            Expanded(
                                              flex:5,
                                              child: Container(
                                                margin: EdgeInsets.all(10*oran),
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  //alignment: AlignmentDirectional.center,
                                                  children: <Widget>[
                                                    Center(
                                                      child: FlatButton(padding: EdgeInsets.all(10*oran),
                                                        onPressed: (){
                                                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            KsensorKalibrasyon.deger("k2")));
                                                        },child: Image.asset(
                                                        'assets/images/kazan_icon.png',
                                                      ),)
                                                    ),

                                                    Container(
                                                      child: Text("2",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                      padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
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
                            ),



                            //Kazan 2 ye GEÇİŞ


                            Container(
                              margin: EdgeInsets.only(top: 10*oran, bottom: 10*oran),
                              alignment: Alignment.center,
                              color: Color.fromRGBO(
                                  216, 27, 96, 1.0),
                              width: 2,
                            ),

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: k2_aktif=="1" ? 10*oran : 70*oran,left: k2_aktif=="1" ? 0 : 70*oran),
                                child: Row(
                                  children: <Widget>[

                                  Expanded(

                                    child: Column(
                                      children: <Widget>[

                                        Expanded(
                                          flex:5,
                                          child: Container(
                                            margin: EdgeInsets.all(10*oran),
                                            alignment: Alignment.center,
                                            child: Stack(
                                              //alignment: AlignmentDirectional.center,
                                              children: <Widget>[
                                                Center(
                                                  child: FlatButton(padding: EdgeInsets.all(10*oran),
                                                    onPressed: (){

                                                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("k1")));



                                                    },child: Image.asset(
                                                    'assets/images/kazan_icon.png',
                                                  ),)
                                                ),

                                                Container(
                                                  child: Text("1",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                  padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
                                                )

                                              ],

                                            ),
                                          ),
                                        ),

                                        
                                      ],
                                    ),

                                  ),


                                  Visibility(
                                    visible: k2_aktif=="1" ? true : false,
                                                                      child: Expanded(

                                      child: Column(
                                        children: <Widget>[

                                          Expanded(
                                            flex:5,
                                            child: Container(
                                              margin: EdgeInsets.all(10*oran),
                                              alignment: Alignment.center,
                                              child: Stack(
                                                //alignment: AlignmentDirectional.center,
                                                children: <Widget>[
                                                  Center(
                                                    child: FlatButton(padding: EdgeInsets.all(10*oran),
                                                      onPressed: (){

                                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("k2")));
                                                      },child: Image.asset(
                                                      'assets/images/kazan_icon.png',
                                                    ),)
                                                  ),

                                                  Container(
                                                    child: Text("2",textScaleFactor: oran,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Audio wide',color: Colors.grey.shade700),),
                                                    padding: EdgeInsets.only(left: 10*oran,top: 10*oran),
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
                          
                          child: Row(
                            children: <Widget>[


                              Expanded(
                                child: Row(
                                  children: <Widget>[


                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10*oran),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[

                                        Visibility(
                                          visible: s1_aktif=="1" ? true : false,
                                                                                  child: Expanded(
                                            child: Row(
                                              children: <Widget>[

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
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                            onPressed: (){
                                                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SsensorKalibrasyon.deger("s1")));
                                                            }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn20"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        Visibility(
                                          visible: s3_aktif=="1" ? true : false,
                                                                                  child: Expanded(
                                            child: Row(
                                              children: <Widget>[


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
              end: FractionalOffset.bottomCenter),
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 15,bottom: 15),
                                                            onPressed: (){
                                                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SsensorKalibrasyon.deger("s3")));
                                                            }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn22"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )


                                              ],
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  )




                              ),

                              Visibility(
                                visible: sektorSayisi>1 ? true : false,
                                child: Container(
                                  margin: EdgeInsets.all(10*oran),
                                  alignment: Alignment.center,
                                  
                                  width: 2,
                                ),
                              ),


                              Visibility(
                                visible: sektorSayisi<2 ? false : true,
                                child: Expanded(
                                    child: Column(
                                    
                                      children: <Widget>[

                                        
                                        Visibility(
                                          visible: s2_aktif=="1" ? true : false,
                                                                                  child: Expanded(
                                            child: Row(
                                              children: <Widget>[




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
              end: FractionalOffset.bottomCenter),
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                            onPressed: (){
                                                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SsensorKalibrasyon.deger("s2")));
                                                            }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn21"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        Visibility(
                                          visible: s4_aktif=="1" ? true : false,
                                                                                  child: Expanded(
                                            child: Row(
                                              children: <Widget>[


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
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                        child: FlatButton(
                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                            onPressed: (){
                                                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SsensorKalibrasyon.deger("s4")));
                                                            }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn23"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),))
                                                    )
                                                )


                                              ],
                                            ),
                                          ),
                                        ),



                                      ],
                                    )




                                ),
                              ),





                                  ],
                                ),
                              ),


                              

                              Container(
                                margin: EdgeInsets.all(10*oran),
                                alignment: Alignment.center,
                                color: Color.fromRGBO(
                                    216, 27, 96, 1.0),
                                width: 2,
                              ),


                              Expanded(
                                child: Row(
                                  children: <Widget>[

                                    
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      Visibility(
                                        visible: s1_aktif=="1" ? true : false,
                                                                                child: Expanded(
                                          child: Row(
                                            children: <Widget>[

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
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                          onPressed: (){
                                                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("s1")));
                                                          }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn20"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      Visibility(
                                        visible: s3_aktif=="1" ? true : false,
                                                                                child: Expanded(
                                          child: Row(
                                            children: <Widget>[


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
              end: FractionalOffset.bottomCenter),
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
                                                      //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: FlatButton(
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                          onPressed: (){
                                                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("s3")));
                                                          }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn22"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white),))
                                                  )
                                              )


                                            ],
                                          ),
                                        ),
                                      ),


                                    ],
                                  )




                              ),

                              Visibility(
                                visible: sektorSayisi>1 ? true : false,
                                child: Container(
                                  margin: EdgeInsets.all(10*oran),
                                  alignment: Alignment.center,
                                  
                                  width: 2,
                                ),
                              ),


                              Visibility(
                                visible: sektorSayisi<1 ? false : true,
                                child: Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Column(
                                      
                                        children: <Widget>[

                                          
                                          Visibility(
                                            visible: s2_aktif=="1" ? true : false,
                                                                                    child: Expanded(
                                              child: Row(
                                                children: <Widget>[




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
              end: FractionalOffset.bottomCenter),
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                              onPressed: (){
                                                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("s2")));
                                                              }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn21"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          Visibility(
                                            visible: s4_aktif=="1" ? true : false,
                                                                                    child: Expanded(
                                              child: Row(
                                                children: <Widget>[


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
              end: FractionalOffset.bottomCenter),

          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                          //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                          child: FlatButton(
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              padding: EdgeInsets.only(top: 15*oran,bottom: 15*oran),
                                                              onPressed: (){
                                                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UcyvanaKalibrasyon.deger("s4")));
                                                              }, child: Text(SelectLanguage().selectStrings(dilSecimi, "btn23"),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white),))
                                                      )
                                                  )


                                                ],
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    )




                                ),
                              ),




                                  ],
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




}





