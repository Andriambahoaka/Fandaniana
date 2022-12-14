import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/models/type_expense.dart';

import '../models/expense.dart';
import '../models/total_by_typeexpense.dart';
import '../widgets/type_expense_card.dart';

class ExpenseDao {
  static DailyExpense daily1 = DailyExpense(1, 'Today');
  static DailyExpense daily2 = DailyExpense(2, '12/02/2013');
  static DailyExpense daily3 = DailyExpense(3, '12/02/2013');

  static List<TypeExpense> typeExpenses = [
    TypeExpense(1, 'Food', 'food'),
    TypeExpense(2, 'Car', 'car'),
    TypeExpense(3, 'Drinks', 'drinks'),
    TypeExpense(4, 'Gift', 'gift'),
    TypeExpense(5, 'Phone', 'phone'),
    TypeExpense(6, 'House', 'house'),
  ];

  // static List<TotalByTypeExpense> totalByType = [
  //   TotalByTypeExpense(daily1, TypeExpense(1, 'Food', 'food'), 500.0),
  //   TotalByTypeExpense(daily2, TypeExpense(2, 'Car', 'car'), 600.0),
  //   TotalByTypeExpense(daily3, TypeExpense(6, 'House', 'house'), 600.0),
  // ];

  static List<DailyExpense> overalls = [daily1, daily2, daily3];

  static List<Expense> expenses = [
    Expense(
        idExpense: 1,
        idDailyExpense: 1,
        typeExpense: TypeExpense(1, 'Food', 'food'),
        designation: "Nem",
        unitPrice: 300.0,
        amount: 3),
    Expense(
        idExpense: 1,
        idDailyExpense: 1,
        typeExpense: TypeExpense(1, 'Food', 'food'),
        designation: "Sandwich",
        unitPrice: 1000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        typeExpense: TypeExpense(2, 'Car', 'car'),
        designation: "Gasoil",
        unitPrice: 15000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        typeExpense: TypeExpense(2, 'Car', 'car'),
        designation: "Gasoil",
        unitPrice: 100.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        typeExpense: TypeExpense(6, 'House', 'house'),
        designation: "Jirama",
        unitPrice: 20000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        typeExpense: TypeExpense(6, 'House', 'house'),
        designation: "Jirama",
        unitPrice: 20000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        typeExpense: TypeExpense(6, 'House', 'house'),
        designation: "Jirama",
        unitPrice: 20000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 3,
        typeExpense: TypeExpense(1, 'Food', 'food'),
        designation: "Karoty",
        unitPrice: 300.0,
        amount: 3),
    Expense(
        idExpense: 1,
        idDailyExpense: 3,
        typeExpense: TypeExpense(1, 'House', 'house'),
        designation: "Mixeur",
        unitPrice: 10000.0,
        amount: 1),
  ];

  static List<TypeExpenseCard> getListExpenseCard() {
    List<TypeExpenseCard> result = [];
    typeExpenses.forEach((element) {
      result.add(TypeExpenseCard(element));
    });
    return result;
  }

  static List<Expense> getListDailyExpenseByType(
      int idDaily, TypeExpense typeExpense) {
    return expenses
        .where((element) =>
            element.idDailyExpense == idDaily &&
            element.typeExpense.idTypeExpense == typeExpense.idTypeExpense)
        .toList();
  }

  static int get typeExpenseCount {
    return typeExpenses.length;
  }
}
