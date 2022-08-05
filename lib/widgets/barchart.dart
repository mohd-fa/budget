import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final Map<String, Object> val;
  final double totalSum;

  const BarChart(this.val, this.totalSum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(255, 15, 126, 20),
                      width: 2.5)),
              child: CircleAvatar(
                backgroundColor: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(
                      child: Text(
                    '\$ ${val['amount']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              )),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 80,
            width: 10,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                      heightFactor: totalSum == 0
                          ? 0
                          : (val['amount'] as double) / totalSum,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(20)),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text('${val['day']}'),
        ],
      ),
    );
  }
}
