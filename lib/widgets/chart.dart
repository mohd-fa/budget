import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/barchart.dart';
import '../models/transaction.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
  Chart(this.recentTransactions, {Key? key}) : super(key: key);
  double totalSum = 0;

  List<Map<String, Object>> get groupedTransactionVal {
    return List.generate(7, (index) {
      double sumDay = 0;
      var weakDay = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < recentTransactions.length; i++) {
        if (weakDay.day == recentTransactions[i].date.day &&
            weakDay.month == recentTransactions[i].date.month &&
            weakDay.year == recentTransactions[i].date.year) {
          sumDay += recentTransactions[i].amount;
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weakDay).substring(0, 1),
        'amount': sumDay
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Row(
        children: [
          ...groupedTransactionVal
              .map((e) {
                return BarChart(e, totalSum);
              })
              .toList()
              .reversed
        ],
      ),
    );
  }
}
