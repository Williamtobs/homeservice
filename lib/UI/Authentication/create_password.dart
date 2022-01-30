import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/Formfield/create_passwordfield.dart';

class  CreatePassword extends StatefulWidget{
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool visibility = true;
  bool visibility2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create new password', style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 26.0
          )),
          const SizedBox(height: 10),
          Text('Your new password must be different '
              'from previously used password.', style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(78, 78, 78, 1),
              fontSize: 15.0
          )),
          const SizedBox(height: 10),
          PasswordField(suffixIcon: IconButton(
            icon: visibility ? const Icon(
              Icons.visibility_outlined,
            ) : const Icon( Icons.visibility_off_outlined,),
            onPressed: () { setState(() {
              visibility = !visibility;
            }); },
          ), obscureText: visibility, hintText: 'New Password',
          ),
          const SizedBox(height: 10),
          PasswordField(suffixIcon: IconButton(
            icon: visibility2 ? const Icon(
              Icons.visibility_outlined,
            ) : const Icon( Icons.visibility_off_outlined,),
            onPressed: () { setState(() {
              visibility2 = !visibility2;
            }); },
          ), obscureText: visibility2, hintText: 'Confirm Password',
           ),
          const SizedBox(height: 10),
          Container(
            width: 334,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: const Color.fromRGBO(31, 68, 141, 1)
            ),
            child: ElevatedButton(onPressed:(){}, style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                minimumSize: const Size.fromHeight(45),
                elevation: 0,
                primary: const Color.fromRGBO(31, 68, 141, 1)
            ),
              child:
              Text('Reset Password', style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 19.0,
              )),
            ),
          ),
        ],
        )
      )
    );
  }
}