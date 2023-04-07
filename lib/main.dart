// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import './widget/chart.dart';
import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import './models/transaction.dart';

void  main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//Add The User_Transaction file code for doing the work into main file

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New Shart', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'New Sun-Glass', amount: 69.99, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransaction{
    return _userTransactions.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days:7)
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txtTitle, double txtAmount,DateTime chosenDate) {
    final newTran = Transaction(
      id: DateTime.now().toString(),
      title: txtTitle,
      amount: txtAmount,
      date: chosenDate,
      //id: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTran);
    });
  }

//show a input place this function
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          // ignore: sort_child_properties_last
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  void _deleteTransaction (String id){
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              // iconSize: 72,
              icon: const Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Chart(_recentTransaction),TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
