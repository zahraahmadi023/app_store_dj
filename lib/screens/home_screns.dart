import 'package:app_store_ut/const/colors.dart';
import 'package:app_store_ut/model/product_model.dart';
import 'package:app_store_ut/screens/categori_screen.dart';
import 'package:app_store_ut/screens/feed_screen.dart';
import 'package:app_store_ut/screens/user_screen.dart';
import 'package:app_store_ut/services/api_handelar.dart';
import 'package:app_store_ut/widgets/AppbarIcons.dart';
import 'package:app_store_ut/widgets/feed_gride_widget.dart';
import 'package:app_store_ut/widgets/sal_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  List<ProductModel> productList = [];
  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController = TextEditingController();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getproducts();
    super.didChangeDependencies();
  }

  Future<void> getproducts() async {
    productList = await ApiHandeler.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            //elevation: 4,
            title: Text("Home"),
            leading: AppBarIcons(
              function: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: CategoryScreen()));
              },
              icon: Icon(IconlyLight.category),
            ),
            actions: [
              AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: UserScreen()));
                },
                icon: Icon(IconlyLight.user3),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Theme.of(context).cardColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary)),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SalWidget();
                    },
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white, activeColor: Colors.red)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Pruduct ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightTextColor)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FutureBuilder<List<ProductModel>>(
                                    future: ApiHandeler.getAllProduct(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        Center(
                                            child: Text(
                                                "error : ${snapshot.hasError}"));
                                      } else if (snapshot.data == null) {
                                        return Center(child: Text("null data"));
                                      }
                                      return FeedScreen(
                                        productList: snapshot.data!,
                                      );
                                    },
                                  ),
                                  // child: FeedScreen(
                                  //   productList: productList,
                                  // )
                                ));
                          },
                          icon: Icon(Icons.arrow_back)),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<ProductModel>>(
                    future: ApiHandeler.getAllProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        Center(child: Text("error : ${snapshot.hasError}"));
                      } else if (snapshot.data == null) {
                        return Center(child: Text("null data"));
                      }
                      return FeedGrideWidget(
                        productList: snapshot.data!,
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
