import 'package:app_store_ut/const/colors.dart';
import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/services/api_handelar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetailState extends StatefulWidget {
  final String id;
  const ProductDetailState({super.key, required this.id});

  @override
  State<ProductDetailState> createState() => _ProductDetailStateState();
}

class _ProductDetailStateState extends State<ProductDetailState> {
  ProductModel? productModel;
  Future<void> getProductInfo() async {
    try {
      productModel = await ApiHandeler.getProductById(id: widget.id);
    } catch (error) {
      //log("error $error");
    }

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: productModel == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      BackButton(),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:
                                  Text(productModel!.category!.name.toString()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 3,
                                    child: Text(
                                      productModel!.title.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: lightTextColor),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("\$",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightTextColor)),
                                      Text(productModel!.price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightTextColor))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Swiper(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return FancyShimmerImage(
                                      boxFit: BoxFit.fill,
                                      width: double.infinity,
                                      imageUrl: productModel!.images![index]
                                          .toString());
                                },
                                autoplay: true,
                                pagination: SwiperPagination(
                                    alignment: Alignment.bottomCenter,
                                    builder: DotSwiperPaginationBuilder(
                                        color: Colors.white,
                                        activeColor: Colors.red)),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Discripstion",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: lightTextColor)),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    productModel!.description.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
