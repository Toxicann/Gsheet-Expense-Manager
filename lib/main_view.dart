import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'google_sheets_api.dart';
import 'widgets/my_textfield.dart';
import 'widgets/top_card/top_card.dart';
import 'widgets/transactions_list/transactions_list.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isIncome = false;
  bool timerHasStarted = false;
  // bool _autoValidatemode = false;
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  void _startLoading() {
    timerHasStarted = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      if (GoogleSheetsApi.isLoading == false) {
        timer.cancel();
      }
    });
  }

  reset() {
    nameController.clear();
    amountController.clear();
    isIncome = false;
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSheetsApi.isLoading && !timerHasStarted) {
      _startLoading();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TopCardWidget(),
            ),
            if (!GoogleSheetsApi.isLoading)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TransactionList(
                    transactionsItems: GoogleSheetsApi.transactions,
                  ),
                ),
              ),
            if (GoogleSheetsApi.isLoading) ...<Widget>[
              const Spacer(),
              const CircularProgressIndicator(),
              const Spacer(),
            ],
            Container(
              child: const Center(
                child: Text("Footer a.k.a button"),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _newTransaction(context, fromKey);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Future<dynamic> _newTransaction(BuildContext context, formKey) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            var switchTextStyle = TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            );
            return AlertDialog(
              title: const Center(
                child: Text(
                  "NEW TRANSACTION",
                  style: TextStyle(
                    letterSpacing: 1.25,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(0),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Expense",
                          style: switchTextStyle,
                        ),
                        Switch(
                          value: isIncome,
                          onChanged: (value) {
                            setState(() {
                              isIncome = value;
                            });
                          },
                        ),
                        Text(
                          "Income",
                          style: switchTextStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MyTextField(
                        textController: nameController,
                        validator: (value) =>
                            value!.isEmpty ? "Field required" : null,
                        // autoValidateMode: _autoValidatemode,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MyTextField(
                        textController: amountController,
                        validator: (value) =>
                            value!.isEmpty ? "Field required" : null,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      
                      reset();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Accept"),
                ),
                TextButton(
                  onPressed: () {
                    reset();
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
