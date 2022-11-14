import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';

import '../../helpers/enums.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactionName,
    required this.transactionAmount,
    required this.transactionType,
  }) : super(key: key);

  final String transactionName;
  final double transactionAmount;
  final ExpenditureType transactionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    AntIcons.dollarCircleFilled,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
                Text(
                  transactionName,
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            Text(
              "${transactionType == ExpenditureType.incomes ? "+" : "-"}\$$transactionAmount",
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: transactionType == ExpenditureType.incomes
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
