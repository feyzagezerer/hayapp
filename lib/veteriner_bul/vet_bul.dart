import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hayapp/veteriner_bul/animate_camera.dart';
import 'package:hayapp/veteriner_bul/map_click.dart';
import 'package:hayapp/veteriner_bul/map_coordinates.dart';
import 'package:hayapp/veteriner_bul/map_ui.dart';
import 'package:hayapp/veteriner_bul/marker_icons.dart';
import 'package:hayapp/veteriner_bul/move_camera.dart';
import 'package:hayapp/veteriner_bul/padding.dart';
import 'package:hayapp/veteriner_bul/page.dart';
import 'package:hayapp/veteriner_bul/place_circle.dart';
import 'package:hayapp/veteriner_bul/place_marker.dart';
import 'package:hayapp/veteriner_bul/place_polygon.dart';
import 'package:hayapp/veteriner_bul/place_polyline.dart';
import 'package:hayapp/veteriner_bul/scrolling_map.dart';
import 'package:hayapp/veteriner_bul/snapshot.dart';


final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
  MapUiPage(),
  MapCoordinatesPage(),
  MapClickPage(),
  AnimateCameraPage(),
  MoveCameraPage(),
  PlaceMarkerPage(),
  MarkerIconsPage(),
  ScrollingMapPage(),
  PlacePolylinePage(),
  PlacePolygonPage(),
  PlaceCirclePage(),
  PaddingPage(),
  SnapshotPage(),
];

class VetBul extends StatelessWidget{
  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(page.title)),
          body: page,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: const Text('GoogleMaps')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}
