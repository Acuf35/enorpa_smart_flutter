import 'package:enorpa_smart/genel/database_helper.dart';
import 'package:enorpa_smart/genel/deger_giris_2x1.dart';
import 'package:enorpa_smart/kontrol/alarm_online.dart';
import 'package:enorpa_smart/languages/select.dart';
import 'package:flutter/material.dart';

class SsensorKalibrasyon extends StatefulWidget {
  String tur = "";

  SsensorKalibrasyon.deger(String x) {
    tur = x;
  }
  @override
  State<StatefulWidget> createState() {
    return  SsensorKalibrasyonState.deger(tur);
  }
}

class  SsensorKalibrasyonState extends State< SsensorKalibrasyon> {
  String tur = "";

  SsensorKalibrasyonState.deger(String x) {
    tur = x;
    print(tur);
  }

  int _onlar=2;
  int _birler=1;
  int _ondalik=5;
  int _degerNo=0;

  String kuzey_arti="2.5";
  String kuzey_eksi="2.5";
  String orta_arti="2.5";
  String orta_eksi="2.5";
  String guney_arti="2.5";
  String guney_eksi="2.5";
  String nem_arti="2.5";
  String nem_eksi="2.5";

  final dbHelper = DatabaseHelper.instance;



  String dilSecimi="TR";



