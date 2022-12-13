import 'package:fandaniana/models/type_expense.dart';

class Expense {
  Expense({required this.idExpense, required this.idDailyExpense, required this.idTypeExpense,
      required this.designation, required this.unitPrice, required this.amount});

  final int idExpense;
  final int idDailyExpense;
  final int idTypeExpense;
  final String designation;
  final double unitPrice;
  final int amount;
}
