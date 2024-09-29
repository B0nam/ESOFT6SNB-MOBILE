import 'package:test/test.dart';

import '../bin/atividade_02.dart';

void main() {
  group('Teste da ContaBancaria', () {
    test('Teste de depósito', () {
      var conta = ContaBancaria<double>(100.0);
      conta.depositar(100.0);
      expect(conta.consultarSaldo(), equals(200.0));
    });

    test('Teste de saque com saldo suficiente', () {
      var conta = ContaBancaria<double>(100.0);
      conta.sacar(50.0);
      expect(conta.consultarSaldo(), equals(50.0));
    });

    test('Teste de saque com saldo insuficiente', () {
      var conta = ContaBancaria<double>(100.0);
      conta.sacar(200.0);
      expect(conta.consultarSaldo(), equals(100.0));
    });

    test('Teste de listar transações', () {
      var conta = ContaBancaria<double>(100.0);
      conta.depositar(50.0);
      conta.sacar(30.0);
      expect(conta.listarTransacoes(), equals([50.0, -30.0]));
    });

    test('Teste de saldo inicial', () {
      var conta = ContaBancaria<double>(500.0);
      expect(conta.consultarSaldo(), equals(500.0));
    });
  });
}
