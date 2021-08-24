import 'package:dartz/dartz.dart';
import 'package:equiz/modules/auth/domain/entities/user.dart';

import '../auth_failures.dart';
import '../user_params.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, UserEntity>> createAccount(UserParams params);
}
