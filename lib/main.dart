import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_user.dart';

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
  

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_balance_wallet), 
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Gráfico'),
                elevation: 6,
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_balance_wallet),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}