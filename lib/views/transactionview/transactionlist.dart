import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(
    this.transactions,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, idx) {
          var t = transactions[idx];
          return Card(
            margin: EdgeInsets.only(
              bottom: 1,
              right: 10,
              left: 10,
              top: 0
            ),
          child: Row(
            children: [
              Container(
                width: 150,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: FittedBox(
                                  child: Text(
                    'R\$ ${t.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.title.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(DateFormat('d MMM y', 'pt_br').format(t.date),
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        );

        }),
    );
  }
}
