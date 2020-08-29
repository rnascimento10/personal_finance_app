import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();

  void _onSubmit() {
    var t = _titleCtrl.text;
    var v = double.tryParse(_valueCtrl.text) ?? 0;

    if (t.isEmpty || v <= 0) return;

    widget.onSubmit(t, v);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      
    );
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
              controller: _titleCtrl,
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                labelText: "Título",
              ),
            ),
            TextField(
              controller: _valueCtrl,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nenhuma data selecionada!"),
                  FlatButton(
                      onPressed: _showDatePicker,
                      child: Text('Selecionar Data'.toUpperCase()))
                ],
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
