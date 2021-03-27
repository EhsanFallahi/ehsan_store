import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              letterSpacing: 1,
              fontSize: 12,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(4),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                letterSpacing: 1,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
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
                'Product Edit',
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
                  height: MediaQuery.of(context).size.height * 0.4,
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
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete_forever_rounded,
                                        color: Theme.of(context).accentColor,
                                        size: 50,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                        Icons.visibility_off,
                                        color: Theme.of(context).accentColor,
                                        size: 50,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.add,
                                            ),
                                            color: Colors.white,
                                            onPressed: () {},
                                          ),
                                          Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.white24),
                                                borderRadius:
                                                    BorderRadius.circular(11)),
                                            child: Center(
                                              child: Text(
                                                '12',
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            color: Colors.white,
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 3) {
                      return 'Must be more than 3 charater';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Title',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 20) {
                      return 'Must be more than 20 charater';
                    } else
                      return null;
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Description',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   if (value.length < 20) {
                  //     return 'Must be more than 20 charater';
                  //   } else
                  //     return null;
                  // },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 10) {
                      return 'Must be more than 10 charater';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Tag',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 160,
                  padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xfF0496E2)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // controller: nameController,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   if (value.length < 20) {
                    //     return 'Must be more than 20 charater';
                    //   } else
                    //     return null;
                    // },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white70, width: 3),
                      ),
                      labelText: 'Amount',
                    ),
                  ),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
