import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  bool _isSelected = false;

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
                  'Setting',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 6,
                      color: Colors.white70),
                ),
              ),
            ),
            Column(
              children:[Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Language :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1,
                          color: Colors.white70),
                    ),
                    Column(
                      children: [
                        Text(
                          'FA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white70),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: _isSelected
                                    ? Theme.of(context).accentColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: _isSelected
                                    ? null
                                    : Border.all(
                                        color: Theme.of(context).accentColor,
                                        width: 2)),
                            child: _isSelected
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : null
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'EN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white70),
                        ),
                        GestureDetector(
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: _isSelected
                                      ? Theme.of(context).accentColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: _isSelected
                                      ? null
                                      : Border.all(
                                      color: Theme.of(context).accentColor,
                                      width: 2)),
                              child: _isSelected
                                  ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                                  : null
                          ),
                        )
                      ],
                    ),
                      ],
                    ),
              ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  child: Text('Edit Profile'),
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
              ),
            ), SizedBox(
                  width: 140,
                  height: 30,
                  child: OutlineButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Log Out'),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    borderSide:
                    BorderSide(color: Color(0xfF0496E2), width: 2),
                  ),
              ),
              ],

            ),

        ),
      );
  }
}
