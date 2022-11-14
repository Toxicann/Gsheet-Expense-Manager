import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:expense_manager/helpers/enums.dart';
import 'package:flutter/material.dart';

import 'widgets/top_card/top_card.dart';
import 'widgets/transactions_list/transactions.dart';

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
      home: const RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

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
              child: Container(
                // color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: const [
                      TransactionItem(
                        transactionName: "Transactions",
                        transactionAmount: "200",
                        transactionType: ExpenditureType.incomes,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TransactionItem(
                        transactionName: "Food",
                        transactionAmount: "500",
                        transactionType: ExpenditureType.expenses,
                      )
                    ],
                  ),
                ),
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
