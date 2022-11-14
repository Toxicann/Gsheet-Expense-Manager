import 'package:flutter/material.dart';

import 'widgets/top_card.dart';

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
                    children: [
                      Container(
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
                              Text("Transactions"),
                              Text("\$ 200"),
                            ],
                          ),
                        ),
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