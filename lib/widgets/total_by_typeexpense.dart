import 'package:fandaniana/widgets/total_bytype_tile.dart';
import 'package:flutter/cupertino.dart';

import '../models/total_by_typeexpense.dart';

class TotalByTypeExpenseList extends StatelessWidget {
  TotalByTypeExpenseList(this.totalByTypeList, {super.key});

  List<TotalByTypeExpense> totalByTypeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final totalByTypeExpense = totalByTypeList[index];
        return TotalByTypeExpenseTile(totalByTypeExpense);
      },
      itemCount: totalByTypeList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
