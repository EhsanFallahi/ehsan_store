import 'package:ehsan_store/controller/admin_controller/admin_product_controller/AdminController.dart';
import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/AdminItem.dart';
import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:ehsan_store/widgets/UserNameTextFormField.dart';
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
          return
            mainBody(context);
        }
        )
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
              ),
            ),
            child: Form(
              key: _adminController.adminFormKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  HeaderWithoutSearch(title: 'Add Admin',),
                  UserNameTextFormField(controller: _adminController.usernameController,),
                  PasswordTextFormField(adminController: _adminController),
                  SizedBox(
                    height: 40,
                    width: 140,
                    child: AddAdminButton(),
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
                            trailing: IconButton(
                              icon: Icon(Icons.delete_forever_rounded,color:SECONDARY_COLOR),
                              onPressed: (){
                                _adminController.deleteAdmin(Admin(
                                  id:  _adminController.tempListAdmins[i].id,
                                  userName:  _adminController.tempListAdmins[i].userName,
                                  password:  _adminController.tempListAdmins[i].password
                                ));
                                _adminController.getALLAdmins();
                              },
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

  ElevatedButton AddAdminButton() {
    return ElevatedButton(
      child: Text('Add'),
      onPressed: () {
        if (_adminController.adminFormKey.currentState.validate()) {
          _adminController.registerAdmin(Admin(
              userName:
                  _adminController.usernameController.text.trim().toLowerCase(),
              password:
                  _adminController.passwordController.text.trim().toLowerCase(),
              roll: 'admin'));
          _adminController.getALLAdmins();
        } else
          return;
      },
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ))),
    );
  }
  //
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key key,
    @required AdminController adminController,
  }) : _adminController = adminController, super(key: key);

  final AdminController _adminController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}




