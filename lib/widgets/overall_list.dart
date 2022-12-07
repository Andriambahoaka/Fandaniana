import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/widgets/expense_list.dart';
import 'package:fandaniana/widgets/head_tile.dart';
import 'package:flutter/cupertino.dart';

class OverallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final overall = ExpenseDao.overalls[index];
          return Column(
            children: [
              HeadTile(overall.summary.date, overall.summary.total),
              ExpenseList(overall.depenseList),
            ],
          );
        },
        itemCount: ExpenseDao.overalls.length);
  }
}
