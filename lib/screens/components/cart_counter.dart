import 'package:ecom/const.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numofItems = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Row(
        children: [
          buildButton(Icons.remove, () {
            if (numofItems > 0)
              setState(() {
                numofItems--;
              });
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
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
