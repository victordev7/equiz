import 'package:dartz/dartz.dart';
import 'package:equiz/modules/auth/domain/auth_failures.dart';
import 'package:equiz/modules/auth/domain/entities/user.dart';
import 'package:equiz/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:equiz/modules/auth/domain/user_params.dart';

abstract class ICreateAccount {
  Future<Either<AuthFailure, UserEntity>> call(UserParams params);
}

class CreateAccount implements ICreateAccount {
  final IAuthRepository repository;

  CreateAccount(this.repository);

  @override
  Future<Either<AuthFailure, UserEntity>> call(UserParams params) async {
    if (!params.isPasswordValid) {
      return left(InvalidPassword());
    }

    if (!params.isNameValid) {
      return left(InvalidName());
    }

    if (!params.isEmailValid) {
      return left(InvalidEmail());
    }

    return await repository.createAccount(params);
  }
}
