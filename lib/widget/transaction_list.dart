import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_v1/models/transaction.dart';
// import 'package:personal_expenses/models/transaction.dart';
// import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  const TransactionList(this.transaction,this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 550,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                      
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing:IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: ()=>deleteTx(transaction[index].id),
                      ),
                  ),
                );
//............Custom Widget........................//

                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         // ignore: prefer_const_constructors
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         // ignore: prefer_const_constructors
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transaction[index].amount.toStringAsFixed(2)}', //string concatanation
                //           // ignore: prefer_const_constructors
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Theme.of(context).primaryColor),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transaction[index].title,
                //             // ignore: prefer_const_constructors
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transaction[index].date),
                //             // ignore: prefer_const_constructors
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transaction.length,
              // children: transaction.map((tx) {

              //  }).toList(),
            ),
    );
  }
}
