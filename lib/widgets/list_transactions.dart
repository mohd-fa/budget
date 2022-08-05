import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ListTransactions extends StatefulWidget {
  final List<Transactions> transactions;
  final Function dltTx;

  const ListTransactions(this.transactions, this.dltTx, {Key? key})
      : super(key: key);

  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: widget.transactions.isEmpty
          ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'No transactions yet.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Add transaction.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]))
            ])
          : ListView.builder(
              itemCount: widget.transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2)),
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '\$ ${widget.transactions[index].amount}',
                            style: const TextStyle(
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
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy')
                              .format(widget.transactions[index].date),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        iconSize: 32,
                        alignment: Alignment.centerRight,
                        onPressed: () => widget
                            .dltTx(widget.transactions[index].transactionId),
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.red[600],
                        ))
                  ]),
                );
              }),
    );
  }
}
