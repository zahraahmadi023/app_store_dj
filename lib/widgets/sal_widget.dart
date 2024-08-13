import 'package:flutter/material.dart';

class SalWidget extends StatelessWidget {
  const SalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
              colors: [
                Color(0XFF7A60A5),
                Color(0XFF82C3DF),
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(
                1,
                0,
              ),
              stops: [0, 1],
              tileMode: TileMode.clamp)),
      child: Row(children: [
        Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0XFF9689CE),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "get special const",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Flexible(
                        child: SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "50% \n off",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )),
        Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.network("https://i.ibb.co/vwB46Yq/shoes.png"),
            ))
      ]),
    );
  }
}
