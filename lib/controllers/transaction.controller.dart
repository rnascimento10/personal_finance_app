import '../models/transaction.model.dart';

class TransactionController {
  List<Transaction> _transactions;
  TransactionController() {
    _transactions = [
      new Transaction(
          id: "1", title: "Supermercado", value: 300.0, date: DateTime.now()),
      new Transaction(
          id: "2", title: "Educação", value: 1500.0, date: DateTime.now().subtract(Duration(days: 2))),
      new Transaction(
          id: "3", title: "Curso", value: 150.0, date:DateTime.now().subtract(Duration(days: 2))),
          new Transaction(
          id: "4", title: "Curso 2", value: 155.0, date: DateTime.now().subtract(Duration(days: 3))),
    ];
  }

  List<Transaction> getAll() {
    return _transactions;
  }

  List<Transaction> getTransactionsOfLastWeek() {
    return _transactions
        .where((tr) => tr.date.isAfter(tr.date.subtract(Duration(days: 7))))
        .toList();
  }

  
  bool add(Transaction model) {
    _transactions.add(model);
  }

  bool delete(String id) {
    var entity = _transactions.firstWhere((t) => t.id == id);
    _transactions.remove(entity);
  }
}
