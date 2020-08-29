import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/transaction.model.dart';
import 'controllers/transaction.controller.dart';
import 'views/transactionview/transactionform.dart';
import 'views/transactionview/transactiongraph.dart';
import 'views/transactionview/transactionlist.dart';

main() => runApp(PersonalFinanceApp());

class PersonalFinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      home: App(),
      //theme: ThemeData.dark()
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Oswald',
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //     title:TextStyle(fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TransactionController _controller;
  _AppState() {
    _controller = new TransactionController();
  }

  void _onAdd(String title, double value) {
    var _transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _controller.add(_transaction);
    });

    Navigator.of(context).pop();
  }

  _openModalTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_onAdd);
        });
  }

  @override
  Widget build(BuildContext context) {
    var transactions = _controller.getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais".toUpperCase()),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openModalTransaction(context))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          child: Graph(_controller.getTransactionsOfLastWeek()),
        ),
        transactions.length > 0
            ? TransactionList(_controller.getAll())
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Você ainda não fez nenhuma operacação finaceira no app. Para começar é bem fácil, basta clicar no botão abaixo. \n\n Vamos começar!!!",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(child: Image.asset("lib/assets/images/arrow.png"))
                  ],
                ),
              ),
      ]),
      floatingActionButton: FloatingActionButton(
        tooltip: "New transaction",
        onPressed: () => _openModalTransaction(context),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
