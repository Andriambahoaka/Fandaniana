import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/models/expense.dart';
import 'package:fandaniana/utilities/constants.dart';
import 'package:fandaniana/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/type_expense.dart';
import '../widgets/type_expense_card.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  List<TypeExpense> typeExpenses =
      List<TypeExpense>.from(ExpenseDao.typeExpenses);
  TypeExpense? selectedTypeExpense;
  String designation = " ";
  double price = 0.0;
  int amount = 0;
  int selectedIndex = -1;

  ExpenseDao expenseDao = ExpenseDao();

  final _formKey = GlobalKey<FormState>();

  List<TypeExpenseCard> getListExpenseCard() {
    List<TypeExpenseCard> result = [];
    for (var element in typeExpenses) {
      result.add(TypeExpenseCard(
        element,
        onTap: () {
          selectedTypeExpense = element;
          setState(() {
            selectedIndex = typeExpenses.indexOf(element);
            ExpenseDao().selectType(element);
          });
        },
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Type : ',
                style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: getListExpenseCard(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Designation : ',
                style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: (selectedTypeExpense == null)
                      ? const LoadImage("other")
                      : LoadImage(selectedTypeExpense!.image),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                ),
              ),
              autofocus: true,
              onChanged: (value) {
                designation = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the designation';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 240.0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Price : ',
                          style: kHeadTextStyle.copyWith(
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.blueGrey),
                          ),
                        ),
                        onChanged: (value) {
                          price = double.parse(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the price';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Amount : ',
                          style: kHeadTextStyle.copyWith(
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.blueGrey),
                          ),
                        ),
                        onChanged: (value) {
                          amount = int.parse(value);
                          print(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the amount';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /*  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );*/

                  print(selectedTypeExpense?.idTypeExpense);
                  selectedTypeExpense?.isSelected = false;
                  print(designation);
                  print(price);
                  print(amount);

                  int idExpense = expenseDao.getLastIdExpenses() + 1;
                  Expense expense = Expense(
                      idExpense: idExpense,
                      idDailyExpense: expenseDao.getLastIdExpenses(),
                      typeExpense: selectedTypeExpense!,
                      designation: designation,
                      unitPrice: price,
                      amount: amount);

                  expenseDao.addNewExpense(expense);
                  Provider.of<ExpenseDao>(context, listen: false)
                      .addNewExpense(expense);

                  Navigator.pop(context);
                }
              },
              label: Text(
                'Add',
                style: kHeadTextStyle.copyWith(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal, // Text Color
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class NumberTextField extends StatelessWidget {
  const NumberTextField(this.width, this.label,
      {super.key, required this.onChanged});

  final double width;
  final String label;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$label : ',
              style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueGrey),
              ),
            ),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
