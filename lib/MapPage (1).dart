import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';

import 'Commnwidget (1).dart';

class MapScreeen extends StatefulWidget {
  final String name;
  final double lat;
  final double long;
  MapScreeen({this.name, this.lat, this.long});
  @override
  _MapScreeenState createState() => _MapScreeenState();
}

class _MapScreeenState extends State<MapScreeen> {
  double userLat = 31.205753;
  double userLng = 29.924526;

  BitmapDescriptor myIcon;

  Set<Marker> mark = Set();
  GoogleMapController myController;
  List<Marker> markers = [];

  var location = Location();
  String tpe = 'user';

  @override
  void initState() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(widget.name ?? "Event"),
        draggable: true,
        position: LatLng(
          widget.lat ?? userLat,
          widget.long ?? userLng,
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          _changeMapType();
        },
        infoWindow: InfoWindow(title: widget.name ?? ""),
      ));
    });

    super.initState();
  }

  MapType _defaultMapType = MapType.normal;

  _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.satellite
          ? MapType.terrain
          : MapType.hybrid;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      myController = controller;
    });
  }

  Position updatedPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            "التتبع",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: CommnWidget.commonColor, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: CommnWidget.commonColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: userLng == null && userLat == null
          ? Center(
              child: CupertinoActivityIndicator(
              animating: true,
              radius: 15,
            ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      mapType: _defaultMapType,
                      myLocationEnabled: true,
                      onMapCreated: _onMapCreated,
                      markers: Set.from(markers),
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              widget.lat ?? userLat, widget.long ?? userLng),
                          zoom: 15.0),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: CommnWidget.commonColor,
                    child: Center(
                        child: Text(
                      "للتبع اضغط علي ال Marker ثم اضغط علي الاتجاهات",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontFamily: "black"),
                    )),
                  )
                ],
              ),
            ),
    );
  }

  Marker marker = Marker(
    markerId: MarkerId("1"),
  );
}
