import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Providers/users_data_provider.dart';
import '../Shared/images.dart';
import 'widgets/profile_textfield.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  TextEditingController? _nameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneNumber;
  TextEditingController? _houseAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text('Profile',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 18.0)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: Text('Done',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14.0)),
            ),
          )
        ],
      ),
      body: Consumer(builder: (
        context,
        watch,
        child,
      ) {
        final data = watch.watch(fetchUserInfo);
        return data.when(
          data: (profile) {
            _nameController =
                TextEditingController(text: profile!['first_name']);
            _lastNameController =
                TextEditingController(text: profile['last_name']);
            _emailController = TextEditingController(text: profile['email']);
            _phoneNumber = TextEditingController(text: profile['phone']);
            _houseAddress =
                TextEditingController(text: profile['house_address']);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(360),
                              child: Image.asset(
                                avatar,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text('Change profile picture',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16.0)),
                      ),
                      const SizedBox(height: 10),
                      Text('First name',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14.0)),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 60,
                        child: ProfileTextField(
                          controller: _nameController!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Last name',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14.0)),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 60,
                        child: ProfileTextField(
                          controller: _lastNameController!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Email Address',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14.0)),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 60,
                        child: ProfileTextField(
                          controller: _emailController!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Phone number',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14.0)),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 60,
                        child: ProfileTextField(
                          controller: _phoneNumber!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Address',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14.0)),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 60,
                        child: ProfileTextField(
                          controller: _houseAddress!,
                        ),
                      ),
                    ]),
              ),
            );
          },
          error: (e, s) {
            if (kDebugMode) {
              print('Error');
            }
            return const Center(
                child: Text('Can not fetch data - check internet connection'));
          },
          loading: () {
            if (kDebugMode) {
              print('loading');
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
