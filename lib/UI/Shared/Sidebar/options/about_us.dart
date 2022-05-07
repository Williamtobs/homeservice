import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_bar.dart';
import '../../images.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(
            notification: 'About Us',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Home Service App',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18.0),
                ),
                const SizedBox(height: 20.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      aboutUs,
                    )),
                const SizedBox(height: 20.0),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  child: Column(children: [
                    Text(
                      'Get chores done by Home Service App',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi '
                      'fringilla dictum faucibus. Mauris malesuada vulputate eros sit '
                      'amet commodo. Etiam feugiat ipsum lacinia mollis placerat. Sed '
                      'justo nulla, commodo tristique aliquam sed, sodales et lorem. '
                      'Pellentesque posuere ligula vel felis auctor scelerisque. '
                      'Suspendisse tempus efficitur felis. Aliquam sit amet arcu eu '
                      'eros bibendum egestas.\n'
                      'Maecenas consequat ligula quis tortor fermentum rutrum. Sed '
                      'sodales sit amet tortor ut convallis. Praesent id augue non '
                      'nulla tincidunt vehicula. Morbi volutpat sollicitudin quam ac '
                      'cursus. Proin non volutpat dolor. Curabitur et tellus eros. '
                      'Integer imperdiet porttitor nulla, facilisis porta turpis '
                      'cursus a. Aliquam luctus ullamcorper scelerisque. Fusce vitae '
                      'arcu porta orci aliquet consequat.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 12.0),
                    ),
                  ]),
                ),
                const SizedBox(height: 20.0),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  child: Column(children: [
                    Text(
                      'Other Services Render',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi '
                      'fringilla dictum faucibus. Mauris malesuada vulputate eros sit '
                      'amet commodo. Etiam feugiat ipsum lacinia mollis placerat. Sed '
                      'justo nulla, commodo tristique aliquam sed, sodales et lorem. '
                      'Pellentesque posuere ligula vel felis auctor scelerisque. '
                      'Suspendisse tempus efficitur felis. Aliquam sit amet arcu eu '
                      'eros bibendum egestas.\n',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 12.0),
                    ),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
