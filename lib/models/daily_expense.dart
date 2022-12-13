import 'total_by_typeexpense.dart';

class DailyExpense {
  DailyExpense(this.idDailyExpense, this.date, this.total, this.depenseList);

  final int idDailyExpense;
  final String date;
  //final DateTime date;
  final double total;
  final List<TotalByTypeExpense> depenseList;
}
