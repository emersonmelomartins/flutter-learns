import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expenses",
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        secondary: Colors.amber,
      )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 16.53,
    //     date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (transaction) {
        return transaction.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

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
            onTap: () {},
            // prevents close context when tapping content
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(onAddNewTransaction: _addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (bCtx) => FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () => _startAddNewTransaction(bCtx),
        ),
      ),
    );
  }
}
