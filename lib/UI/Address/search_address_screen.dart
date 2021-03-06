import 'package:flutter/material.dart';
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Database/database.dart';
import '../../Providers/auth_providers.dart';
import '../../firebase_options.dart';

class SearchAddressScreen extends StatefulWidget {
  const SearchAddressScreen({Key? key}) : super(key: key);

  @override
  State<SearchAddressScreen> createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String>? addressList;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      sharePref();
      final data = ref.read(fireBaseAuthProvider);
      void onPressed() {
        if (_controller.text.length > 5) {
          saveInfo(data.currentUser!.uid);
        }
      }

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onTap: () async {
                        await Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return MapBoxAutoCompleteWidget(
                            apiKey: DefaultFirebaseOptions().mapBoxApi,
                            hint: "Enter address",
                            onSelect: (place) {
                              _controller.text = place.placeName!;
                            },
                            limit: 10,
                            location: Location(lat: 7.41097, lng: 3.91391),
                            country: "NG",
                          );
                        })));
                      })),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  //width: 80,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                  child: TextButton(
                      onPressed: () {
                        onPressed();
                      },
                      child: Text('Add Address',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 12.0))),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  var setup = Database();
  saveInfo(var uid) async {
    if (addressList![0].length < 2) {
      addressList!.removeAt(0);
      if (addressList!.contains(_controller.text)) {
        final snackBar = SnackBar(
            backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
            content: Text('Address Already exist',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14.0)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        addressList!.add(_controller.text);
        await setup.updateServiceAddress(
            uid: uid, addressList: addressList!, context: context);
      }
    } else {
      addressList!.add(_controller.text);
      print(addressList);
      await setup.updateServiceAddress(
          uid: uid, addressList: addressList!, context: context);
    }
  }

  sharePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    addressList = prefs.getStringList("addressList");
  }
}
