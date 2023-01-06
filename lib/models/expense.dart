import 'package:fandaniana/models/type_expense.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  final int idExpense;
  @HiveField(1)
  final int idDailyExpense;
  @HiveField(2)
  final TypeExpense typeExpense;
  @HiveField(3)
  final String designation;
  @HiveField(4)
  final double unitPrice;
  @HiveField(5)
  final int amount;

  Expense(
      {required this.idExpense,
      required this.idDailyExpense,
      required this.typeExpense,
      required this.designation,
      required this.unitPrice,
      required this.amount});

  double getSubTotal() {
    return unitPrice * amount;
  }
}
