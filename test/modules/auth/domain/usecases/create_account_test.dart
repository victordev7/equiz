import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equiz/modules/auth/domain/auth_failures.dart';
import 'package:equiz/modules/auth/domain/entities/user.dart';
import 'package:equiz/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:equiz/modules/auth/domain/usecases/create_account.dart';
import 'package:equiz/modules/auth/domain/user_params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_account_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  IAuthRepository repository = MockIAuthRepository();
  ICreateAccount createAccount = CreateAccount(repository);

  test('Deve retornar um InvalidEmail', () async {
    var response = await createAccount(
        UserParams(email: 'joao', name: 'joao', password: 'Jj123456'));

    expect(response.fold(id, id), isA<InvalidEmail>());
  });

  test('Deve retornar um InvalidPassword', () async {
    var response = await createAccount(
        UserParams(email: 'joao@email.com', name: 'joao', password: 'jjjj'));

    expect(response.fold(id, id), isA<InvalidPassword>());
  });

  test('Deve retornar um InvalidName', () async {
    var response = await createAccount(UserParams(
        name: 'a', email: 'email@email.com', password: 'Password1234'));

    expect(response.fold(id, id), isA<InvalidName>());
  });

  test('Deve retornar um UserEntity', () async {
    var params = UserParams(
        name: 'joao', email: 'joao@email.com', password: "Password123");

    when(repository.createAccount(params)).thenAnswer((_) async =>
        Right(UserEntity(name: params.name, uid: 'uid', email: params.email)));

    var response = await createAccount(params);

    expect(response.fold(id, id), isA<UserEntity>());
  });
}
