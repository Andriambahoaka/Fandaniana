import 'package:fandaniana/models/type_expense.dart';

class TotalByTypeExpense {
  TotalByTypeExpense(this.idDailyExpense,this.typeExpense, this.totalPrice);
  final int idDailyExpense;
  final TypeExpense typeExpense;
  final double totalPrice;
}
