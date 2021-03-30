import 'package:ehsan_store/screens/admin/drawer/AdminDrawer.dart';
import 'package:flutter/material.dart';

class AdminProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: appBar,
      drawer: AdminDrawer(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
            onPressed: (){},
            label: Text(
              'Add Product'
            ),
          icon: Icon(Icons.add,color:Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
          ),
        ),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'Product Detail',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: 6,
                    color: Colors.white70),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            right: 15,
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://m.media-amazon.com/images/I/61ypNMyv9LL._UL1500_.jpg'))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(children: [
                            Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'productDetail.title',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ),
                                        Text(
                                          'productDetail.description',
                                          style: TextStyle(
                                              color: Colors.white70, fontSize: 16),
                                        ),
                                        Text(
                                          '123,34',
                                          style: TextStyle(
                                              color: Color(0xffFB365F),
                                              fontSize: 16),
                                        ),
                                      ]),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '#summer',
                                        style: TextStyle(
                                          color:Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Amount:',
                                        style: TextStyle(
                                            color:Theme.of(context).accentColor,
                                          letterSpacing: 2,
                                          fontSize: 21,
                                          fontWeight:FontWeight.bold
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 60,
                                          width: 60 ,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Theme.of(context).accentColor,width: 2),
                                              borderRadius:
                                              BorderRadius.circular(30),

                                          ),
                                          child: Center(
                                            child: Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Theme.of(context).accentColor,
                                                  fontSize: 21,
                                                  fontWeight:
                                                  FontWeight.bold
                                              ),
                                            ),
                                          ),
                                      ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ]
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ]),
      ),
    );
  }
}
