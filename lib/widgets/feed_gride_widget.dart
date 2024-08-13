import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/widgets/feeds_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedGrideWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<ProductModel> productList;

  FeedGrideWidget({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
            value: productList[index], child: FeedsWidget());
      },
    );
  }
}
