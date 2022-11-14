import 'package:flutter/material.dart';

import '../../helpers/enums.dart';
import 'expenditure_stats.dart';

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            color: Colors.grey.shade500,
            spreadRadius: 1.0,
            blurRadius: 15.0,
          ),
          const BoxShadow(
            offset: Offset(-4, -4),
            color: Colors.white,
            spreadRadius: 1.0,
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "BALANCE",
            style: TextStyle(
              letterSpacing: 5,
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$ 100000",
            style: TextStyle(
              letterSpacing: 2,
              fontSize: 40,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CardTotalExpenditureStats(
                  type: ExpenditureType.incomes,
                ),
                CardTotalExpenditureStats(
                  type: ExpenditureType.expenses,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

