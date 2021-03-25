import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatelessWidget {
  // TodoController myController=Get.put(TodoController());
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userName = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    // myController.getUser().then((value){
    //   var a=User.fromJson(value.data[0]);
    //   userName=a.userName;
    //   password=a.password;
    // });

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF474546), Color(0xfF000000)],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child:
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 10,
                              fontSize: 35),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        style: TextStyle(color: Color(0xfF0496E2)),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length < 6) {
                            return 'Must be more than 6 charater';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white70,
                                width: 3),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child:
                      // Obx(()=>
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // obscureText: !myController.changeDisplayPassword.value,
                        controller: passwordController,
                        maxLength: 10,
                        style: TextStyle(color: Color(0xfF0496E2)),
                        validator: (value) {
                          // if (value.isEmpty) {
                          //   return 'Please enter some text';
                          // }
                          // if (value.length < 8) {
                          //   return 'Must be more than 8 charater';
                          // } else
                          //   return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white70,
                                width: 3),
                          ),
                          labelText: 'Password',
                          // suffixIcon: IconButton(
                          //     icon: Obx(()=>Icon(
                          //       // Based on passwordVisible state choose the icon
                          //       myController.changeDisplayPassword.value
                          //           ? Icons.visibility
                          //           : Icons.visibility_off,
                          //       color: Theme.of(context).primaryColorDark,
                          //     ),
                          //     ),
                          //     onPressed: () {
                          //       // if(myController.changeDisplayPassword.value==true){
                          //       //   myController.changeDisplayPassword(false);
                          //       // }else{
                          //       //   myController.changeDisplayPassword(true);
                          //       // }
                          //     }
                          //     )
                        ),
                      ),
                      // ),
                    ),Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child:
                      // Obx(()=>
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // obscureText: !myController.changeDisplayPassword.value,
                        controller: passwordController,
                        onTap: (){},
                        maxLength: 10,
                        style: TextStyle(color: Color(0xfF0496E2)),
                        validator: (value) {
                          // if (value.isEmpty) {
                          //   return 'Please enter some text';
                          // }
                          // if (value.length < 8) {
                          //   return 'Must be more than 8 charater';
                          // } else
                          //   return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white70,
                                width: 3),
                          ),
                          labelText: 'Confirm Password',
                          // suffixIcon: IconButton(
                          //     icon: Obx(()=>Icon(
                          //       // Based on passwordVisible state choose the icon
                          //       myController.changeDisplayPassword.value
                          //           ? Icons.visibility
                          //           : Icons.visibility_off,
                          //       color: Theme.of(context).primaryColorDark,
                          //     ),
                          //     ),
                          //     onPressed: () {
                          //       // if(myController.changeDisplayPassword.value==true){
                          //       //   myController.changeDisplayPassword(false);
                          //       // }else{
                          //       //   myController.changeDisplayPassword(true);
                          //       // }
                          //     }
                          //     )
                        ),
                      ),
                      // ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                 Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox(
                        width: 140,
                        height: 30,
                        child: ElevatedButton(
                          child: Text('Register'),
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
                          onPressed: () {
                            if (_formKey.currentState.validate() &&
                                !validateUserName() &&
                                !validatePassword()) {
                              Get.snackbar('User Not Found!',
                                  'Please enter the information correctly',
                                  snackPosition: SnackPosition.BOTTOM,
                                  margin: EdgeInsets.all(8),
                                  colorText: Colors.redAccent,
                                  backgroundColor: Colors.black87);
                            } else if (_formKey.currentState.validate() &&
                                validateUserName() &&
                                validatePassword()) {
                              // Get.off(TodoList());

                              Get.snackbar(
                                  'Hi Dear $userName', 'Welcome to ToDo App',
                                  snackPosition: SnackPosition.BOTTOM,
                                  margin: EdgeInsets.all(8),
                                  colorText: Colors.green,
                                  backgroundColor: Colors.black87);
                            } else {
                              return;
                            }
                          },
                        )
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  bool validateUserName() {
    if (nameController.text.toLowerCase().trim() == userName) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword() {
    if (passwordController.text.toLowerCase().trim() == password) {
      return true;
    } else {
      return false;
    }
  }
}
