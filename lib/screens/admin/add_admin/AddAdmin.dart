import 'package:flutter/material.dart';

class AddAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'Add Admin',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 6,
                        color: Colors.white70),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child:
                    // Obx(()=>
                    TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // obscureText: !myController.changeDisplayPassword.value,
                  // controller: passwordController,
                  maxLength: 10,
                  style: TextStyle(color: Color(0xfF0496E2)),
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
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
              ),
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  child: Text('Add'),
                  onPressed: (){},
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  // onPressed: () {
                  //   if (_formKey.currentState.validate() &&
                  //       !validateUserName() &&
                  //       !validatePassword()) {
                  //     Get.snackbar('User Not Found!',
                  //         'Please enter the information correctly',
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         margin: EdgeInsets.all(8),
                  //         colorText: Colors.redAccent,
                  //         backgroundColor: Colors.black87);
                  //   } else if (_formKey.currentState.validate() &&
                  //       validateUserName() &&
                  //       validatePassword()) {
                  //     // Get.off(TodoList());
                  //
                  //     Get.snackbar('Hi Dear $userName', 'Welcome to ToDo App',
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         margin: EdgeInsets.all(8),
                  //         colorText: Colors.green,
                  //         backgroundColor: Colors.black87);
                  //   } else {
                  //     return;
                  //   }
                  // },
                ),
              ),SizedBox(
                height: 12,
              ),
              Divider(
                height: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Admin List',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
              Container(
                width: 300,
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  title: Text(
                    'Ehsan Fallahi',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              )
            ])));
  }
}
