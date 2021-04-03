import 'package:ehsan_store/screens/admin/product_edit/ProductEditScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductItem extends StatelessWidget {
  int id;
  String title;
  String description;
  String picture;
  double price;
  int amount;
  bool is_display;
  String tag;
  bool is_favorites;

  AdminProductItem(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.is_display,
      this.tag,
      this.is_favorites});

  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Padding mainBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 2),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              Get.to(ProductEditScreen(), arguments: [
                id,
                title,
                description,
                price,
                tag,
                amount,
                is_display,
                picture,
                is_favorites
              ]);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(picture),
                      colorFilter: is_display
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(1), BlendMode.dstATop)
                          : ColorFilter.mode(Colors.black.withOpacity(0.2),
                              BlendMode.dstATop))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: boxDecoration(context),
                      child: rowItemViews(context),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Row rowItemViews(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleItem(),
                descriptionItem(),
                priceItem(),
              ]),
        ),
        tagItem(),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              handelAmountColor(),
              amountItem(context),
            ],
          ),
        )
      ],
    );
  }

  BoxDecoration boxDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor.withOpacity(0.8));
  }

  Padding amountItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).accentColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            amount.toString(),
            style: amount < 5
                ? TextStyle(
                    color: Colors.red,
                    fontSize: 21,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    color: SECONDARY_COLOR,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Text handelAmountColor() {
    return Text(
      'amount'.tr,
      style: amount < 5
          ? TextStyle(
              color: Colors.red,
              letterSpacing: 2,
              fontSize: 21,
              fontWeight: FontWeight.bold)
          : TextStyle(
              color: SECONDARY_COLOR,
              letterSpacing: 2,
              fontSize: 21,
              fontWeight: FontWeight.bold),
    );
  }

  Text priceItem() {
    return Text(
      price.toString(),
      style: TextStyle(color: Color(0xffFB365F), fontSize: 16),
    );
  }

  Text descriptionItem() {
    return Text(
      description,
      style: TextStyle(color: Colors.white70, fontSize: 16),
    );
  }

  Text titleItem() {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2),
    );
  }

  Column tagItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          tag,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
