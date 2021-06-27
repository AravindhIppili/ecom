import 'package:ecom/const.dart';
import 'package:ecom/screens/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "icons/search.svg",
                color: kTextColor,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "icons/cart.svg",
                color: kTextColor,
              )),
          SizedBox(
            width: kDefaultPaddin / 2,
          )
        ],
        centerTitle: true,
        title: Text(
          "E-Commerce",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
