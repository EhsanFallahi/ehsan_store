import 'package:ehsan_store/controller/admin_controller/AdminController.dart';
import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/AdminItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdminScreen extends StatelessWidget {
  AdminController get _adminController => Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AdminController>(() => AdminController());
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
        appBar: appBar,
        body: Obx(() {
          return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
                ),
              ),
              child: Form(
                key: _adminController.formKey,
                child: SingleChildScrollView(
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
                        controller: _adminController.usernameController,
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
                            borderSide:
                                BorderSide(color: Colors.white70, width: 3),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Obx(
                        () => TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText:
                              !_adminController.changeDisplayPassword.value,
                          controller: _adminController.passwordController,
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
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 3),
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                icon: Obx(
                                  () => Icon(
                                    // Based on passwordVisible state choose the icon
                                    _adminController.changeDisplayPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: SECONDARY_COLOR,
                                  ),
                                ),
                                onPressed: () {
                                  if (_adminController
                                          .changeDisplayPassword.value ==
                                      true) {
                                    _adminController
                                        .changeDisplayPassword(false);
                                  } else {
                                    _adminController
                                        .changeDisplayPassword(true);
                                  }
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 140,
                      child: ElevatedButton(
                        child: Text('Add'),
                        onPressed: () {
                          if (_adminController.formKey.currentState
                              .validate()) {
                            _adminController.registerAdmin(Admin(
                                userName: _adminController
                                    .usernameController.text
                                    .trim()
                                    .toLowerCase(),
                                password: _adminController
                                    .passwordController.text
                                    .trim()
                                    .toLowerCase(),
                                roll: 'admin'));
                            _adminController.getALLAdmins();
                          } else
                            return;
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xfF0496E2)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                      ),
                    ),
                    SizedBox(
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20,right:20),
                              child: Divider(
                                color: SECONDARY_COLOR,
                              ),
                            );
                          },
                          key: UniqueKey(),
                          itemCount: _adminController.tempListAdmins.length,
                          itemBuilder: (context, i) => Container(
                            child: ListTile(
                              title: Text(
                                _adminController.tempListAdmins[i].userName
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),

                            ),


                          ),

                        ),
                      ),
                    )
                  ]),
                ),
              )
          );
        }
        )
    );
  }
  //
}
