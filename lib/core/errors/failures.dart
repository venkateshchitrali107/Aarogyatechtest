import 'package:equatable/equatable.dart';

/// Abstract failure class that all other failures extend
abstract class Failure extends Equatable {}

/// Constant string for connection failure message
const String messageConnectionFailure = 'messageConnectionFailure';

/// Server failure with error message
class ServerFailure extends Failure {
  /// Error message for server failure
  final String errorMessage;

  ServerFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $errorMessage}';
  }
}

/// Cache failure with error message
class CacheFailure extends Failure {
  /// Error message for cache failure
  final String errorMessage;

  CacheFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'CacheFailure{errorMessage: $errorMessage}';
  }
}

/// Connection failure with default error message
class ConnectionFailure extends Failure {
  /// Default error message
  final String errorMessage = messageConnectionFailure;

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $errorMessage}';
  }
}
