import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(

        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://5.imimg.com/data5/SELLER/Default/2020/8/IM/UF/KR/58076618/new-product-500x500.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        )),
                    Text(
                      'Profile Name',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Setting',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.tag,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Favorites',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
            Divider(
              color: Colors.white70,
              height: 1,
            ),
            ListTile(
              leading: Icon(Icons.app_blocking_outlined,color: Colors.black,),
              onTap: (){},
              title: Text(
                'About Us',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
