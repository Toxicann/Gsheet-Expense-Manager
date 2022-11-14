import 'dart:async';

import 'package:flutter/material.dart';

import 'google_sheets_api.dart';
import 'widgets/top_card/top_card.dart';
import 'widgets/transactions_list/transactions_list.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool timerHasStarted = false;
  void _startLoading() {
    timerHasStarted = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      if (GoogleSheetsApi.isLoading == false) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSheetsApi.isLoading && !timerHasStarted) {
      _startLoading();
    }
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(20),
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
            FloatingActionButton(onPressed: () {

            })
          ],
        ));
  }
}
