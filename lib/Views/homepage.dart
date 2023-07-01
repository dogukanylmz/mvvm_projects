import 'package:flutter/material.dart';
import 'package:mvvm_projects/Model-View/user_model_view.dart';
import 'package:mvvm_projects/Services/service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_projects/Views/flipable_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final PostUserModel _postUserModel = PostUserModel(Service());
  @override
  void initState() {
    super.initState();
    _postUserModel.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mobx & MVVM"),
      ),
      body: Observer(
        builder: (_) {
          switch (_postUserModel.userServiceState) {
            case ServiceState.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.grey,
                ),
              );
            case ServiceState.completed:
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _postUserModel.users.length,
                      itemBuilder: (context, index) {
                        return FlipableCard(index: index, postUserModel: _postUserModel);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            case ServiceState.failed:
              return const Center(
                child: Text("Bir hata oluştu"),
              );
            default:
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.grey,
                ),
              );
          }
        },
      ),
    );
  }

}