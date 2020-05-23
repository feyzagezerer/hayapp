import 'package:flutter/material.dart';
import 'package:hayapp/hayvanlar.dart';
import 'package:hayapp/veteriner_bul/vet_bul.dart';
import 'package:hayapp/kullanici.dart';
import 'package:hayapp/soru_sor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayapp/yardim_cagir/yardim_ana.dart';
import 'package:hayapp/yardim_cagir/liste.dart';
import 'package:hayapp/yardim_cagir/yardimcagir.dart';
import 'package:hayapp/bildirimler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//ANASAYFA

class Home extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar;
  Hayvanlar sayfaHayvanlar;
  VetBul sayfaVetBul;
  YardimAna sayfaYardim;
  SoruSor sayfaSoruSor;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaHayvanlar = Hayvanlar();
    sayfaVetBul = VetBul();
    sayfaYardim = YardimAna();
    sayfaSoruSor = SoruSor();
    tumSayfalar = [sayfaHayvanlar, sayfaVetBul, sayfaYardim, sayfaSoruSor];
  //  Bildirimler().initializeFCMNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hayapp',
          style: TextStyle(color: Colors.white),
        ),

      ),
      body:  tumSayfalar[secilenMenuItem],


      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.green,
          primaryColor: Colors.redAccent,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red.shade100,
                ),
                title: Text(
                  'Anasayfa',
                  style: TextStyle(color: Colors.red.shade100),
                ),
                backgroundColor: Colors.blueAccent),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.map,
                  color: Colors.red.shade100,
                ),
                title: Text(
                  'Veteriner Bul',
                  style: TextStyle(color: Colors.red.shade100),
                ),
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.red.shade100,
              ),
              title: Text(
                'Yardım Çağır',
                style: TextStyle(color: Colors.red.shade100),
              ),
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.help),title: Text("Soru Sor")),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
                color: Colors.red.shade100,
              ),
              title: Text(
                'Soru Sor',
                style: TextStyle(color: Colors.red.shade100),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.red.shade100,
              ),
              title: Text(
                'Profil',
                style: TextStyle(color: Colors.red.shade100),
              ),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: secilenMenuItem,
          fixedColor: Colors.red,
          onTap: (index) {
            setState(() {
              secilenMenuItem = index;
            });
          },
        ),
      ),
    );
  }

  /*Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.green,
        primaryColor: Colors.redAccent,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red.shade100,
              ),
              title: Text(
                'Anasayfa',
                style: TextStyle(color: Colors.red.shade100),
              ),
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: Colors.red.shade100,
              ),
              title: Text(
                'Veteriner Bul',
                style: TextStyle(color: Colors.red.shade100),
              ),
              backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: Colors.red.shade100,
            ),
            title: Text(
              'Yardım Çağır',
              style: TextStyle(color: Colors.red.shade100),
            ),
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.help),title: Text("Soru Sor")),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.red.shade100,
            ),
            title: Text(
              'Soru Sor',
              style: TextStyle(color: Colors.red.shade100),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.red.shade100,
            ),
            title: Text(
              'Profil',
              style: TextStyle(color: Colors.red.shade100),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: secilenMenuItem,
        fixedColor: Colors.red,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
          });
        },
      ),
    );*/

}

/*ESKİ BODY
* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            tumSayfalar[secilenMenuItem],
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  RaisedButton(
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
                  RaisedButton(
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
                  RaisedButton(
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
                  RaisedButton(
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavMenu(),
    );
  }
*/
