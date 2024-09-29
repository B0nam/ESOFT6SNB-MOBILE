class ContaBancaria<T extends num> {
  T saldo;
  List<T> transacoes = [];

  ContaBancaria(this.saldo);

  void depositar(T valor) {
    saldo = (saldo + valor) as T;
    transacoes.add(valor);
    print('Depósito de $valor realizado. Saldo atual: $saldo');
  }

  void sacar(T valor) {
    if (valor <= saldo) {
      saldo = (saldo - valor) as T;
      transacoes.add((-valor) as T);
      print('Saque de $valor realizado. Saldo atual: $saldo');
    } else {
      print('Saldo insuficiente para saque de $valor.');
    }
  }

  T consultarSaldo() {
    return saldo;
  }

  List<T> listarTransacoes() {
    return transacoes;
  }
}

void main() {
  var conta = ContaBancaria<double>(100.0);

  conta.depositar(100.0);
  conta.sacar(50.0);
  print('Saldo final: ${conta.consultarSaldo()}');
  print('Transações: ${conta.listarTransacoes()}');
}
