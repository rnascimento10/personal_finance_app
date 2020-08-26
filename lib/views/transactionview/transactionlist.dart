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
          child: Row(
            children: [
              Container(
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
                child: Text(
                  'R\$ ${t.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
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
                  Text(DateFormat('d MMM y').format(t.date),
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
