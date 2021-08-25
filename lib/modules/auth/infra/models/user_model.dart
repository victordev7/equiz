import 'package:equiz/modules/auth/domain/entities/user_entity.dart';

class UserModel {
  late final String name;
  late final String uid;
  late final String email;

  UserModel({required this.name, required this.uid, required this.email});

  UserEntity get toEntity => UserEntity(name: name, uid: uid, email: email);
}
