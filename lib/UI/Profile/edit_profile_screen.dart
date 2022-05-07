import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Shared/images.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final TextEditingController _nameController =
      TextEditingController(text: 'John');
  final TextEditingController _lastNameController =
      TextEditingController(text: 'Doe');
  final TextEditingController _emailController =
      TextEditingController(text: 'homeservice234@gmail.com');
  final TextEditingController _phoneNumber =
      TextEditingController(text: '+2347067891234');
  final TextEditingController _houseAddress =
      TextEditingController(text: 'Bodija Ibadan, Oyo State');

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            const SizedBox(height: 20),
            Text('First name',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(229, 229, 229, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Last name',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(229, 229, 229, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Email Address',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(229, 229, 229, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Phone number',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            TextFormField(
              controller: _phoneNumber,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(229, 229, 229, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Address',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            TextFormField(
              controller: _houseAddress,
              decoration: const InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(229, 229, 229, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
