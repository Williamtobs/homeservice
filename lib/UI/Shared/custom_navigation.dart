import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Chats/chat_whatsapp.dart';
import '../History/history_screen.dart';
import '../Home/home.dart';
import 'images.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _index = 1;

  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
  }

  void changePage(int newPage) {
    setState(() {
      _index = newPage;
    });
  }

  nextFunction(int num) {
    controller?.animateToPage(num,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    changePage(num);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void pageChange(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: controller,
        children: [
          HistoryScreen(),
          HomeScreen(),
          const ChatWhatsapp(),
        ],
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  nextFunction(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history_outlined,
                      color: _index == 0
                          ? const Color.fromRGBO(31, 68, 141, 1)
                          : const Color.fromRGBO(132, 132, 132, 1),
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    Text('History',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                            fontSize: 12.0)),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: 50,
                alignment: Alignment.bottomCenter,
                child: Text('',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0)),
              ),
              GestureDetector(
                onTap: () {
                  nextFunction(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outlined,
                      color: _index == 2
                          ? const Color.fromRGBO(31, 68, 141, 1)
                          : const Color.fromRGBO(132, 132, 132, 1),
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    Text('Chat',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                            fontSize: 12.0)),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            nextFunction(1);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 60,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Image.asset(homeicon, height: 75, width: 75),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                alignment: Alignment.bottomCenter,
                child: Text('Home',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 12.0)),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

// class CustomNavigation extends StatefulWidget {
//   const CustomNavigation({Key? key}) : super(key: key);

//   @override
//   State<CustomNavigation> createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   int? currentPage = 1;
//   PageController? controller;

//   void changePage(int newPage) {
//     setState(() {
//       currentPage = newPage;
//     });
//   }

//   nextFunction(int num) {
//     controller?.animateToPage(num,
//         duration: const Duration(milliseconds: 300), curve: Curves.ease);
//     changePage(num);
//   }

//   @override
//   void initState() {
//     super.initState();

//     controller = PageController(initialPage: 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Stack(
//         children: [
//           PageView(
//             controller: controller,
//             children: [
//               HistoryScreen(),
//               HomeScreen(),
//               ChatWhatsapp(),
//             ],
//             scrollDirection: Axis.horizontal,
//             physics: const NeverScrollableScrollPhysics(),
//           ),
//           Positioned(
//               bottom: 0,
//               left: 0,
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 70,
//                 child: Stack(
//                   children: [
//                     CustomPaint(
//                       size: Size(MediaQuery.of(context).size.width, 70),
//                       painter: BNBCustomPainter(),
//                     ),
//                     Center(
//                       heightFactor: 0.7,
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           nextFunction(1);
//                         },
//                         backgroundColor: Colors.white,
//                         elevation: 0.5,
//                         child: Container(
//                           width: 60,
//                           // padding: const EdgeInsets.all(4),
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: AssetImage(homeicon), fit: BoxFit.fill),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         height: 70,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   nextFunction(0);
//                                 },
//                                 icon: Icon(
//                                   Icons.history_outlined,
//                                   color: currentPage == 0
//                                       ? const Color.fromRGBO(31, 68, 141, 1)
//                                       : const Color.fromRGBO(132, 132, 132, 1),
//                                   size: 34,
//                                 )),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.10,
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   nextFunction(2);
//                                 },
//                                 icon: Icon(
//                                   Icons.chat_bubble_outlined,
//                                   color: currentPage == 2
//                                       ? const Color.fromRGBO(31, 68, 141, 1)
//                                       : const Color.fromRGBO(132, 132, 132, 1),
//                                   size: 34,
//                                 ))
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 20);
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 25),
//         radius: const Radius.circular(10.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawShadow(path, Colors.black, 5, true);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
