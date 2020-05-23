import 'package:flutter/material.dart';


class Kopekyavru extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[

          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/mey.png"),
              centerTitle: true,
              title: Text(
                  "Yavru köpek"),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                  child: Text(
                    "\n"
                        "  Veterinerlerin önerisi köpeklere yedikleri mamanın %15 veya 20’sinden fazla meyve yedirmemek yönünde. Bu oran köpeğin tükettiği tüm mama miktarına göre hesaplanmalı. "
                        " Ve bir köpeğin beslenmesinde çok fazla meyve yer alması onun sindirim sisteminin çökmesine ve sonuçta ölümüne sebep olabilir."
                        " Bizim tükettiğimiz bazı meyveler de köpekler için son derece zehirli olabilir. Bu sebeple, köpeğinize meyve vermeden önce hangi meyvelerin tavsiye edildiğini öğrenmelisiniz. Onlar için zehirli olan bu meyvelerden az miktarda bile yemeleri sağlıklarına ciddi zararlar verebilir."
                        "\n"
                        "   Sağlıklı meyveler ise onlar için faydalıdır. "
                        " En baştan itibaren, arada bir meyve yedirmek köpeğin sürekli aynı şeyleri yemekten sıkılmamasını sağlar. "
                        " Bu meyveler aynı zamanda köpeğe lif, antioksidan ve hastalıklardan koruyucu ve kabızlık önleyici başka besinler de sağlar."
                        "\n"
                        " 1. Elma yüksek miktarda C vitamini ve kalsiyum içerir. Bu besinler ise köpeğinizin yaşayabileceği mide ve bağırsak problemlerini önlemeye yardımcı olur."
                        "\n"
                        " 2. Kızılcık meyvesi C vitamini, lifler ve kalp hastalıklarından koruyan antioksidanlar içerir. Hayvanlara zararlı olduğu için çekirdekleri çıkarılmalıdır."
                        "\n"
                        " 3. Trabzon hurması köpekler için önerilen en önemli meyvelerden biri. İçeriği köpeklerin bağışıklık sistemini güçlendirir, dejeneratif hastalıklar ve tümörlerden korur."
                        "\n"
                        " 4. Muz kazlıktan muzdarip köpekler için ideal bir çözüm. Ancak, çok fazla yenildiğinde sindirim sistemi üzerinde yan etkileri olabileceği için dikkatli olmalısınız."
                        "\n"
                        " 5. Karpuz yaz aylarının ideal meyvesi. Yüksek oranda su içerdiği için karpuz köpeğinizin su ihtiyacını karşılamaya yardımcı olur. Daha da ötesi, doğal bir idrar sökücü olması sebebiyle obezlikten muzdarip hayvanların beslenme programında mutlaka yer almalıdır. Ancak titiz bir şekilde çekirdeklerini çıkarmalısınız."
                        "\n"
                        " Üzüm ve kuru üzüm, kabuklu yemişler, avokado köpekler için zehirli meyvelerdir.  ",
                    style: TextStyle(color: Colors.black, fontSize: 24),)
              ),
            ),
          )
        ],

      ),


    );
  }
}