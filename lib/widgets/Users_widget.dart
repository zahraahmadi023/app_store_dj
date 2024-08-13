import 'package:app_store_ut/const/colors.dart';
import 'package:app_store_ut/model/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UsersWidgets extends StatelessWidget {
  const UsersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersModel userModelProvider = Provider.of<UsersModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: ClipRRect(
        child: FancyShimmerImage(
            height: size.height * 0.15,
            width: size.width * 0.15,
            boxFit: BoxFit.fill,
            errorWidget: Icon(
              IconlyBold.danger,
              size: 28,
              color: Colors.red,
            ),
            imageUrl: userModelProvider.avatar.toString()),
      ),
      title: Text(userModelProvider.name.toString()),
      subtitle: Text(
        userModelProvider.email.toString(),
      ),
      trailing: Text(
        userModelProvider.role.toString(),
        style: TextStyle(color: lightIconsColor),
      ),
    );
  }
}
