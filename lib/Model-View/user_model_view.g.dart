// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostUserModel on _PostUserModelBase, Store {
  late final _$userServiceStateAtom =
      Atom(name: '_PostUserModelBase.userServiceState', context: context);

  @override
  ServiceState get userServiceState {
    _$userServiceStateAtom.reportRead();
    return super.userServiceState;
  }

  @override
  set userServiceState(ServiceState value) {
    _$userServiceStateAtom.reportWrite(value, super.userServiceState, () {
      super.userServiceState = value;
    });
  }

  late final _$usersAtom =
      Atom(name: '_PostUserModelBase.users', context: context);

  @override
  List<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_PostUserModelBase.getUsers', context: context);

  @override
  Future<List<User>> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  @override
  String toString() {
    return '''
userServiceState: ${userServiceState},
users: ${users}
    ''';
  }
}
