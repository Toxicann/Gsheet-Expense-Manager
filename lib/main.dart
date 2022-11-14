import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:expense_manager/helpers/enums.dart';
import 'package:flutter/material.dart';

import 'widgets/top_card/top_card.dart';
import 'widgets/transactions_list/transactions.dart';
import 'widgets/transactions_list/transactions_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Manager",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff17991b),
        ),
      ),
      home: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  RootApp({super.key});

  List<Map<String, dynamic>> transactionsItems = [
    {
      "name": "Food",
      "amount": 200.46,
      "type": ExpenditureType.expenses,
    },
    {
      "name": "Salary",
      "amount": 1234,
      "type": ExpenditureType.incomes,
    },
    {
      "name": "Games",
      "amount": 600,
      "type": ExpenditureType.expenses,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: TopCardWidget(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TransactionList(transactionsItems: transactionsItems),
              ),
            ),
            Container(
              child: const Center(
                child: Text("Footer a.k.a button"),
              ),
            ),
          ],
        ));
  }
}
