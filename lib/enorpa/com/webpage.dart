
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webpage extends StatelessWidget{

  String link="";

  Webpage(String url){
    link=url;
  }
  
  
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
        //color: Color.fromRGBO(218, 99, 56, 1.0),
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xFF696969), const Color(0xFF353536)],
                //colors: [const Color(0xFFDFDDDD), const Color(0xFFBBBBBC)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter),
          ),
          child: Container(

            child: Stack(


              children: <Widget>[

                WebView(

                  //initialUrl: 'http://www.enorpa.com',
                  initialUrl: link,
                  javascriptMode: JavascriptMode.unrestricted,

                ),


                /*
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("DENEME" , style: TextStyle(fontSize: 24,color: Colors.white,fontFamily: 'Audio Wide',fontWeight: FontWeight.bold,backgroundColor: Colors.blue),)

              ],

            )
            */


              ],


            ),

            padding: EdgeInsets.only(top: 5*oran),
          ),




          margin: EdgeInsets.all(5*oran),
          alignment: Alignment.center,
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



      /*

      Scaffold(

      body: Container(

        child: Stack(


          children: <Widget>[

            WebView(

              //initialUrl: 'http://www.enorpa.com',
              initialUrl: 'http://www.enorpa.com/tr/urun/kalsedon-serisi-cift-kulhanli-sicak-su-kazani',
              javascriptMode: JavascriptMode.unrestricted,

            ),


            /*
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("DENEME" , style: TextStyle(fontSize: 24,color: Colors.white,fontFamily: 'Audio Wide',fontWeight: FontWeight.bold,backgroundColor: Colors.blue),)

              ],

            )
            */


          ],


        ),

        padding: EdgeInsets.only(top: 22),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.arrow_back,size: 50,),
      ),
    );

    */


  }
  
  
  
}