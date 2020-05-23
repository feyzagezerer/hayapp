import 'package:flutter/material.dart';
import 'package:hayapp/yardim_cagir/bilgiler.dart';
import 'package:hayapp/yardim_cagir/yardim.dart';
import 'package:hayapp/yardim_cagir/liste.dart';

class YardimCagir extends StatelessWidget{
  int gelenIndex;
  Yardim secilenSehir;
  YardimCagir(this.gelenIndex);

  @override
  Widget build(BuildContext context) {

    secilenSehir=YardimListesi.tumSehirler[gelenIndex];

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 5,
            pinned: true,
            primary: true,
            backgroundColor: Colors.orange.shade500,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle:false,
               title: Text("Listeye geri dön",style: TextStyle(fontSize: 16.0, color: Colors.white)),
              //title: Text(secilenSehir.sehirAdi+" ilinde yardım istenebilecek kişi veya kurumlar"),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade500,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenSehir.sehirBilgiler, style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
            ),
          )

        ],
      ),

    );
  }


}

