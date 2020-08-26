import '../models/transaction.model.dart';

class TransactionController {

  List<Transaction> _transactions ;
  TransactionController(){
    _transactions = [
      new Transaction(
          id: "1", title: "Supermercado", value: 15.0, date: DateTime.now()),
      new Transaction(
          id: "2", title: "Educação", value: 1500.0, date: DateTime.now()),
      new Transaction(
          id: "3", title: "Curso", value: 150.0, date: DateTime.now()),
    ];
  }

  List<Transaction> getAll() {
    return _transactions;
  }

  bool add(Transaction model){
    _transactions.add(model);
  }

  bool delete(String id){
    var entity = _transactions.firstWhere((t) => t.id == id);
    _transactions.remove(entity);
  }
}
