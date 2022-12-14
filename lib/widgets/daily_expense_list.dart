import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/widgets/total_by_typeexpense.dart';
import 'package:fandaniana/widgets/head_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DailyExpenseList extends StatelessWidget {
  const DailyExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDao>(
      builder: (context, expenseDao, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final overall = expenseDao.overalls[index];
              return Column(
                children: [
                  HeadTile(overall.getDateString(), overall.getDailyTotal()),
                  TotalByTypeExpenseList(overall.getListTotalByTypeExpense()),
                ],
              );
            },
            itemCount: expenseDao.overalls.length);
      },
    );
  }
}
