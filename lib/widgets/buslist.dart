import 'package:flutter/material.dart';

class BusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: ListView.builder(itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              child: ListTile(),
            );
          }),
        )
      ],
    );
  }
}
