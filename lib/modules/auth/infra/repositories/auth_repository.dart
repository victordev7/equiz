import 'package:equiz/modules/auth/domain/entities/user_entity.dart';
import 'package:equiz/modules/auth/domain/auth_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equiz/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:equiz/modules/auth/domain/user_params.dart';
import 'package:equiz/modules/auth/infra/datasources/auth_datasource_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository(this.datasource);
  @override
  Future<Either<AuthFailure, UserEntity>> createAccount(
      UserParams params) async {
    try {
      var response = await datasource.createAccount(params);
      return Right(response.toEntity);
    } on AuthFailure catch (error) {
      return left(error);
    }
  }
}
