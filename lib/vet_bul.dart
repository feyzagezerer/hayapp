import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';


class VetBul extends StatefulWidget {
  @override
  _VetBulState createState() => new _VetBulState();
}

class _VetBulState extends State<VetBul> {
 /* var points = <LatLng>[
    new LatLng(35.22, -101.83),
    new LatLng(32.77, -96.79),
    new LatLng(29.76, -95.36),
    new LatLng(29.42, -98.49),
    new LatLng(40.7412, 30.3477),

  ];
*/
  @override
  Widget build(BuildContext context) {
    /* return new Scaffold(
      appBar: new AppBar(title: new Text('Veteriner Bul')),
      body: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(40.7412, 30.3477),
              minZoom: 5.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:"https://api.mapbox.com/styles/v1/hyfy/ck3ydi5e6fpeh1coauo0hhir2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaHlmeSIsImEiOiJjazNtMG0yN2wxNm12M2RsY3lmeTFkMXVkIn0.Cg-21oEIgq1C1ksC229DmA",

                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoiaHlmeSIsImEiOiJjazNtMG0yN2wxNm12M2RsY3lmeTFkMXVkIn0.Cg-21oEIgq1C1ksC229DmA',
                  'id': 'mapbox.mapbox-streets-v1'
                }
            ),

            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(40.7424, 30.3260),
                  builder: (context) => new Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Marker tıklandı');
                      },
                    ),
                  ))
            ]),


          ]
      ),
    );
  */
  }
}
