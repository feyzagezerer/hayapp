import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStore extends StatefulWidget {
  @override
  _FireStoreState createState() => _FireStoreState();
}

class _FireStoreState extends State<FireStore> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Firestore ...',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("veri ekle"),
              color: Colors.green,
              onPressed: _veriEkle,
            ),
          ],
        ),
      ),
    );
  }

  void _veriEkle() {
    Map<String, dynamic> feyEkle = Map();
    feyEkle['sifre'] = "123456";
    _firestore
        .collection("kullanicilar")
        .document("feygfey9@gmail.com")
        .setData(feyEkle)
        .then((v) => debugPrint("fey eklendi"));

  }
}
