import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget{
  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      home: MyHomePage()

    );
  }
}

class MyHomePage extends StatelessWidget{
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Bota creek para o chile',
      value: 56.00,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 123.00,
      date: DateTime.now()
    )
  ];


  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Gráfico'),
              elevation: 6,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(tr.value.toString()),
                    ),
                    Column(
                      children: <Widget>[
                        Text(tr.title),
                        Text(tr.date.toString()),
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}