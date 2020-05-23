import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MuhabbetKusu extends StatefulWidget {
  @override
  _MuhabbetKusuState createState() => _MuhabbetKusuState();
}

class _MuhabbetKusuState extends State<MuhabbetKusu > {
  final Firestore _firestore = Firestore.instance;
  File _secilenResim;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Islemleri"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Veri Ekle"),
              color: Colors.green,
              onPressed: _veriEkle,
            ),
            RaisedButton(
              child: Text("Transaction Ekle"),
              color: Colors.blue,
              onPressed: _transactionEkle,
            ),
            RaisedButton(
              child: Text("Veri Sil"),
              color: Colors.red,
              onPressed: _veriSil,
            ),
            RaisedButton(
              child: Text("Veri Oku"),
              color: Colors.pink,
              onPressed: _veriOku,
            ),
            RaisedButton(
              child: Text("Veri Sorgula"),
              color: Colors.brown,
              onPressed: _veriSorgula,
            ),
            RaisedButton(
              child: Text("Galeriden Storagea Resim"),
              color: Colors.orange,
              onPressed: _galeriResimUpload,
            ),
            RaisedButton(
              child: Text("Kameradan Storagea Resim"),
              color: Colors.purple,
              onPressed: _kameraResimUpload,
            ),
            Expanded(
              child: _secilenResim == null
                  ? Text("Resim YOK")
                  : Image.file(_secilenResim),
            )
          ],
        ),
      ),
    );
  }

  void _veriEkle() {
    Map<String, dynamic> emreEkle = Map();
    emreEkle['ad'] = "emre updated";
    emreEkle['lisanMezunu'] = true;
    emreEkle['lisanMezunu2'] = true;
    emreEkle['lisanMezunu23'] = true;
    emreEkle['okul'] = "ege";

    _firestore
        .collection("users")
        .document("emre_altunbilek")
        .setData(emreEkle, merge: true)
        .then((v) => debugPrint("emre eklendi"));

    _firestore
        .collection("users")
        .document("hasan_yilmaz")
        .setData({'ad': 'Hasan', 'cinsiyet': 'erkek'}).whenComplete(
            () => debugPrint("hasan eklendi"));

    _firestore.document("/users/ayse").setData({'ad': 'ayse'});

    _firestore.collection("users").add({'ad': 'can', 'yas': 35});

    String yeniKullaniciID =
        _firestore.collection("users").document().documentID;
    debugPrint("yeni doc id: $yeniKullaniciID");
    _firestore
        .document("users/$yeniKullaniciID")
        .setData({'yas': 30, 'userID': '$yeniKullaniciID'});

    _firestore.document("users/emre_altunbilek").updateData({
      'okul': 'ege üniversitesi',
      'yas': 60,
      'eklenme': FieldValue.serverTimestamp(),
      'begeniSayisi': FieldValue.increment(10)
    }).then((v) {
      debugPrint("emre güncellendi");
    });
  }

  void _transactionEkle() {
    final DocumentReference emreRef =
    _firestore.document("users/emre_altunbilek");

    debugPrint("doc id:" + emreRef.documentID);

    _firestore.runTransaction((Transaction transaction) async {
      DocumentSnapshot emreData = await emreRef.get();

      debugPrint("doc id:" + emreData.documentID);

      if (emreData.exists) {
        var emreninParasi = emreData.data['para'];

        if (emreninParasi > 100) {
          await transaction.update(emreRef, {'para': (emreninParasi - 100)});
          await transaction.update(_firestore.document("users/hasan_yilmaz"),
              {'para': FieldValue.increment(100)});
        } else {
          debugPrint("yetersiz bakiye");
        }
      } else {
        debugPrint("emre dökümanı yok");
      }
    });
  }

  void _veriSil() {
    //Döküman silme
    _firestore.document("users/ayse").delete().then((aa) {
      debugPrint("ayse silindi");
    }).catchError((e) => debugPrint("Silerken hata cıktı" + e.toString()));

    _firestore
        .document("users/hasan_yilmaz")
        .updateData({'cinsiyet': FieldValue.delete()}).then((aa) {
      debugPrint("cinsiyet silindi");
    }).catchError((e) => debugPrint("Silerken hata cıktı" + e.toString()));
  }

  Future _veriOku() async {
    //tek bir dökümanın okunması
    DocumentSnapshot documentSnapshot =
    await _firestore.document("users/emre_altunbilek").get();
    debugPrint("Döküman id:" + documentSnapshot.documentID);
    debugPrint("Döküman var mı:" + documentSnapshot.exists.toString());
    debugPrint("Döküman string: " + documentSnapshot.toString());
    debugPrint("bekleyen yazma var mı:" +
        documentSnapshot.metadata.hasPendingWrites.toString());
    debugPrint("cacheden mi geldi:" +
        documentSnapshot.metadata.isFromCache.toString());
    debugPrint("cacheden mi geldi:" + documentSnapshot.data.toString());
    debugPrint("cacheden mi geldi:" + documentSnapshot.data['ad']);
    debugPrint("cacheden mi geldi:" + documentSnapshot.data['para'].toString());
    documentSnapshot.data.forEach((key, deger) {
      debugPrint("key : $key deger :deger");
    });

    //koleksiyonun okunması
    _firestore.collection("users").getDocuments().then((querySnapshots) {
      debugPrint("User koleksiyonundaki eleman sayısı:" +
          querySnapshots.documents.length.toString());

      for (int i = 0; i < querySnapshots.documents.length; i++) {
        debugPrint(querySnapshots.documents[i].data.toString());
      }

      //anlık değişikliklerin dinlenmesi
      DocumentReference ref =
      _firestore.collection("users").document("emre_altunbilek");
      ref.snapshots().listen((degisenVeri) {
        debugPrint("anlık :" + degisenVeri.data.toString());
      });

      _firestore.collection("users").snapshots().listen((snap) {
        debugPrint(snap.documents.length.toString());
      });
    });
  }

  void _veriSorgula() async {
    var dokumanlar = await _firestore
        .collection("users")
        .where("email", isEqualTo: 'ayse@ayse.com')
        .getDocuments();
    for (var dokuman in dokumanlar.documents) {
      debugPrint(dokuman.data.toString());
    }

    var limitliGetir =
    await _firestore.collection("users").limit(3).getDocuments();
    for (var dokuman in limitliGetir.documents) {
      debugPrint("Limitli getirenler" + dokuman.data.toString());
    }

    var diziSorgula = await _firestore
        .collection("users")
        .where("dizi", arrayContains: 'breaking bad')
        .getDocuments();
    for (var dokuman in diziSorgula.documents) {
      debugPrint("Dizi şartı ile getirenler" + dokuman.data.toString());
    }

    var stringSorgula = await _firestore
        .collection("users")
        .orderBy("email")
        .startAt(['emre']).endAt(['emre' + '\uf8ff']).getDocuments();
    for (var dokuman in stringSorgula.documents) {
      debugPrint("String sorgula ile getirenler" + dokuman.data.toString());
    }

    _firestore
        .collection("users")
        .document("emre_altunbilek")
        .get()
        .then((docSnap) {
      debugPrint("emrenin verileri" + docSnap.data.toString());

      _firestore
          .collection("users")
          .orderBy('begeni')
          .endAt([docSnap.data['begeni']])
          .getDocuments()
          .then((querySnap) {
        if (querySnap.documents.length > 0) {
          for (var bb in querySnap.documents) {
            debugPrint("emrenin begenisinden fazla olan user:" +
                bb.data.toString());
          }
        }
      });
    });
  }

  void _galeriResimUpload() async {
    var resim = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _secilenResim = resim;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("emre")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(_secilenResim);

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);
  }

  void _kameraResimUpload() async {
    var resim = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _secilenResim = resim;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("hasan")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(_secilenResim);

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);
  }
}