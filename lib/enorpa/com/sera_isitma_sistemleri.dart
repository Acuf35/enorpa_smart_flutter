import 'package:flutter/material.dart';

import 'package:enorpa_smart/enorpa/com/webpage.dart';

class SeraIsitmaSistemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                "SERA ISITMA SİSTEMLERİ",
                textScaleFactor: oran,
                style: TextStyle(
                    color: Colors.grey.shade100,
                    fontFamily: 'Audio wide',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30*oran),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(top: 20*oran,bottom: 10*oran),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.adjust,
                                color: Colors.white,
                                size: 30*oran,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10*oran),
                                child: Text(
                                  "Anahtar Teslim",
                                  textScaleFactor: oran,
                                  style: TextStyle(
                                      fontFamily: 'Kelly Slab',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),

                      ),




                      Container(
                        padding: EdgeInsets.only(left: 50*oran,bottom: 10*oran),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.forward),
                              iconSize: 30*oran,
                              color: Colors.deepOrange,
                              onPressed: () {},
                            ),
                            RaisedButton(padding: EdgeInsets.all(10*oran),
                              onPressed: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Webpage("http://www.enorpa.com/tr/urun/anahtar-teslim-sera-isitma-sistem")));


                              },
                              color: Color.fromRGBO(
                                  218, 99, 56, 1.0),
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                              child: Text(
                                "Anahtar Teslim Sera Isıtma Sistemleri",
                                textScaleFactor: oran,
                                style: TextStyle(
                                    fontFamily: 'Kelly Slab',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
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
}
