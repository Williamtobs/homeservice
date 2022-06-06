import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Address/add_address_screen.dart';
import '../../../Profile/UpdateEmail/update_email_screen.dart';
import '../../../Profile/UpdatePassword/change_password.dart';
import '../../../Profile/UpdatePhone/change_phone.dart';
import '../../../Profile/edit_profile_screen.dart';
import 'widgets/list_tiles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Setting',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 16.0)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Account Setting',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
            child: const SettingListTile(
              icon: Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 14, 13, 13),
              ),
              title: 'Profile',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Contact Details',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UpdateEmail()));
            },
            child: const SettingListTile(
              icon: Icon(
                Icons.mail,
                color: Color.fromARGB(255, 14, 13, 13),
              ),
              title: 'Email Address',
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangeNumber()));
            },
            child: const SettingListTile(
              icon: Icon(
                Icons.call,
                color: Color.fromARGB(255, 14, 13, 13),
              ),
              title: 'Phone number',
            ),
          ),
          //
          const Divider(
            height: 1,
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
          const SettingListTile(
            icon: Icon(
              Icons.person_pin_circle,
              color: Color.fromARGB(255, 14, 13, 13),
            ),
            title: 'Residential Address',
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return const AddAddressScreen();
              })));
            },
            child: const SettingListTile(
              icon: Icon(
                Icons.local_shipping,
                color: Color.fromARGB(255, 14, 13, 13),
              ),
              title: 'Delivery Address',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //local_shipping
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Security Details',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            child: const SettingListTile(
              icon: Icon(
                Icons.password,
                color: Color.fromARGB(255, 14, 13, 13),
              ),
              title: 'Update Password',
            ),
          ),
        ],
      ),
    );
  }
}
