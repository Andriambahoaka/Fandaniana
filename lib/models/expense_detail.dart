import 'package:fandaniana/models/type_expense.dart';

class Expense {
  Expense(this.idExpense, this.typeExpense, this.designation, this.unitPrice,
      this.amount);

  final int idExpense;
  final TypeExpense typeExpense;
  final String designation;
  final double unitPrice;
  final int amount;
}
