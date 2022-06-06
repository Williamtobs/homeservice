import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Providers/users_data_provider.dart';
import '../Shared/app_bar.dart';
import '../Shared/snackbar.dart';
import 'search_address_screen.dart';
import 'widgets/address_tile.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final data = ref.watch(fetchUserInfo);
      return data.when(
        data: (address) {
          List<String> addressList =
              List<String>.from(address!['delivery_address'] as List);
          sharePref(addressList);
          return Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(AppBar().preferredSize.height + 5),
                child: const Appbar(
                  notification: 'My Address',
                )),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SearchAddressScreen()));
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.add_circle,
                        color: Color.fromRGBO(31, 68, 141, 1),
                      ),
                      title: Text('Add new address',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 16.0)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  addressList.length < 2 && addressList[0].length < 2
                      ? Center(
                          child: Text(
                              'No Delivery address added, add new address',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 16.0)),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: addressList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                saveDeliveryAddress(
                                    addressList[index], context);
                              },
                              child: AddressTile(
                                address: addressList[index],
                                num: '${index + 1}',
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
        error: (e, s) {
          if (kDebugMode) {
            print('Error');
          }
          return const Scaffold(
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              body: Center(
                  child:
                      Text('Can not fetch data - check internet connection')));
        },
        loading: () {
          if (kDebugMode) {
            print('loading');
          }
          return const Scaffold(
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              body: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }

  saveDeliveryAddress(String add, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deliveryAdd", add);
    CustomWidgets.buildSnackbar(context, "Delivery Address selected");
  }

  sharePref(List<String> strList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("addressList", strList);
  }
}
