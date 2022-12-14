import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/models/type_expense.dart';

class TotalByTypeExpense {

  TotalByTypeExpense(this.dailyExpense,this.typeExpense, this.totalPrice);

  final DailyExpense dailyExpense;
  final TypeExpense typeExpense;
  final double totalPrice;
}
