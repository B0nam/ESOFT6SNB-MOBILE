import 'package:flutter/material.dart';
import 'package:mobile/model/transacao.dart';
import 'package:mobile/service/transacoesService.dart';

class ListTransactionsPage extends StatefulWidget {
  final TransacoesService transactionsService;

  const ListTransactionsPage({super.key, required this.transactionsService});

  @override
  ListTransactionsPageState createState() => ListTransactionsPageState();
}

class ListTransactionsPageState extends State<ListTransactionsPage> {
  List<Transacao> transactions = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transações bancárias"),
        ),
        body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              title: Text(transaction.nome),
              subtitle: Text('Valor: ${transaction.valor}'),
            );
          },
        ));
  }

  fetchData() async {
    transactions = (await widget.transactionsService.getAll()) as List<Transacao>;
    print(transactions);
  }
}