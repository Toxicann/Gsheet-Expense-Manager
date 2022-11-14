import 'package:expense_manager/helpers/enums.dart';
import 'package:flutter/material.dart';

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
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: cardExpenditureTypeIcon(ExpenditureType.incomes),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Income",
                          style: cardExpenditureTypeStyle(),
                        ),
                        Text(
                          "\$200",
                          style: cardExpenditureAmountStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: cardExpenditureTypeIcon(ExpenditureType.expenses),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expenses",
                          style: cardExpenditureTypeStyle(),
                        ),
                        Text(
                          "\$200",
                          style: cardExpenditureAmountStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  CircleAvatar cardExpenditureTypeIcon(ExpenditureType type) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      foregroundColor:
          type == ExpenditureType.incomes ? Colors.green : Colors.red,
      child: Icon(type == ExpenditureType.incomes
          ? Icons.arrow_upward
          : Icons.arrow_downward),
    );
  }

  TextStyle cardExpenditureAmountStyle() {
    return TextStyle(
      color: Colors.grey.shade800,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    );
  }

  TextStyle cardExpenditureTypeStyle() {
    return TextStyle(
      color: Colors.grey.shade600,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
    );
  }
}