  @override
  Widget build(BuildContext context) {

    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    //SystemChrome.setEnabledSystemUIOverlays([]);



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
                          SelectLanguage().selectStrings(dilSecimi, 'tv30'),
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
                  EdgeInsets.only(top: 0, bottom: 0, left: 80*oran, right: 80*oran),
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
                              margin: EdgeInsets.only(top: 10*oran),
                              child: Text(
                                _turMethot(tur),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 16, fontFamily: 'Audio wide'),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Text("(+)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){

                                                          if(kuzey_arti.length==4){
                                                            _ondalik=int.parse(kuzey_arti.split('')[3]);
                                                            _birler=int.parse(kuzey_arti.split('')[1]);
                                                            _onlar=int.parse(kuzey_arti.split('')[0]);
                                                            _degerNo=1;
                                                          }else{
                                                            _ondalik=int.parse(kuzey_arti.split('')[2]);
                                                            _birler=int.parse(kuzey_arti.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=1;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(kuzey_arti,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv35'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                      ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                    Text("80.0",textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                    ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5*oran),
                                      child: Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 18),),
                                    )
                                  ],
                                ),
                              ),

                                        Row(
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(kuzey_eksi.length==4){
                                                            _ondalik=int.parse(kuzey_eksi.split('')[3]);
                                                            _birler=int.parse(kuzey_eksi.split('')[1]);
                                                            _onlar=int.parse(kuzey_eksi.split('')[0]);
                                                            _degerNo=2;
                                                          }else{
                                                            _ondalik=int.parse(kuzey_eksi.split('')[2]);
                                                            _birler=int.parse(kuzey_eksi.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=2;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(kuzey_eksi,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )


                                          ],
                                        ),

                                        Text("(-)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),

                                      ],
                                    ),
                                  )




                              ),

                              Container(
                                margin: EdgeInsets.only(top: 50*oran,bottom: 50*oran,left: 10*oran,right: 10*oran),
                                alignment: Alignment.center,
                                color: Color.fromRGBO(
                                  216, 27, 96, 1.0),
                                width: 2,
                              ),


                              Expanded(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      
                                        Text("(+)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(orta_arti.length==4){
                                                            _ondalik=int.parse(orta_arti.split('')[3]);
                                                            _birler=int.parse(orta_arti.split('')[1]);
                                                            _onlar=int.parse(orta_arti.split('')[0]);
                                                            _degerNo=3;
                                                          }else{
                                                            _ondalik=int.parse(orta_arti.split('')[2]);
                                                            _birler=int.parse(orta_arti.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=3;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(orta_arti,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv37'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                      ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                    Text("80.0",textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                    ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5*oran),
                                      child: Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 18),),
                                    )
                                  ],
                                ),
                              ),

                                        Row(
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(orta_eksi.length==4){
                                                            _ondalik=int.parse(orta_eksi.split('')[3]);
                                                            _birler=int.parse(orta_eksi.split('')[1]);
                                                            _onlar=int.parse(orta_eksi.split('')[0]);
                                                            _degerNo=4;
                                                          }else{
                                                            _ondalik=int.parse(orta_eksi.split('')[2]);
                                                            _birler=int.parse(orta_eksi.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=4;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(orta_eksi,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )


                                          ],
                                        ),

                                        Text("(-)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),



                                    ],
                                  )




                              ),





                                  ],
                                ),
                              ),


                              

                              Container(
                                margin: EdgeInsets.only(top: 50*oran,bottom: 50*oran,left: 10*oran,right: 10*oran),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                        Text("(+)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(guney_arti.length==4){
                                                            _ondalik=int.parse(guney_arti.split('')[3]);
                                                            _birler=int.parse(guney_arti.split('')[1]);
                                                            _onlar=int.parse(guney_arti.split('')[0]);
                                                            _degerNo=5;
                                                          }else{
                                                            _ondalik=int.parse(guney_arti.split('')[2]);
                                                            _birler=int.parse(guney_arti.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=5;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(guney_arti,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv36'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                      ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                    Text("80.0",textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                    ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5*oran),
                                      child: Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 18),),
                                    )
                                  ],
                                ),
                              ),

                                        Row(
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(guney_eksi.length==4){
                                                            _ondalik=int.parse(guney_eksi.split('')[3]);
                                                            _birler=int.parse(guney_eksi.split('')[1]);
                                                            _onlar=int.parse(guney_eksi.split('')[0]);
                                                            _degerNo=6;
                                                          }else{
                                                            _ondalik=int.parse(guney_eksi.split('')[2]);
                                                            _birler=int.parse(guney_eksi.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=6;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(guney_eksi,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )


                                          ],
                                        ),

                                        Text("(-)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),


                                    ],
                                  )




                              ),

                              Container(
                                margin: EdgeInsets.only(top: 50*oran,bottom: 50*oran,left: 10*oran,right: 10*oran),
                                alignment: Alignment.center,
                                color: Color.fromRGBO(
                                  216, 27, 96, 1.0),
                                width: 2,
                              ),


                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10*oran),
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        
                                        Text("(+)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(nem_arti.length==4){
                                                            _ondalik=int.parse(nem_arti.split('')[3]);
                                                            _birler=int.parse(nem_arti.split('')[1]);
                                                            _onlar=int.parse(nem_arti.split('')[0]);
                                                            _degerNo=7;
                                                          }else{
                                                            _ondalik=int.parse(nem_arti.split('')[2]);
                                                            _birler=int.parse(nem_arti.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=7;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(nem_arti,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(right: 10*oran),
                                      child: Text(SelectLanguage().selectStrings(dilSecimi, 'tv34'),textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                      ,color: Colors.deepOrange.shade800,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                    Text("80.0",textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab'
                                    ,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5*oran),
                                      child: Text("°C",textScaleFactor: oran,style: TextStyle(fontSize: 18),),
                                    )
                                  ],
                                ),
                              ),

                                        Row(
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
                                                        padding: EdgeInsets.only(top: 10*oran,bottom: 10*oran),
                                                        onPressed: (){
                                                          if(nem_eksi.length==4){
                                                            _ondalik=int.parse(nem_eksi.split('')[3]);
                                                            _birler=int.parse(nem_eksi.split('')[1]);
                                                            _onlar=int.parse(nem_eksi.split('')[0]);
                                                            _degerNo=8;
                                                          }else{
                                                            _ondalik=int.parse(nem_eksi.split('')[2]);
                                                            _birler=int.parse(nem_eksi.split('')[0]);
                                                            _onlar=0;
                                                            _degerNo=8;
                                                          }

                                                          _degergiris2X1();
                                                        }, child: Text(nem_eksi,textScaleFactor: oran,style: TextStyle(fontFamily: 'Kelly Slab', fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),))
                                                )
                                            )


                                          ],
                                        ),

                                        Text("(-)",textScaleFactor: oran,style: TextStyle(fontSize: 40),),


                                      ],
                                    ),
                                  )




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


  _languageClick(BuildContext context) {

    dbHelper.veriYOKSAekleVARSAguncelle(
        13, dilSecimi, "0", "0", "0");

  }


  _turMethot(String x) {
    String sonuc = "";
    if (x == "k1")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv32");
    else if (x == "k2")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv33");
    else if (x == "s1")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv8");
    else if (x == "s2")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv9");
    else if (x == "s3")
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv10");
    else if (x == "s4") 
      sonuc=SelectLanguage().selectStrings(dilSecimi, "tv11");

    return sonuc;
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
        kuzey_arti=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==2)
        kuzey_eksi=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==3)
        orta_arti=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==4)
        orta_eksi=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==5)
        guney_arti=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==6)
        guney_eksi=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==5)
        nem_arti=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
      if(_degerNo==6)
        nem_eksi=(_onlar==0 ? '' : _onlar.toString())+_birler.toString()+"."+_ondalik.toString();
    

      setState(() {

      });
    });

  }





}





