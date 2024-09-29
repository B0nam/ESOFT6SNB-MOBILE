import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormPage()),
            );
          },
          child: Text('Adicionar Conta'),
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final List<Map<String, String>> contas = [];
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController saldoController = TextEditingController();
  int? contaIndexEditando;

  void adicionarOuEditarConta() {
    if (nomeController.text.isNotEmpty && saldoController.text.isNotEmpty) {
      setState(() {
        if (contaIndexEditando == null) {
          contas.add({
            'nome': nomeController.text,
            'saldo': saldoController.text,
          });
        } else {
          contas[contaIndexEditando!] = {
            'nome': nomeController.text,
            'saldo': saldoController.text,
          };
          contaIndexEditando = null;
        }
        nomeController.clear();
        saldoController.clear();
      });
    }
  }

  void editarConta(int index) {
    setState(() {
      nomeController.text = contas[index]['nome']!;
      saldoController.text = contas[index]['saldo']!;
      contaIndexEditando = index;
    });
  }

  void removerConta(int index) {
    setState(() {
      contas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Conta'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome da Conta'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: saldoController,
              decoration: InputDecoration(labelText: 'Saldo Inicial'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: adicionarOuEditarConta,
            child: Text(contaIndexEditando == null ? 'Salvar' : 'Editar Conta'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Nome: ${contas[index]['nome']}'),
                  subtitle: Text('Saldo: ${contas[index]['saldo']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => editarConta(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removerConta(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
