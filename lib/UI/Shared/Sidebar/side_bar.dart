import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Providers/auth_providers.dart';
import 'package:homeservice/UI/Shared/Sidebar/options/about_us.dart';
import 'package:homeservice/UI/Startup/onboarding_screen2.dart';
import 'package:shimmer/shimmer.dart';

import '../../AddMoney/add_money_screen.dart';
import '../../Profile/edit_profile_screen.dart';
import '../images.dart';
import 'options/refer.dart';
import 'options/setting_screen.dart';
import 'options/support.dart';

class SideBar extends ConsumerWidget {
  SideBar({Key? key}) : super(key: key);

  String? name;
  String? phone;
  String? email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.watch(authenticationProvider);
    final data = ref.watch(fireBaseAuthProvider);
    var users = FirebaseFirestore.instance
        .collection('Users')
        .doc(data.currentUser!.uid)
        .snapshots();

    Future<void> logOut() async {
      await _auth.signOut();
      print('success');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnboardingScreen2()),
          (Route<dynamic> route) => false);
    }

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 10),
            Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                  //EditProfile
                },
                child: const Icon(
                  Icons.border_color_outlined,
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
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
                const SizedBox(width: 10),
                StreamBuilder<DocumentSnapshot>(
                    stream: users,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                            height: 40,
                            child: Shimmer.fromColors(
                              child: const Card(
                                color: Colors.grey,
                              ),
                              baseColor: Colors.white70,
                              highlightColor:
                                  const Color.fromARGB(255, 97, 97, 97),
                            ));
                      }
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      name = '${data['first_name']} ${data['last_name']}';
                      return Text(name!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 24.0,
                          ));
                    })
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(
                Icons.call_outlined,
                color: Color.fromRGBO(134, 131, 131, 1),
              ),
              const SizedBox(width: 5),
              StreamBuilder<DocumentSnapshot>(
                  stream: users,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(134, 131, 131, 1),
                            fontSize: 15.0,
                          ));
                    }
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    phone = data['phone'];
                    return Text('$phone',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(134, 131, 131, 1),
                          fontSize: 15.0,
                        ));
                  }),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(
                Icons.email_outlined,
                color: Color.fromRGBO(134, 131, 131, 1),
              ),
              const SizedBox(width: 5),
              StreamBuilder<DocumentSnapshot>(
                  stream: users,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(134, 131, 131, 1),
                            fontSize: 15.0,
                          ));
                    }
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    email = data['email'];
                    return Text('$email',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(134, 131, 131, 1),
                          fontSize: 15.0,
                        ));
                  }),
            ]),
            const SizedBox(height: 10),
            const Divider(color: Color.fromRGBO(229, 229, 229, 1), height: 2),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddMoneyScreen()));
                //AddMoneyScreen
              },
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card_outlined,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Payments',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReferAndEarn()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.attach_money_outlined,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Refer and Earn',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SupportUs()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.contact_support,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Support',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingScreen()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Settings',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            //SettingScreen
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.error,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('About Us',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                logOut();
              },
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color.fromRGBO(235, 50, 35, 1),
                ),
                title: Text('Log Out',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(235, 50, 35, 1),
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
