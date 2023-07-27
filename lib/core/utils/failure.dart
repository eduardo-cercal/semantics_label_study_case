import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class InvalidCredentialsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnresgiterUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}
