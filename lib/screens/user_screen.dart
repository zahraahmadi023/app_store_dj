import 'package:app_store_ut/model/users_model.dart';
import 'package:app_store_ut/widgets/Users_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/api_handelar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"), actions: []),
      body: FutureBuilder<List<UsersModel>>(
        future: ApiHandeler.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            Center(child: Text("error : ${snapshot.hasError}"));
          } else if (snapshot.data == null) {
            return Center(child: Text("null data"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: snapshot.data![index], child: UsersWidgets());
            },
          );
        },
      ),
    );
  }
}
