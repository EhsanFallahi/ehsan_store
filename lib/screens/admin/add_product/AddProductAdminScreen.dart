import 'package:flutter/material.dart';

class AddProductAdminScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
            ),
          ),
          child: Column(
            children: [
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
                    'Add Product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 6,
                        color: Colors.white70),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 70,
                      child: ClipOval(
                        child: Image.asset(
                          '',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              color: Theme.of(context).accentColor,
                            ),
                            color: Colors.white,
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
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
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
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
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
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
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
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
                  padding: EdgeInsets.only(left: 15,right: 15,top: 8),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
