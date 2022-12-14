import 'dart:developer';

import 'package:expense_manager/helpers/enums.dart';
import 'package:gsheets/gsheets.dart';

import 'env.dart';

class GoogleSheetsApi {
  final gsheets = GSheets(GSHEET_CREDENTIALS);

  static Worksheet? _workSheet;
  static List<Map<String, dynamic>> transactions = [];

  static int totalRows = 0;
  static double income = 0;
  static double expenses = 0;
  static bool isLoading = true;

  Future init() async {
    final ss = await gsheets.spreadsheet(GSHEET_ID);
    _workSheet = ss.worksheetByTitle('Sheet1');
    fetchData();
  }

  static Future fetchData() async {
    if (_workSheet == null) return;

    final transactionName = await _workSheet!.values.column(1, fromRow: 2);
    final transactionAmt = await _workSheet!.values.column(2, fromRow: 2);
    final transactionType = await _workSheet!.values.column(3, fromRow: 2);

    totalRows = transactionName.length;

    for (int rows = 0; rows < totalRows; rows++) {
      transactions.add({
        "name": transactionName[rows],
        "amount": transactionAmt[rows],
        "type": transactionType[rows] == 'Expense'
            ? ExpenditureType.expenses
            : ExpenditureType.incomes,
      });
    }
    countIncome();
    countExpense();
    isLoading = false;
    log("transactions: $totalRows");
    log("transactions: $transactions");
  }

  static countIncome() {
    income = 0;
    for (var element in transactions) {
      if (element["type"] == ExpenditureType.incomes) {
        income += double.parse(element["amount"]);
      }
    }
    log("totalIncome: $income");
  }

  static countExpense() {
    expenses = 0;
    for (var element in transactions) {
      if (element["type"] == ExpenditureType.expenses) {
        expenses += double.parse(element["amount"]);
      }
    }
    log("totalIncome: $expenses");
  }

  static Future newTransactions(
      {required type, required amount, required isIncome}) async {
    transactions.add({
      "name": type,
      "amount": amount,
      "type": !isIncome ? ExpenditureType.expenses : ExpenditureType.incomes,
    });
    countIncome();
    countExpense();
    totalRows++;
    await _workSheet!.values.appendRow(
      [type, amount, isIncome ? "Income" : "Expense"],
    );
  }
}
