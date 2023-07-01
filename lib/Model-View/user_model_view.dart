import 'package:mobx/mobx.dart';
import 'package:mvvm_projects/Services/service.dart';

import '../Model/user_model.dart';
part 'user_model_view.g.dart';

class PostUserModel = _PostUserModelBase with _$PostUserModel;

abstract class _PostUserModelBase with Store {
  final Service userService;
  _PostUserModelBase(this.userService);

  @observable
  ServiceState userServiceState = ServiceState.initial;

  @observable
  List<User> users = [];

  @action
  Future<List<User>> getUsers() async {
    userServiceState = ServiceState.loading;
    try {
      if (users.isNotEmpty) return users;

      users = await userService.getUsers();
      userServiceState = ServiceState.completed;
      return users;
    } catch (e) {
      userServiceState = ServiceState.failed;
      print(e);
      return [];
    }
  }
}

enum ServiceState { loading, completed, failed, initial }
