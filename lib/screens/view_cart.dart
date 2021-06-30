import 'package:ecom/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecom/models/product.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  int numofItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: kTextColor,
            cacheColorFilter: true,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => Card(
            elevation: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPaddin / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: products[index].color,
                      ),
                      child: Image.asset(
                        products[index].image,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        products[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "\$${products[index].price.toString()}\n",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Row(
                        children: [
                          buildButton(Icons.remove, () {
                            if (numofItems > 0)
                              setState(() {
                                numofItems--;
                              });
                          }),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPaddin / 2),
                            child: Text(
                              numofItems.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          buildButton(Icons.add, () {
                            setState(() {
                              numofItems++;
                            });
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildButton(IconData icon, Function() press) {
    return SizedBox(
      height: 32,
      width: 40,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              side: BorderSide(color: kTextLightColor))),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: kTextColor,
        ),
      ),
    );
  }
}
