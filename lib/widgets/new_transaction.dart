import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);

//   @override
//   State<NewTransaction> createState() => _NewTransactionState();
// }

// class _NewTransactionState extends State<NewTransaction> {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitData() {
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) return;

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleInputController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountInputController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              textColor: Theme.of(context).primaryColorDark,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
