import 'package:flutter/material.dart';
import 'package:hayapp/kopek.dart';
import 'package:hayapp/kedi.dart';
import 'package:hayapp/muhabbet_kusu.dart';
import 'package:hayapp/sultan_papagani.dart';

class Hayvanlar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HayvanlarState();
}

class _HayvanlarState extends State<Hayvanlar> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:13.0,top: 35.0,right:10.0,bottom: 10.0),
         child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

          Row(
          mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ButtonTheme(
                minWidth: 180.0,
                height: 180.0,
                    buttonColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 35.0, right: 5.0, bottom: 5.0),
                    child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                          child: Column(
                            mainAxisSize: MainAxisSize.max,

                            children: <Widget>[
                              Image.asset(
                                "images/kedi.png",
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Kedi',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green.shade900),
                              ),
                            ],
                          ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        }),),

                  ),
              ButtonTheme(
                minWidth: 180.0,
                height: 180.0,
                buttonColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 35.0, right: 5.0, bottom: 5.0),
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(130.0),
                        side: BorderSide(color: Colors.white)),

                    focusColor: Colors.white,
                    splashColor: Colors.white,

                    child: Column(
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[
                        Image.asset(
                          "images/muhabbetkusu.png",
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          'Muhabbet \nKuşu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green.shade900,
                          ),
                        ),
                      ],
                    ),


                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MuhabbetKusu()),
                      );
                    }
                ),
                ),
              ),


                  ],
      ),

              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 180.0,
                    height: 180.0,
                    buttonColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 5.0, right: 5.0, bottom: 10.0),
                    child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                        focusColor: Colors.white,
                        splashColor: Colors.white,

                        child: Column(
                          mainAxisSize: MainAxisSize.max,

                          children: <Widget>[
                            Image.asset(
                              "images/kopek.png",
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'Köpek',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.green.shade900),
                            ),
                          ],
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Kopek()),
                          );
                        }),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 180.0,
                    height: 180.0,
                    buttonColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 5.0, right: 5.0, bottom: 10.0),
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(130.0),
                          side: BorderSide(color: Colors.white)),

                      focusColor: Colors.white,
                      splashColor: Colors.white,

                        child: Column(
                          mainAxisSize: MainAxisSize.max,

                          children: <Widget>[
                            Image.asset(
                              "images/sultanpapagani.png",
                              width: 100,
                              height: 100,
                            ),
                            Text('Sultan\nPapağanı',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.green.shade900,
                                )),
                          ],
                        ),

                       onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SultanPapagani()),
                            );
                          }
                    ),),
                  ),
            ],
          ),
            ],
          ),

        ),
      ),

    );
  }
}
