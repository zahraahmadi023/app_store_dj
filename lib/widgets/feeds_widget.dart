import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/screens/product_details.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FeedsWidget extends StatelessWidget {
  FeedsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel productModelProvider = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(8),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: ProductDetailState(
                          id: productModelProvider.id.toString(),
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: productModelProvider.price.toString(),
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        // RichText(
                        //     text: TextSpan(
                        //         text: "168.00",
                        //         style: TextStyle(color: lightTextColor))),
                        Icon(IconlyBold.heart)
                      ],
                    ),
                  ),
                  //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: DetailScreen()));
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    child: FancyShimmerImage(
                        height: size.height * 0.2,
                        width: double.infinity,
                        boxFit: BoxFit.fill,
                        errorWidget: Icon(
                          IconlyBold.danger,
                          size: 28,
                          color: Colors.red,
                        ),
                        imageUrl: productModelProvider.images![0]),
                  ),
                  Text(
                    productModelProvider.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  )
                ],
              )),
        ));
  }
}
