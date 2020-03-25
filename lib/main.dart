import 'package:flutter/material.dart';
import 'package:hayapp/ui/hayapp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayapp/sultan_papagani.dart';
import 'package:hayapp/muhabbet_kusu.dart';
import 'package:hayapp/kullanici.dart';
import 'package:hayapp/kullanici_islemleri.dart';
import 'package:hayapp/yonlendirme.dart';

void main() {
  runApp(Hayapp());
}

/*void main() {
  runApp(MaterialApp(
    title: 'Dostunuz İçin Gereken Her Şey',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: RegisterPage(),
  ));
}*/
class Hayapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dostunuz İçin Gereken Her Şey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RootPage(auth: new Auth()),
    );

  }


}
/*
class HayappPage extends StatefulWidget {
  HayappPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HayappPageState createState() => _HayappPageState();
}

class _HayappPageState extends State<HayappPage> {
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dostunuz İçin Gereken Her Şey'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(130.0),
                  side: BorderSide(color: Colors.white)),
              child: const Text(
                'Kaydol',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(130.0),
                  side: BorderSide(color: Colors.white)),
              child: const Text(
                'Giriş/Çıkış Yap',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
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

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
*/