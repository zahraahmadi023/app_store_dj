import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/widgets/AppbarIcons.dart';
import 'package:app_store_ut/widgets/feeds_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key, required this.productList});
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //elevation: 4,
          title: Text("All product "),
          leading: AppBarIcons(
            function: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              //shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: productList[index], child: FeedsWidget());
                ;
              },
            ),
    );
  }
}
