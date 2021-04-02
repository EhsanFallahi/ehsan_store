import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Container mainBody(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: [
          headerItem(context),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: searchItem(context),
          )
        ],
      ),
    );
  }

  Container searchItem(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: SearchBoxDecoration(context),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
            hintText: 'search',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: Icon(
              Icons.search_rounded,
              color: PRIMARY_COLOR,
            )),
      ),
    );
  }

  BoxDecoration SearchBoxDecoration(BuildContext context) {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 10,
              color: Theme.of(context).accentColor.withOpacity(0.8)),
        ]);
  }

  Container headerItem(BuildContext context) {
    return Container(
      height: size.height * 0.2 - 28,
      decoration: headerBoxDecoration(context),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: titleItem(),
        ),
      ),
    );
  }

  Text titleItem() {
    return Text(
      'Ehsan Store',
      style: TextStyle(
        color: SECONDARY_COLOR,
        fontSize: 24,
        letterSpacing: 3,
      ),
    );
  }

  BoxDecoration headerBoxDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(36), bottomLeft: Radius.circular(36)));
  }
}
