import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class HeadTile extends StatelessWidget {
  const HeadTile(this.date, this.total, {super.key});
  final String date;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: ListTile(
        leading: const Text(
          '',
        ),
        title: Text(
          date,
          style: kHeadTextStyle,
        ),
        trailing: Text(
          '- AR $total',
          style: kHeadTextStyle,
        ),
      ),
    );
  }
}
