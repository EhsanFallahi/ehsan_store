import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final productDetail=Products().getProduct('1');

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
          ),
        ),
        child: SafeArea(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Your Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 6,
                      color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white60,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xfF0496E2),
                              blurRadius: 25,
                              offset: Offset(4, 0))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                                color: Colors.white60,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 10,
                                        offset: Offset(0, 6))
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/61rCxJDiwlL._UL1500_.jpg',
                                fit: BoxFit.fill,
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      productDetail.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Colors.white,
                                      letterSpacing: 4
                                    ),
                                  ),
                                    Text(
                                      '12300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Color(0xffDE3C5D),
                                          letterSpacing: 4
                                      ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    color: Colors.white60,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 6,
                                ),
                              ),SizedBox(
                                height: 8,
                              ),
                      Text(
                          '10000',
                          style: TextStyle(
                              color: Color(0xffDE3C5D),
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            height: 40,
                            width: 140,
                            child: ElevatedButton(
                              child: Text('Buy'),
                              style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
