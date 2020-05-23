/*import 'package:flutter/material.dart';
import 'package:hayapp/hayvanlar.dart';
import 'package:hayapp/vet_bul.dart';

class Anamenu extends StatefulWidget {
    @override
  State<StatefulWidget> createState() => new _AnamenuState();
}

class _AnamenuState extends State< Anamenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Flexible(
              flex: 2,
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(130.0),
                      side: BorderSide(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 35.0, right: 10.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "images/food.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          'HAYVANLAR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.green.shade900),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hayvanlar()),
                    );
                  }),
            ),
            Flexible(
              flex: 2,
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(130.0),
                      side: BorderSide(color: Colors.white)),
                  elevation: 4,
                  focusColor: Colors.white,
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 35.0, right: 8.0, bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/ipuc.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          'VETERİNER BUL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.green.shade900),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VetBul()),
                    );
                  }),
            ),
            Flexible(
              flex: 2,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(130.0),
                    side: BorderSide(color: Colors.white)),
                elevation: 4,
                focusColor: Colors.white,
                splashColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 33.0, right: 10.0, bottom: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/asi.png",
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        'YARDIM ÇAĞIR',
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
            ),
            Flexible(
              flex: 2,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(130.0),
                    side: BorderSide(color: Colors.white)),
                elevation: 4,
                focusColor: Colors.white,
                splashColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 40.0, right: 8.0, bottom: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/navi.png",
                        width: 20,
                        height: 20,
                      ),
                      Text('SORU SOR',
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
            ),
          ],
        ),
      ),


    );
  }
}

*/