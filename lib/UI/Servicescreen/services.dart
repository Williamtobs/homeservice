import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/Constants/home_services.dart';
import 'package:homeservice/UI/Servicescreen/service_widget.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';

class BookService extends StatelessWidget{
  const BookService({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(notification: 'Barbing',)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(homeService.length, (index) => ServiceWidgets(icon: homeService[index].icon, name: homeService[index].name,)),
            ))
          ],
        ),
      ),
    );
  }

}