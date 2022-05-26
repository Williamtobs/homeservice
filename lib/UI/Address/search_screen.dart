import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: PlacesSearch(
            //       onSelected: (place) {
            //         print(place);
            //       },
            //     )),
            // child: TextFormField(
            //   decoration: InputDecoration(
            //       labelText: 'Bodija',
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(16))),
            // )
          ],
        ),
      ),
    );
  }
}
