import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Profile/widgets/profile_textfield.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';

class Utility extends ConsumerStatefulWidget {
  const Utility({Key? key}) : super(key: key);

  @override
  _UtilityState createState() => _UtilityState();
}

class _UtilityState extends ConsumerState<Utility> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  final SingleValueDropDownController? _controller =
      SingleValueDropDownController();
  final SingleValueDropDownController? _typecontroller =
      SingleValueDropDownController();
  String? _selectedValue;

  String? _selectedType;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  List<DropDownValueModel> list = const [
    DropDownValueModel(
      name: 'Nepa',
      value: 'Nepa',
    ),
    DropDownValueModel(
      name: 'PHCN',
      value: 'PHCN',
    ),
    DropDownValueModel(
      name: 'IKEDC',
      value: 'IKEDC',
    ),
  ];

  List<DropDownValueModel> typeList = const [
    DropDownValueModel(
      name: 'Prepaid',
      value: 'Prepaid',
    ),
    DropDownValueModel(
      name: 'Postpaid',
      value: 'Postpaid',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(
            notification: 'Electricity',
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Service Provider',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                    DropDownTextField(
                      clearOption: false,
                      textFieldFocusNode: textFieldFocusNode,
                      searchFocusNode: searchFocusNode,
                      dropDownItemCount: 20,
                      singleController: _controller,
                      searchShowCursor: false,
                      textFieldDecoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      enableSearch: true,
                      searchKeyboardType: TextInputType.text,
                      dropDownList: list,
                      onChanged: (val) {
                        setState(() {
                          _selectedValue = val.value.toString();
                          print(_selectedValue);
                        });
                      },
                      //textFieldDecoration
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Type',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                    DropDownTextField(
                      clearOption: false,
                      textFieldFocusNode: textFieldFocusNode,
                      searchFocusNode: searchFocusNode,
                      singleController: _typecontroller,
                      searchShowCursor: false,
                      textFieldDecoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      enableSearch: true,
                      searchKeyboardType: TextInputType.text,
                      dropDownList: typeList,
                      onChanged: (val) {
                        setState(() {
                          _selectedType = val.value.toString();
                        });
                      },
                      //textFieldDecoration
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Customer ID',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                    SizedBox(
                      height: 60,
                      child: UtilityTextField(
                        controller: _idController,
                        enable: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Amount',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                    SizedBox(
                      height: 60,
                      child: UtilityTextField(
                        controller: _amountController,
                        enable: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(31, 68, 141, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class UtilityTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? color;
  final bool? enable;
  const UtilityTextField(
      {Key? key, required this.controller, this.color, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable ?? false,
      controller: controller,
      decoration: const InputDecoration(
        // filled: true,
        // fillColor: color ?? const Color.fromRGBO(229, 229, 229, 1),
        enabledBorder: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
      ),
    );
  }
}
