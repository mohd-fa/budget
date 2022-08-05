import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTansaction extends StatefulWidget {
  final Function addTx;
  const NewTansaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTansaction> createState() => _NewTansactionState();
}

class _NewTansactionState extends State<NewTansaction> {
  final _titleController = TextEditingController();
  DateTime? _dateTimeVal;
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Title'),
          controller: _titleController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Amount'),
          controller: _amountController,
          keyboardType: TextInputType.number,
        ),
        Row(
          children: [
            Expanded(
                child: _dateTimeVal == null
                    ? const Text('No date selected')
                    : Text(
                        'Picked Date: ${DateFormat('dd-MM-yyyy').format(_dateTimeVal as DateTime)}')),
            TextButton(
                onPressed: () => showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value == null) return;
                      setState(() {
                        _dateTimeVal = value;
                      });
                    }),
                child: const Text(
                  'Select Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
        TextButton(
            onPressed: () {
              final enteredText = _titleController.text;
              final enteredAmount = double.parse(_amountController.text);

              if (enteredAmount <= 0 ||
                  enteredText.isEmpty ||
                  _dateTimeVal == null) return;

              widget.addTx(_titleController.text,
                  double.parse(_amountController.text), _dateTimeVal);

              Navigator.of(context).pop();
            },
            child: const Text('Add Transaction')),
      ],
    );
  }
}
