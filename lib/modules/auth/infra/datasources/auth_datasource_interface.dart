import 'package:equiz/modules/auth/domain/user_params.dart';
import 'package:equiz/modules/auth/infra/models/user_model.dart';

abstract class IAuthDatasource {
  Future<UserModel> createAccount(UserParams params);
}
