import 'package:equiz/modules/auth/domain/user_params.dart';
import 'package:equiz/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:equiz/modules/auth/infra/models/user_model.dart';

class AuthDatasource implements IAuthDatasource {
  @override
  Future<UserModel> createAccount(UserParams params) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }
}
