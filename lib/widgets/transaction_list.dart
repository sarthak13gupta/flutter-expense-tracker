import 'package:expense_tracker/models/transaction.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// import 'package:expense_tracker/widgets/user_transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          )),
                          child: Text(
                            '\$ ${transactions[index].amount.toStringAsFixed(2)} ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                            // style: const TextStyle(
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 15,
                            // ),
                          ),
                          Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: const TextStyle(
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
