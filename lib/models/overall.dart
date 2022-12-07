import 'package:fandaniana/models/expense_summary.dart';

import 'depense.dart';

class Overall {
  Overall(this.summary, this.depenseList);
  final ExpenseSummary summary;
  final List<Depense> depenseList;
}
