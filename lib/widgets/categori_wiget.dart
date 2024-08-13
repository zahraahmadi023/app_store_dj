import 'package:app_store_ut/const/colors.dart';
import 'package:app_store_ut/model/categori_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CategoriWidget extends StatelessWidget {
  const CategoriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryModelProvider =
        Provider.of<CategoryModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              child: FancyShimmerImage(
                  height: size.height * 0.65,
                  width: size.width * 0.45,
                  boxFit: BoxFit.fill,
                  errorWidget: Icon(
                    IconlyBold.danger,
                    size: 28,
                    color: Colors.red,
                  ),
                  imageUrl: categoryModelProvider.image.toString()),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                categoryModelProvider.name.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: lightCardColor.withOpacity(0.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
