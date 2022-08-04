import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ListTransactions extends StatefulWidget {
  final List<Transactions> transactions;
  ListTransactions(this.transactions);

  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.transactions.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2)),
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${widget.transactions[index].amount}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.transactions[index].transactionName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy')
                          .format(widget.transactions[index].date),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ]),
            );
          }),
      height: 500,
    );
  }
}
