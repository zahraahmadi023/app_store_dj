import 'package:app_store_ut/model/categori_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/api_handelar.dart';
import '../widgets/categori_wiget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" categoriii"), actions: []),
      body: FutureBuilder<List<CategoryModel>>(
        future: ApiHandeler.getAllCategori(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            Center(child: Text("error : ${snapshot.hasError}"));
          } else if (snapshot.data == null) {
            return Center(child: Text("null data"));
          }
          return GridView.builder(
            //shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: snapshot.data![index], child: CategoriWidget());

              //CategoriWidget();
            },
          );
        },
      ),
    );
  }
}
