

import 'package:events/Commnwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';

class MapScreeen extends StatefulWidget {
  final String name;
  final double lat;
  final double long;
  MapScreeen({this.name,this.lat,this.long});
  @override
  _MapScreeenState createState() => _MapScreeenState();
}

class _MapScreeenState extends State<MapScreeen> {
  double userLat = 31.205753;
  double userLng = 29.924526;

  // double currentLat;
  // double currentLng;
  // String currentAddress;
  BitmapDescriptor myIcon;

  Set<Marker> mark = Set();
  GoogleMapController myController;
  List<Marker> markers = [];

  var location = Location();
  String tpe = 'user';

  // test() {
  //   showDialog(
  //       context: context,

  //       //  barrierDismissible: false,
  //       barrierDismissible: true, // set to false if you want to force a rating
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           content:Column(
  //             children: <Widget>[
  //               Text('ASDASDASDAS')
  //             ],
  //           )
  //         );
  //       });
  // }

  @override
  void initState() {
    // test();

    // LocationPermissions().requestPermissions().then((PermissionStatus status) {
    //   if (status == PermissionStatus.granted) {
    //     location.getLocation().then((LocationData myLocation) {
    //       setState(() {
    //         Geolocator()
    //             .placemarkFromCoordinates(
    //                 myLocation.latitude, myLocation.longitude)
    //             .then((address) {
    //           setState(() {
    //             currentAddress = address[0].name + " " + address[0].country;
    //             print("================== $currentAddress");
    //           });
    //         });
    //         currentLat = myLocation.latitude;
    //         currentLng = myLocation.longitude;

    //         InfoWindow infoWindow = InfoWindow(title: "Location");
    //         Marker marker = Marker(
    //           draggable: true,
    //           markerId: MarkerId('markers.length.toString()'),
    //           infoWindow: infoWindow,
    //           position: LatLng(myLocation.latitude, myLocation.longitude),
    //           icon: myIcon,
    //         );

    //         setState(() {
    //           mark.add(marker);
    //         });
    //       });
    //     });
    //   } else {}
    // });

    setState(() {
      markers.add(Marker(
        markerId: MarkerId(widget.name??"Event"),
        draggable: true,
        position: LatLng(
          widget.lat??userLat,
           widget.long?? userLng,
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20)),
          //         title: Text(
          //           'sksksk',
          //           style: TextStyle(
          //               fontSize: 14, color: Theme.of(context).primaryColor),
          //         ),
          //         actions: <Widget>[
          //           Center(
          //             child: FlatButton(
          //               child: Text('skkkskkskk'),
          //               onPressed: () {
          //                 Navigator.pop(context);
          //                 setState(() {
          //                   _changeMapType();
          //                 });
          //               },
          //             ),
          //           )
          //         ],
          //       );
          //     });



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
                    height: MediaQuery.of(context).size.height-200,
              width: MediaQuery.of(context).size.width,

                                      child: GoogleMap(
                      // onTap: (newLang){
                      //  setState(() {
                      //     _changeMapType();
                      //  });

                      // },
                        mapType: _defaultMapType,
                              myLocationEnabled: true,
                              onMapCreated: _onMapCreated,
                              markers: Set.from(markers),

                      initialCameraPosition: CameraPosition(
                          target: LatLng(widget.lat?? userLat,widget.long?? userLng), zoom: 15.0),
                      // onCameraMove: ((_position) => _updatePosition(_position)),
                    ),
                  ),
                  Container(
                     height: 100,
              width: MediaQuery.of(context).size.width,
              color: CommnWidget.commonColor,
child: Center(child: Text("للتبع اضغط علي ال Marker ثم اضغط علي الاتجاهات",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: "black"),)),

                  )
                ],
              ),
            ),
    );
  }

  Marker marker = Marker(
    markerId: MarkerId("1"),
  );

  // void _updatePosition(CameraPosition _position) {
  //   Position newMarkerPosition = Position(
  //       latitude: _position.target.latitude,
  //       longitude: _position.target.longitude);
  //   setState(() {
  //     updatedPosition = newMarkerPosition;
  //     marker = marker.copyWith(
  //         positionParam:
  //             LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
  //     Geolocator()
  //         .placemarkFromCoordinates(
  //             updatedPosition.latitude, updatedPosition.longitude)
  //         .then((address) {
  //       setState(() {
  //         currentLat = updatedPosition.latitude;
  //         currentLng = updatedPosition.longitude;
  //         currentAddress = address[0].name + "  " + address[0].country;
  //         print("================== $currentAddress");
  //         print(currentLat.toString() +
  //             "Update==================================>");
  //       });
  //     });
  //   });
  // }
}