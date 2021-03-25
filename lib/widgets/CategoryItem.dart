import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CircularAvatar.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool active;
  final String picture;

  CategoryItem({this.name,this.active,this.picture});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          active?Container(width: 50,height: 50,padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 1,
                color: Theme.of(context).accentColor
              )
            ),
            child: CircularAvatar(picture:picture),
          ):CircularAvatar(picture:picture),
          Padding(padding: EdgeInsets.all(8),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                  fontSize: 12,
                  fontWeight: active?FontWeight.bold:FontWeight.normal
              ),
            ),
          )
        ],
      ),
    );
  }
}
