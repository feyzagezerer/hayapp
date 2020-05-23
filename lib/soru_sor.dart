import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hayapp/bildirimler.dart';

class SoruSor extends StatefulWidget {
  @override
  _SoruSorState createState() => _SoruSorState();
}

class _SoruSorState extends State<SoruSor> {
  String _adSoyad, _emailAdres,_konu,_soru;
  bool otomatikKontrol = false;
  List<String> _konular = <String>['', 'kedi', 'muhabbet kuşu', 'köpek', 'sultan papağanı','uygulama kullanımı'];
  final dbRef = FirebaseDatabase.instance.reference().child("sorular");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            accentColor: Colors.green,
            hintColor: Colors.indigo,
            errorColor: Colors.red,
            primaryColor: Colors.teal),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.save),
          ),
          //appBar: AppBar(
          //title: Text("Form ve TextFormField"),
          //),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              autovalidate: otomatikKontrol,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Adınız ve Soyadınızı yazınız.",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Ad Soyad",
                      border: OutlineInputBorder(),
                    ),
                    validator: _isimKontrol,
                    onSaved: (deger) => _adSoyad = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email adresinizi yazınız.",
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.green, width: 2)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purple, width: 2)),
                    ),
                    validator: _emailKontrol,
                    onSaved: (deger) => _emailAdres = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.check_circle),
                          hintText: 'Konu',
                          labelText: 'Konu',
                          border: OutlineInputBorder(),
                        ),
                        isEmpty: _konu == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _konu,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                               // newContact.favoriteColor = newValue;
                                _konu = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _konular.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    onSaved: (deger) => _konu = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.textsms),
                      hintText: "Sorunuzu yazınız",
                      //  labelText: "Email",
                      border: OutlineInputBorder(),
                      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.green, width: 2)),
                      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purple, width: 2)),
                    ),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 10) {
                        return "Lütfen açık bir soru giriniz.";
                      }
                    },
                    onSaved: (deger) => _soru = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton.icon(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(130.0),
                        side: BorderSide(color: Colors.white)),
                    icon: Icon(Icons.save),
                    label: Text(
                      "Gönder",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    color: Colors.blueAccent,
                    disabledColor: Colors.amber,
                    onPressed: _girisBilgileriniOnayla,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("adsoyad:$_adSoyad girilen mail: $_emailAdres konu:$_konu soru:$_soru");
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  String _isimKontrol(String isim) {
    RegExp regex = RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(isim))
      return 'Isim numara içermemeli';
    else
      return null;
  }
}
