import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance/models/transaction.model.dart';
import 'package:collection/collection.dart';
import 'package:personal_finance/views/transactionview/components/chartbar.dart';

class Graph extends StatelessWidget {
  final List<Transaction> lastWeekTranactions;

  Graph(this.lastWeekTranactions);

  List<dynamic> get _lastWeekSumTransactions {
    final ts = lastWeekTranactions.map((e) {
      return {
        'date': DateFormat('yyyy-MM-dd').format(e.date),
        'value': e.value,
      };
    });

    var sumOfTransactionsPerDate = [];

    groupBy(ts, (o) => o['date']).forEach((key, value) {
      double sum = 0.0;

      value.forEach((element) {
        sum += element['value'];
      });

      sumOfTransactionsPerDate.add({"date": key, "sum": sum});
    });

    return sumOfTransactionsPerDate;
  }

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (idx) {
      final weekDay = DateTime.now().subtract(Duration(
        days: idx,
      ));

      final d = DateFormat.E('pt_br').format(weekDay)[0].toUpperCase();

      double totalSum = 0.0;
      for (var t in _lastWeekSumTransactions) {
       
        final d = DateTime.parse('${t['date']} 00:00:00.000');

        if (d.day == weekDay.day &&
            d.month == weekDay.month &&
            d.year == weekDay.year) {
          totalSum = t['sum'];
        }
      }

      return { 'day': d, 'value': totalSum };
    }).reversed.toList();
  }

  double get _weekTotal {
    return _lastWeekSumTransactions.fold(0.0, (sum, t) {
      return sum + t['sum'];
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          children: groupedTransaction.map((t) {
            return ChartBar(
              label: t['day'],
              value: t['value'],
              percentage:  (t['value'] as double) / _weekTotal,
            ); 
            
          }).toList(),
        ),
      ),
      elevation: 3,
    );
  }
}
