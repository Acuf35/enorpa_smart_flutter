import 'dart:math';

import 'package:flutter/material.dart';

class DegerGirisTarih extends StatefulWidget {
  int g1 = 0;
  int g2 = 0;
  int a1 = 0;
  int a2 = 0;
  int y1 = 0;
  int y2 = 0;
  int y3 = 0;
  int y4 = 0;

  DegerGirisTarih.Deger(List tarih) {
    
    g1 = tarih[0];
    g2 = tarih[1];
    a1 = tarih[2];
    a2 = tarih[3];
    y1 = tarih[4];
    y2 = tarih[5];
    y3 = tarih[6];
    y4 = tarih[7];

  }

  @override
  _DegerGirisTarihState createState() =>
      new _DegerGirisTarihState.Deger(g1,g2,a1,a2,y1,y2,y3,y4);
}

class _DegerGirisTarihState extends State<DegerGirisTarih> {
  int gun1 = 0;
  int gun2 = 0;
  int ay1 = 0;
  int ay2 = 0;
  int yil1 = 0;
  int yil2 = 0;
  int yil3 = 0;
  int yil4 = 0;

  int yrd_gun1 = 0;
  int yrd_gun2 = 0;
  int yrd_ay1 = 0;
  int yrd_ay2 = 0;
  int yrd_yil1 = 0;
  int yrd_yil2 = 0;
  int yrd_yil3 = 0;
  int yrd_yil4 = 0;

  _DegerGirisTarihState.Deger(int g1, int g2, int a1, int a2,int y1, int y2, int y3, int y4) {
    gun1 = g1;
    gun2 = g2;
    ay1 = a1;
    ay2 = a2;
    yil1 = y1;
    yil2 = y2;
    yil3 = y3;
    yil4 = y4;

    yrd_gun1 = g1;
    yrd_gun2 = g2;
    yrd_ay1 = a1;
    yrd_ay2 = a2;
    yrd_yil1 = y1;
    yrd_yil2 = y2;
    yrd_yil3 = y3;
    yrd_yil4 = y4;
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
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Column(
                  children: <Widget>[
                    Text(
                      "GÜN",
                      textScaleFactor: oran,style: TextStyle(
                          fontFamily: 'Audio wide', fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10*oran),
                          child: Column(
                            children: <Widget>[
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (gun1 < 9)
                                    gun1++;
                                  else
                                    gun1 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                gun1.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (gun1 > 0)
                                    gun1--;
                                  else
                                    gun1 = 9;

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Column(
                            children: <Widget>[
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (gun2 < 9)
                                    gun2++;
                                  else
                                    gun2 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                gun2.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (gun2 > 0)
                                    gun2--;
                                  else
                                    gun2 = 9;

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5*oran, right: 5*oran),
                  child: Text(
                    "-",
                    textScaleFactor: oran,style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "AY",
                      textScaleFactor: oran,style: TextStyle(
                          fontFamily: 'Audio wide', fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10*oran),
                          child: Column(
                            children: <Widget>[
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (ay1 < 9)
                                    ay1++;
                                  else
                                    ay1 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                ay1.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (ay1 > 0)
                                    ay1--;
                                  else
                                    ay1 = 9;

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Column(
                            children: <Widget>[
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (ay2 < 9)
                                    ay2++;
                                  else
                                    ay2 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                ay2.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (ay2 > 0)
                                    ay2--;
                                  else
                                    ay2 = 9;

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5*oran, right: 5*oran),
                  child: Text(
                    "-",
                    textScaleFactor: oran,style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "YIL",
                      textScaleFactor: oran,style: TextStyle(
                          fontFamily: 'Audio wide', fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10*oran),
                          child: Column(
                            children: <Widget>[
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil1 < 9)
                                    yil1++;
                                  else
                                    yil1 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                yil1.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil1 > 0)
                                    yil1--;
                                  else
                                    yil1 = 9;

                                  setState(() {});
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
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil2 < 9)
                                    yil2++;
                                  else
                                    yil2 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                yil2.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil2 > 0)
                                    yil2--;
                                  else
                                    yil2 = 9;

                                  setState(() {});
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
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_artir_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil3 < 9)
                                    yil3++;
                                  else
                                    yil3 = 0;

                                  setState(() {});
                                },
                              ),
                              Text(
                                yil3.toString(),
                                textScaleFactor: oran,style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kelly Slab'),
                              ),
                              RawMaterialButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/deger_dusur_icon.png',
                                  scale: 4/oran,
                                ),
                                onPressed: () {
                                  if (yil3 > 0)
                                    yil3--;
                                  else
                                    yil3 = 9;

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            RawMaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.all(0),
                              child: Image.asset(
                                'assets/images/deger_artir_icon.png',
                                scale: 4/oran,
                              ),
                              onPressed: () {
                                if (yil4 < 9)
                                  yil4++;
                                else
                                  yil4 = 0;

                                setState(() {});
                              },
                            ),
                            Text(
                              yil4.toString(),
                              textScaleFactor: oran,style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kelly Slab'),
                            ),
                            RawMaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.all(0),
                              child: Image.asset(
                                'assets/images/deger_dusur_icon.png',
                                scale: 4/oran,
                              ),
                              onPressed: () {
                                if (yil4 > 0)
                                  yil4--;
                                else
                                  yil4 = 9;

                                setState(() {});
                              },
                            ),

                          ],

                      
                        ),
                      ],
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
              children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 30*oran),
              child: RaisedButton(
                color: Colors.indigo,
                onPressed: () {
          var deger = [gun1,gun2,ay1,ay2,yil1,yil2,yil3,yil4];
          Navigator.of(context).pop(deger);
                },
                child: Text(
          "ONAY",
          textScaleFactor: oran,style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Audio wide'),
                ),
              ),
            ),
            Container(
              
              child: RaisedButton(
                color: Colors.indigo,
                onPressed: () {
          var deger = [yrd_gun1,yrd_gun2,yrd_ay1,yrd_ay2,yrd_yil1,yrd_yil2,yrd_yil3,yrd_yil4];
          Navigator.of(context).pop(deger);
                },
                child: Text(
          "ÇIKIŞ",
          textScaleFactor: oran,style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Audio wide'),
                ),
              ),
            ),
              ],
            ),
        )
          ],
        ),
      ),
      actions: <Widget>[],
    );
  }
}
