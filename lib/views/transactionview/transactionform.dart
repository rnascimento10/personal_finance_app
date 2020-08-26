import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {


  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleCtrl = TextEditingController();

  final valueCtrl = TextEditingController();

  void _onSubmit(){
      var t = titleCtrl.text;
      var v = double.tryParse(valueCtrl.text) ?? 0;

      if (t.isEmpty || v <= 0) return ;

      widget.onSubmit(t, v);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              
              controller: titleCtrl,
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                labelText: "Título",
               
              ),
            ),
            TextField(
              controller: valueCtrl,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                labelText: "Valor (R\$)",
               
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onSubmit,
                    child: Text("Salvar".toUpperCase())),
              ],
            )
          ],
        ),
      ),
    );
  }
}
