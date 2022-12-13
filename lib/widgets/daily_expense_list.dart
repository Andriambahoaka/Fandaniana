import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/widgets/total_by_typeexpense.dart';
import 'package:fandaniana/widgets/head_tile.dart';
import 'package:flutter/cupertino.dart';

class DailyExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final overall = ExpenseDao.overalls[index];
          return Column(
            children: [
              HeadTile(overall.date, overall.total),
              TotalByTypeExpenseList(overall.depenseList),
            ],
          );
        },
        itemCount: ExpenseDao.overalls.length);
  }
}
