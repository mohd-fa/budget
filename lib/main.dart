import 'package:budget/widgets/chart.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/newtransaction.dart';
import './widgets/list_transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green), home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transactions> _transactions = [];
  List<Transactions> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transactions(
          transactionId: DateTime.now().toString(),
          transactionName: title,
          amount: amount,
          date: date));
    });
  }

  void _dltTransaction(String dltId) {
    setState(() {
      _transactions.removeWhere((element) => element.transactionId == dltId);
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
                icon: const Icon(Icons.add))
          ],
          title: const Text('Budget'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(_recentTransactions),
              ListTransactions(_transactions, _dltTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransactions(context),
          child: const Icon(Icons.add),
        ));
  }
}
