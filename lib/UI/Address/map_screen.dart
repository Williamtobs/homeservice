import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as locations;

import '../../firebase_options.dart';
import '../Shared/images.dart';
import 'add_address_screen.dart';
import 'notifier/value_notifier.dart';

//Not to use
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  locations.LocationData? currentLocation;
  var location = locations.Location();
  Completer<GoogleMapController> _controller = Completer();
  String enterLocation = 'location';

  // final LatLng _kMapCenter =
  //     LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

  String? error;

  @override
  void initState() {
    currentLocations();
    super.initState();
  }

  // LatLng getLatLng() {
  //   print(currentLocation);
  //   return LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
  // }

  Future currentLocations() async {
    try {
      currentLocation = await location.getLocation();
      locationChange.value =
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
      //setState(() {});
      print(currentLocation);
    } on PlatformException catch (e) {
      print(e.code);
      if (e.code == 'PERMISSION_DENIED') {
        setState(() {
          error = 'Permission denied';
        });
      }
      currentLocation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ValueListenableBuilder(
              valueListenable: locationChange,
              builder: (context, LatLng value, child) {
                return Center(
                  child: value == null
                      ? Container(
                          color: Colors.white,
                          child: const CircularProgressIndicator())
                      : GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: value, zoom: 11.0, tilt: 0, bearing: 0),
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                );
              },
            ),
          ),
          // Align(
          //     alignment: Alignment.topCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
          //       child: Container(
          //         width: MediaQuery.of(context).size.width,
          //         padding: const EdgeInsets.all(8),
          //         color: Colors.white,
          //         decoration:
          //             BoxDecoration(borderRadius: BorderRadius.circular(25)),
          //         child: Row(
          //           children: [
          //             GestureDetector(
          //               onTap: () async {
          //                 var places = await PlacesAutocomplete.show(
          //                     context: context,
          //                     apiKey: DefaultFirebaseOptions().placesApiKey,
          //                     mode: Mode.overlay,
          //                     strictbounds: false,
          //                     radius: 10000000,
          //                     onError: (err) {
          //                       print(err);
          //                     },
          //                     components: [Component(Component.country, 'ng')],
          //                     language: 'en',
          //                     location: Location(
          //                         lat: 7.3869305195386685,
          //                         lng: 3.90506049284018));

          //                 if (places != null) {
          //                   final GoogleMapController _controllers =
          //                       await _controller.future;
          //                   setState(() {
          //                     enterLocation = places.description.toString();
          //                   });
          //                   final plist = GoogleMapsPlaces(
          //                     apiKey: DefaultFirebaseOptions().placesApiKey,
          //                     apiHeaders:
          //                         await const GoogleApiHeaders().getHeaders(),
          //                   );
          //                   String placeid = places.placeId ?? "0";
          //                   final detail =
          //                       await plist.getDetailsByPlaceId(placeid);
          //                   final geometry = detail.result.geometry!;
          //                   final lat = geometry.location.lat;
          //                   final lang = geometry.location.lng;
          //                   var newlatlang = LatLng(lat, lang);

          //                   _controllers.animateCamera(
          //                       CameraUpdate.newCameraPosition(CameraPosition(
          //                           target: newlatlang, zoom: 17)));
          //                 }
          //               },
          //               child: ListTile(
          //                 title: Text(enterLocation),
          //                 leading: IconButton(
          //                   icon: const Icon(
          //                     Icons.search,
          //                     color: Colors.black,
          //                   ),
          //                   onPressed: () async {},
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ))
        ],
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          onPressed: () {
            _currentLocation();
            //userLocation();
          },
          child: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          heroTag: null,
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAddressScreen(
                        //newAddress: newAddress,
                        )));
          },
          child: const Icon(
            Icons.done_outline,
            color: Colors.white,
          ),
          heroTag: null,
        ),
      ]),
    );
  }

  String? newAddress;
  // void userLocation() async {
  //   final coordinates = Coordinates(lat, lng);
  //   var addresses = await Geocoder.google(DefaultFirebaseOptions().placesApiKey)
  //       .findAddressesFromCoordinates(
  //     coordinates,
  //   );
  //   setState(() {
  //     newAddress = addresses.first.addressLine;
  //   });
  // }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    locations.LocationData? currentLocation;
    var location = locations.Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation!.latitude!, currentLocation.longitude!),
        zoom: 17.0,
      ),
    ));
    final coordinates =
        Coordinates(currentLocation.latitude!, currentLocation.longitude!);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
      coordinates,
    );
    newAddress = addresses.first.addressLine;
  }
}
