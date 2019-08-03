

import 'dart:math';

import 'package:flutter/material.dart';

class DegerGiris3X0 extends StatefulWidget {

  int X=0;
  int Y=0;
  int Z=0;
  int T=0;

  DegerGiris3X0.Deger(int yuzLer, int onLar, int birLer, int deGerNo){



    X=yuzLer;
    Y=onLar;
    Z=birLer;
    T=deGerNo;
  }




  @override
  _DegerGiris3X0State createState() => new _DegerGiris3X0State.Deger(X, Y, Z, T);
}



class _DegerGiris3X0State extends State<DegerGiris3X0> {

  int yuzler=0;
  int onlar=0;
  int birler=0;
  int degerNo=0;

  int yrd_yuzler=0;
  int yrd_onlar=0;
  int yrd_birler=0;
  int yrd_degerNo=0;

  _DegerGiris3X0State.Deger(int x,int y , int z, int t){
    yuzler=x;
    onlar=y;
    birler=z;
    degerNo=t;

    yrd_yuzler=x;
    yrd_onlar=y;
    yrd_birler=z;
    yrd_degerNo=t;
  }



  @override
  Widget build(BuildContext context) {


    var oran;

    try {
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    var carpim = MediaQuery.of(context).size.width*MediaQuery.of(context).size.height;
    oran = sqrt(carpim/300441.0);
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

                Padding(
                  padding: EdgeInsets.only(right: 10*oran),
                  child: Column(
                    children: <Widget>[

                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          'assets/images/deger_artir_icon.png',
                          scale: 4/oran,
                        ),

                        onPressed: (){
                          if(yuzler<9)
                            yuzler++;
                          else
                            yuzler=0;

                          setState(() {

                          });
                        },
                      ),

                      Text(yuzler.toString(),textScaleFactor: oran,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),

                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          'assets/images/deger_dusur_icon.png',
                          scale: 4/oran,
                        ),

                        onPressed: (){

                          if(yuzler>0)
                            yuzler--;
                          else
                            yuzler=9;

                          setState(() {

                          });

                        },
                      ),



                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 10*oran),
                  child: Column(
                    children: <Widget>[

                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          'assets/images/deger_artir_icon.png',
                          scale: 4/oran,
                        ),

                        onPressed: (){

                          if(onlar<9)
                            onlar++;
                          else
                            onlar=0;

                          setState(() {

                          });
                        },
                      ),

                      Text(onlar.toString(),textScaleFactor: oran,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),

                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          'assets/images/deger_dusur_icon.png',
                          scale: 4/oran,
                        ),

                        onPressed: (){

                          if(onlar>0)
                            onlar--;
                          else
                            onlar=9;

                          setState(() {

                          });
                        },
                      ),



                    ],
                  ),
                ),

                Column(
                  children: <Widget>[

                    RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/images/deger_artir_icon.png',
                        scale: 4/oran,
                      ),

                      onPressed: (){
                        if(birler<9)
                          birler++;
                        else
                          birler=0;

                        setState(() {

                        });
                      },
                    ),

                    Text(birler.toString(),textScaleFactor: oran,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),

                    RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/images/deger_dusur_icon.png',
                        scale: 4/oran,
                      ),

                      onPressed: (){

                        if(birler>0)
                          birler--;
                        else
                          birler=9;

                        setState(() {

                        });
                      },
                    ),



                  ],
                ),




              ],
            ),


            
        Container(
          margin: EdgeInsets.only(top: 20*oran),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(right: 20*oran),
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){

                    var deger=[yuzler,onlar,birler,degerNo];
                    Navigator.of(context).pop(deger);

                  },
                  child: Text("ONAY",textScaleFactor: oran,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Audio wide'),),
                ),

              ),


              Container(
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){
                    var deger=[yrd_yuzler,yrd_onlar,yrd_birler,yrd_degerNo];
                    Navigator.of(context).pop(deger);
                  },
                  child: Text("ÇIKIŞ",textScaleFactor: oran,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Audio wide'),),
                ),
              ),

            ],
          ),
        ),




          ],
        ),
      ),

      actions: <Widget>[


      ],

    );
  }
}