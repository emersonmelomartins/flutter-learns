import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> _userTransactions = [
      Transaction(
          id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
      Transaction(
          id: 't2',
          title: 'Weekly Groceries',
          amount: 16.53,
          date: DateTime.now()),
    ];

    void _addNewTransaction(String title, double amount) {
      final newTransaction = Transaction(
          title: title,
          amount: amount,
          date: DateTime.now(),
          id: DateTime.now().toString());

      setState(() {
        _userTransactions.add(newTransaction);
      });
    }

    void _startAddNewTransaction(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return GestureDetector(
              child: NewTransaction(onAddNewTransaction: _addNewTransaction),
              onTap: () {},
              // prevents close context when tapping content
              behavior: HitTestBehavior.opaque,
            );
          });
    }

    final ThemeData theme = ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Quicksand',
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 20,
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expenses",
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        secondary: Colors.amber,
      )),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Personal Expenses App",
            ),
            actions: [
              Builder(
                builder: (bCtx) => IconButton(
                  onPressed: () => _startAddNewTransaction(bCtx),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 5,
                    child: const Text("CHART"),
                  ),
                ),
                TransactionList(transactions: _userTransactions),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (bCtx) => FloatingActionButton(
              child: const Icon(
                Icons.add,
              ),
              onPressed: () => _startAddNewTransaction(bCtx),
            ),
          )),
    );
  }
}
