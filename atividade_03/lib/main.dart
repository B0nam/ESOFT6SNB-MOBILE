import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _contas = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();

  void _adicionarConta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _contas.add({
          'nome': _nomeController.text,
          'saldo': _saldoController.text,
        });
      });

      _nomeController.clear();
      _saldoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome da Conta',
                    ),
                    validator: (value) {
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _saldoController,
                    decoration: const InputDecoration(
                      labelText: 'Saldo Inicial',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _adicionarConta,
                    child: const Text('Adicionar Conta'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _contas.isEmpty
                ? const Center(child: Text('Nenhuma conta adicionada ainda'))
                : ListView.builder(
                    itemCount: _contas.length,
                    itemBuilder: (context, index) {
                      return CardAtividade(
                        nome: _contas[index]['nome']!,
                        saldo: _contas[index]['saldo']!,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CardAtividade extends StatelessWidget {
  final String nome;
  final String saldo;

  const CardAtividade({super.key, required this.nome, required this.saldo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text('Nome: $nome'),
        subtitle: Text('Saldo: $saldo'),
      ),
    );
  }
}
