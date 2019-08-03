

import 'package:flutter/material.dart';

class DegerGiris2X1 extends StatefulWidget {

  int X=0;
  int Y=0;
  int Z=0;
  int T=0;

  DegerGiris2X1.Deger(int onLar, int birLer, int onDalik, int deGerNo){


    X=onLar;
    Y=birLer;
    Z=onDalik;
    T=deGerNo;
  }




  @override
  _DegerGiris2X1State createState() => new _DegerGiris2X1State.Deger(X, Y, Z, T);
}



class _DegerGiris2X1State extends State<DegerGiris2X1> {

  int onlar=0;
  int birler=0;
  int ondalik=0;
  int degerNo=0;

  int yrd_onlar=0;
  int yrd_birler=0;
  int yrd_ondalik=0;
  int yrd_degerNo=0;

  _DegerGiris2X1State.Deger(int x,int y , int z, int t){
    onlar=x;
    birler=y;
    ondalik=z;
    degerNo=t;

    yrd_onlar=x;
    yrd_birler=y;
    yrd_ondalik=z;
    yrd_degerNo=t;

    
  }



  @override
  Widget build(BuildContext context) {

    var oran;

    try {
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final realResolution = MediaQuery.of(context).size;
    oran = MediaQuery.of(context).textScaleFactor;
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

                Text(".",textScaleFactor: oran,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),

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
                        if(ondalik<9)
                          ondalik++;
                        else
                          ondalik=0;

                        setState(() {

                        });
                      },
                    ),

                    Text(ondalik.toString(),textScaleFactor: oran,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Kelly Slab'),),

                    RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/images/deger_dusur_icon.png',
                        scale: 4/oran,
                      ),

                      onPressed: (){

                        if(ondalik>0)
                          ondalik--;
                        else
                          ondalik=9;

                        setState(() {

                        });
                      },
                    ),



                  ],
                ),




              ],
            ),


            Container(
              padding: EdgeInsets.only(top: 20*oran),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(right: 20*oran),
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){

                    var deger=[onlar,birler,ondalik,degerNo];
                    Navigator.of(context).pop(deger);

                  },
                  child: Text("ONAY",textScaleFactor: oran,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Audio wide'),),
                ),

              ),


              Container(
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: (){
                    var deger=[yrd_onlar,yrd_birler,yrd_ondalik,yrd_degerNo];
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