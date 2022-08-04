import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';
import './widgets/newtransaction.dart';
import './widgets/list_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green), home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transactions> transactions = [];
  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(Transactions(
          transactionId: DateTime.now().toString(),
          transactionName: title,
          amount: amount,
          date: date));
    });
  }

  void startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTansaction(_addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => startAddNewTransactions(context),
                icon: Icon(Icons.add))
          ],
          title: Text('Budget'),
        ),
        body: Column(
          children: [
            Container(
              child: Card(child: Text('Chart')),
              width: double.infinity,
            ),
            ListTransactions(transactions)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransactions(context),
          child: Icon(Icons.add),
        ));
  }
}
