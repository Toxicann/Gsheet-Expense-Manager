import 'package:flutter/material.dart';

import '../../helpers/enums.dart';

class CardTotalExpenditureStats extends StatelessWidget {
  const CardTotalExpenditureStats({
    Key? key,
    required this.type,
    this.totalTransaction,
  }) : super(key: key);

  final String? totalTransaction;
  final ExpenditureType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor:
                type == ExpenditureType.incomes ? Colors.green : Colors.red,
            child: Icon(type == ExpenditureType.incomes
                ? Icons.arrow_upward
                : Icons.arrow_downward),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type == ExpenditureType.incomes ? "Income" : "Expenses",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            Text(
              totalTransaction ?? "\$200",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
