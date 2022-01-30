import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/states.dart';

class DropDownField extends StatefulWidget{

  String? currentValue;
  final String? Function(String?)? validate;
  DropDownField({Key? key, this.currentValue, this.validate}) : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validate,
      builder: (FormFieldState<String> state){
        return InputDecorator(decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          hintStyle: GoogleFonts.montserrat(
            color: const Color.fromRGBO(132, 132, 132, 1),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text('State', style: GoogleFonts.montserrat(
                color: const Color.fromRGBO(132, 132, 132, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),),
              icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black
              ),
              value: widget.currentValue,
              isDense: true,
              onChanged: (value){
                setState( (){
                  widget.currentValue = value;
                  state.didChange(value);
                });
              },
              items: states.map((String value) => DropdownMenuItem<String>(
                value: value,
                  child: Text(value, style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(132, 132, 132, 1),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),),
              )).toList(),
            )
          ),

        );
      },
    );
  }
}