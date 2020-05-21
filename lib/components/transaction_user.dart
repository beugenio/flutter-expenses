import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  
   final _transactions = [
    Transaction(
      id: 't1',
      title: 'Bota creek para o chile',
      value: 56.00,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz 0',
      value: 123.00,
      date: DateTime.now()
    ),
  ];
  
  _addTransaction(String title, double value){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(), 
        title: title, 
        value: value, 
        date: DateTime.now()
      );

      setState(() {
        _transactions.add(newTransaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction), //função para receber do filho os dados gerados
        TransactionList(_transactions), //passando os dados direto (lista fixa)
      ],
    );
  }
}