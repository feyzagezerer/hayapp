import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayapp/hayvanlar.dart';
import 'package:hayapp/kullanici.dart';
import 'package:hayapp/bottom_navigation.dart';
import 'package:hayapp/soru_sor.dart';
import 'package:hayapp/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayapp/yardim_cagir/yardim_ana.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//ANASAYFA

class HayappPage extends StatefulWidget {
  HayappPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HayappPageState();
}

class _HayappPageState extends State<HayappPage> {
  final Firestore _firestore = Firestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();
  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //return object of type Dialog
        return AlertDialog(
          title: new Text("Hesabınızı Doğrulayın"),
          content: new Text(
              "Lütfen mailinize gönderilen bağlantıya tıklayarak hesabınızı doğrulayın."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Bağlantıyı tekrar gönder"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Reddet"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Hesabınızı Doğrulayın"),
          content: new Text("Hesap doğrulama bağlantısı mailinize gönderildi"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Reddet"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dostlarımız İçin...',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Çıkış Yap',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: signOut)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 4.0, right: 10.0, bottom: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[

              Text(
                  '  Hoşgeldiniz! \n'
                      '  Artık hayvan dostlarımıza dair bilmek istedikleriniz elinizin altında!\n'
                      '  Menüden bilgi almak istediğiniz hayvanları seçebilirsiniz. \n'
                      '  "Veteriner Bul" ile veteriner bulmanızı kolaylaştırmak için yaptığımız haritamızı kullanabilirsiniz. \n'
                      '  Baş edemediğiniz veya acil durumlarda yardıma hazır bekleyen kurumlardan ve gönüllü kişilerden yardım istemekten çekinmeyin. Bu sokaktaki hayvanlarla ilgili olabileceği gibi evcil hayvanlarınızla ilgili de olabilir.\n'
                      '  Burada cevabını bulamadığınız bir sorunuz olursa, "sorun sor" ile bize istediğiniz zaman ulaşabilirsiniz! \n\n'
                      '  Uygulamızda yer alan bilgilerin yalnızca size ve hayvan dostlarımıza "yardımcı" olmak amacıyla var olduğunu ve her zaman en iyi tedavinin/bakımın doğrudan doktor muayenesi sonucu gerçekleşeceğini lütfen unutmayın. \n'
                      '  ',
                style: TextStyle(
                  color: Colors.green.shade900,  fontSize: 16,),),

              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                  child:  RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.white)),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                                Text(
                                'Başlayalım!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],

                          ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }

                    ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class HayyappPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dostlarımız İçin...',
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
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(130.0),
                          side: BorderSide(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 35.0, right: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/food.png",
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'GENEL BİLGİLER',
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
                        }

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
                        }
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/navi.png",
                              width: 100,
                              height: 100,
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
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.green,

        ),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red.shade100,),title: Text('Anasayfa', style: TextStyle(color: Colors.red.shade100),),),
          BottomNavigationBarItem(icon: Icon(Icons.map, color: Colors.red.shade100,),title: Text('Harita', style: TextStyle(color: Colors.red.shade100),),),
          BottomNavigationBarItem(icon: Icon(Icons.call, color: Colors.red.shade100,),title: Text('Yardım Çağır', style: TextStyle(color: Colors.red.shade100),),),
         // BottomNavigationBarItem(icon: Icon(Icons.help),title: Text("Soru Sor")),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer, color: Colors.red.shade100,),title: Text('Soru Sor', style: TextStyle(color: Colors.red.shade100),),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.red.shade100,),title: Text('Profil', style: TextStyle(color: Colors.red.shade100),),),


        ],
        type: BottomNavigationBarType.fixed,
        ),
      ),



    );
  }
}
*/
