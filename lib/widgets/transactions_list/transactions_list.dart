import 'package:flutter/material.dart';

import 'transactions.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactionsItems,
  }) : super(key: key);

  final List<Map<String, dynamic>> transactionsItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TransactionItem(
        transactionName: transactionsItems[index]["name"],
        transactionAmount: transactionsItems[index]["amount"],
        transactionType: transactionsItems[index]["type"],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 8.0,
      ),
      itemCount: transactionsItems.length,
    );
  }
}
