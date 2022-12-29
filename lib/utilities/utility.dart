import 'package:fandaniana/models/daily_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Utility {
  static String getLinkImage(String imageName) => "images/$imageName.png";
  static DateFormat formatter = DateFormat('dd/MM/yyyy');

  static String getStringDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date.isSameDate(today)) {
      return "Today";
    } else if (date.isSameDate(yesterday)) {
      return "Yesterday";
    } else {
      return formatter.format(date);
    }
  }

  static String getFormattedDate(DateTime date) {
    return formatter.format(date);
  }
}

class LoadImage extends StatelessWidget {
  const LoadImage(this.imageName, {super.key});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utility.getLinkImage(imageName),
      width: 25.0,
      height: 40.0,
    );
  }
}
