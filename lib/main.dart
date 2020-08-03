import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget{
  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
        fontFamily: 'OpenSans',
      ),

    );
  }
}

class MyHomePage extends StatefulWidget{
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

     final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions{
    return _transactions.where( (tr){
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

   _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(), 
        title: title, 
        value: value, 
        date: date,
      );

      setState(() {
        _transactions.add(newTransaction);
      });

      Navigator.of(context).pop(); 
  }

  _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr){
        return tr.id == id;
      });
    });

  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return TransactionForm(_addTransaction);
      }
    );

  }

  @override 
  Widget build (BuildContext context){
    final appBar = AppBar(
        title: Text('Despesas Pessoais', 
        style: TextStyle(
            fontSize: 20 * MediaQuery.of(context).textScaleFactor,
          ), 
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      );
    final avaliableHeight = MediaQuery.of(context).size.height 
      - appBar.preferredSize.height 
      - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
              child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Chart(_recentTransactions),
              height: avaliableHeight * 0.3,
            ),
            Container(
              child: TransactionList(_transactions, _deleteTransaction),
              height: avaliableHeight * 0.7, 
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}