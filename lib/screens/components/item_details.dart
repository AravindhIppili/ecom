import 'package:ecom/models/product.dart';
import 'package:ecom/screens/components/colorandsize.dart';
import 'package:ecom/screens/components/product_title.dart';
import 'package:flutter/material.dart';

class ItemBody extends StatelessWidget {
  final Product product;
  const ItemBody({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 95,
                      ),
                      ColorAndSize(product: product),
                    ],
                  ),
                ),
                ProductTitle(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
