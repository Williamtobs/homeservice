import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_webservice/places.dart';

import '../../firebase_options.dart';

class ChangeAddress extends StatefulWidget {
  String? address;
  ChangeAddress({Key? key, this.address}) : super(key: key);

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  TextEditingController _place = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 216, 216),
      body: Stack(children: [
        const SizedBox(
          height: 50,
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                //height: 80,
                padding: const EdgeInsets.all(15),
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var places = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: DefaultFirebaseOptions().placesApiKey,
                            mode: Mode.overlay,
                            strictbounds: false,
                            radius: 10000000,
                            onError: (err) {
                              print(err);
                            },
                            components: [Component(Component.country, 'ng')],
                            language: 'en',
                            location: Location(
                                lat: 7.3869305195386685,
                                lng: 3.90506049284018));

                        if (places != null) {
                          setState(() {
                            widget.address = places.description.toString();
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(widget.address!),
                          leading: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () async {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}

// Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ChangeAddress(
//                                                 address: address,
//                                               )),
//                                       ModalRoute.withName('/'));