// Failure classes
// Definição de classes de falhas para tratamento de erros
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Erros de servidor
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// Erros de rede
class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

// Erros de cache
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

// Erros de permissão
class PermissionFailure extends Failure {
  const PermissionFailure(String message) : super(message);
}