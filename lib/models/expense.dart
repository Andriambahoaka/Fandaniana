import 'package:fandaniana/models/type_expense.dart';

class Expense {
  Expense(
      {required this.idExpense,
      required this.idDailyExpense,
      required this.typeExpense,
      required this.designation,
      required this.unitPrice,
      required this.amount});

  final int idExpense;
  final int idDailyExpense;
  final TypeExpense typeExpense;
  final String designation;
  final double unitPrice;
  final int amount;

  double getSubTotal() {
    return unitPrice * amount;
  }
}
