import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
        title: "Flutter Courses",
        amount: 19,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Ciné",
        amount: 11,
        date: DateTime.now(),
        category: Category.leisure),
  ];

 void  _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (ctx) => const NewExpense(),);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('the chart'),
          Expanded(
            child: ExpensesList(expenses: _registerdExpenses),
          ),
        ],
      ),
    );
  }
}
