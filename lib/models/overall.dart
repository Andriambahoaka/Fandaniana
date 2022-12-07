import 'package:fandaniana/models/expense_summary.dart';

import 'expense.dart';

class Overall {
  Overall(this.summary, this.depenseList);
  final ExpenseSummary summary;
  final List<Expense> depenseList;
}
