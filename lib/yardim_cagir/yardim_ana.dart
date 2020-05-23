import 'package:flutter/material.dart';
import 'package:hayapp/yardim_cagir/bilgiler.dart';
import 'package:hayapp/yardim_cagir/yardim.dart';
import 'package:hayapp/yardim_cagir/liste.dart';
import 'package:hayapp/yardim_cagir/yardimcagir.dart';


class YardimAna extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Yardım isteyebileceğin bazı kişi ve kurumlar",
      debugShowCheckedModeBanner: false,

      initialRoute: "/yardimListesi",

      routes: {
        "/": (context) => YardimListesi(),
        "/yardimListesi": (context) => YardimListesi(),

      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1]=='yardimCagir') {
          return MaterialPageRoute(builder: (context)=> YardimCagir(int.parse(pathElemanlari[2])));
        }

        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

    );
  }


}