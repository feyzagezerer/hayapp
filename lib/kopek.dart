import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hayapp/kopek_yavru.dart';
import 'package:hayapp/kopek_yetiskin.dart';
import 'package:hayapp/bottom_navigation.dart';
import 'package:hayapp/hayvanlar.dart';

class Kopek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _KopekState();
}

class _KopekState extends State<Kopek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text(
          'Dostumuz köpek...',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 35.0, right: 10.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
               Text(
                  '   Yavru köpeklerle yetişkin köpekler birçok açıdan birbirinden farklıdır.\n\n   Yavru köpekler hakkında mı yetişkin köpekler hakkında mı bilgi almak istersiniz?\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green.shade900),
                ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                   Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, right: 10.0, bottom: 10.0),
                     child: ButtonTheme(
                    minWidth: 150.0,
                    height: 100.0,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 35.0, right: 5.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/yavrukopek.png",
                                width: 120,
                                height: 80,
                              ),
                              Text(
                                'Yavru Köpek',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green.shade900),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Kopekyavru()),
                          );
                        }),
                  ),
        ),


                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    child: ButtonTheme(
                    minWidth: 150.0,
                    height: 100.0,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(130.0),
                          side: BorderSide(color: Colors.white)),
                      elevation: 4,
                      focusColor: Colors.white,
                      splashColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, top: 35.0, right: 5.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/yetiskinkopek.png",
                              width: 130,
                              height: 80,
                            ),
                            Text(
                              'Yetişkin Köpek',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green.shade900),
                            ),
                          ],
                        ),
                      ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Kopekyetiskin()),
                          );
                        }
                    ),
                  ),
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

/*
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: TextStyle(color: Colors.white),
          ),

        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 4.0, top: 40.0, right: 4.0, bottom: 8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/food.png",
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'Kedi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.green.shade900),
                            ),
                          ],

                        ),

                        /*onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Hayvanlar()),
                          );
                        }*/

                      ),
                      new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                        focusColor: Colors.white,
                        splashColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 35.0, right: 8.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/ipuc.png",
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Köpek',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.green.shade900),
                              ),
                            ],
                          ),
                        ),
                        /*  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VetBul()),
                          );
                        }*/
                      ),
                      new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                        focusColor: Colors.white,
                        splashColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 33.0, right: 10.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/asi.png",
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                'Muhabbet Kuşu',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        /* onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AsiTakvimi()),
                          );
                        }*/
                      ),
                      new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(130.0),
                            side: BorderSide(color: Colors.white)),

                        focusColor: Colors.white,
                        splashColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 33.0, right: 8.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/navi.png",
                                width: 100,
                                height: 100,
                              ),
                              Text('Sultan Papağanı',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.green.shade900,
                                  )),
                            ],
                          ),
                        ),
                        /* onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VetBul()),
                          );
                        }*/
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.green,

          ),
          child: BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.red.shade100,),
              title: Text(
                'Anasayfa', style: TextStyle(color: Colors.red.shade100),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.map, color: Colors.red.shade100,),
              title: Text('Veteriner Bul',
                style: TextStyle(color: Colors.red.shade100),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.call, color: Colors.red.shade100,),
              title: Text('Yardım Çağır',
                style: TextStyle(color: Colors.red.shade100),),),
            // BottomNavigationBarItem(icon: Icon(Icons.help),title: Text("Soru Sor")),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer, color: Colors.red.shade100,),
              title: Text(
                'Soru Sor', style: TextStyle(color: Colors.red.shade100),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.red.shade100,),
              title: Text(
                'Profil', style: TextStyle(color: Colors.red.shade100),),),


          ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      );
    }*/
