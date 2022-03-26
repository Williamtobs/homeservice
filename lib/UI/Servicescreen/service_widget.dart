import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidgets extends StatelessWidget {
  final String? icon;
  final String? name;
  final Color? mainColor;
  final Color? subColor;
  final Color? textColor;
  final bool? isSelected;
  const ServiceWidgets(
      {Key? key,
      this.icon,
      this.name,
      this.mainColor,
      this.isSelected,
      this.subColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 93,
        height: 110,
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 49,
              width: 49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: subColor,
                shape: BoxShape.circle,
              ),
              child: isSelected == false
                  ? Image.asset(
                      icon!,
                      height: 32,
                      width: 32,
                    )
                  : ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(31, 68, 141, 1), BlendMode.srcATop),
                      child: Image.asset(
                        icon!,
                        height: 32,
                        width: 32,
                      )),
            ),
            const SizedBox(height: 5),
            Text(name!,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    fontSize: 11.0))
          ],
        ),
      ),
    );
  }
}
