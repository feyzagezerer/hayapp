import 'package:flutter/material.dart';
import 'package:hayapp/yardim_cagir/yardim.dart';
import 'package:hayapp/yardim_cagir/bilgiler.dart';
import 'package:hayapp/yardim_cagir/yardimcagir.dart';

class YardimListesi extends StatelessWidget {


  static List<Yardim> tumSehirler;

  @override
  Widget build(BuildContext context) {
    tumSehirler = veriKaynaginiHazirla();

    return Scaffold(

      body: listeyiHazirla(),
    );
  }

  List<Yardim> veriKaynaginiHazirla() {
    List<Yardim> sehirler = [];
    for (int i = 0; i < 4; i++) {

      Yardim eklenecekSehir = Yardim(
        Bilgiler.SEHIRLER[i], Bilgiler.ICERIK[i], );
      sehirler.add(eklenecekSehir);
    }
    return sehirler;
  }

  Widget listeyiHazirla() {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return tekSatirSehir(context, index);
    },
      itemCount: tumSehirler.length,
    );
  }

  Widget tekSatirSehir(BuildContext context, int index) {
    Yardim oAnListeyeEklenecekSehir = tumSehirler[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: ()=> Navigator.pushNamed(context, "/yardimCagir/$index") ,

          title: Text(
            oAnListeyeEklenecekSehir.sehirAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.orange.shade600),
          ),

        ),
      ),
    );
  }
}
