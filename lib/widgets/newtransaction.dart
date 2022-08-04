import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTansaction extends StatefulWidget {
  final Function addTx;

  NewTansaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTansaction> createState() => _NewTansactionState();
}

class _NewTansactionState extends State<NewTansaction> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  late DateTime dateTimeVal;
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Date'),
            readOnly: true,
            onTap: () async {
              dateTimeVal = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100)) as DateTime;

              setState(() {
                dateController.text =
                    DateFormat('dd-MM-yyyy').format(dateTimeVal);
              });
            },
            controller: dateController,
          ),
          // DatePickerDialog(
          //     initialDate: DateTime.now(),
          //     firstDate: DateTime(2000),
          //     lastDate: DateTime(2100)),
          TextButton(
              onPressed: () => widget.addTx(titleController.text,
                  double.parse(amountController.text), dateTimeVal),
              child: Text('Add Transaction')),
        ],
      ),
    );
  }
}
