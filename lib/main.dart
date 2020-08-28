import 'dart:math';

import 'package:flutter/material.dart';
import 'models/transaction.model.dart';
import 'controllers/transaction.controller.dart';
import 'views/transactionview/transactionform.dart';
import 'views/transactionview/transactionlist.dart';

main() => runApp(PersonalFinanceApp());

class PersonalFinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(), 
      //theme: ThemeData.dark()
      
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Merriweather',
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

  _openModalTransaction(BuildContext context){
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
            icon: Icon(Icons.add) , 
            onPressed:() =>  _openModalTransaction (context)
          )
        ],
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Grafico"),
            ),
            elevation: 3,
          ),
        ),
      
        transactions.length > 0 ? 
          TransactionList(_controller.getAll()) :
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              
              children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Você ainda não fez nenhuma operacação finaceira no app. Para começar é bem fácil, basta clicar no botão abaixo. \n\n Vamos começar!!!",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Image.asset("lib/assets/images/arrow.png")
            ],),
          )
        ,
      ]
    ),

      floatingActionButton: FloatingActionButton(         
              tooltip: "New transaction",
              onPressed:() =>  _openModalTransaction (context),
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
    ),
       
      
       
    );
  }
}
