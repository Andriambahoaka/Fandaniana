import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class HeadTile extends StatelessWidget {
  HeadTile(this.date, this.total);
  final String date;
  final double total;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '',
      ),
      title: Text(
        date,
        style: kLabelTextStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '- AR $total',
        style: kLabelTextStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
