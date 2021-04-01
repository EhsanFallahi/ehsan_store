import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: cancelButtonAppBar(),
      actions: [saveButtonAppBar()],
    );
    return Scaffold(
      appBar: appBar,
      body: mainBody(context),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: Column(
        children: [
          HeaderWithoutSearch(
            title: 'Setting',
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: selectLanguageItem(context),
              ),
            ],
          ),
          editProfileItem(),
          logoutItem(),
        ],
      ),
    );
  }

  SizedBox logoutItem() {
    return SizedBox(
      width: 140,
      height: 30,
      child: logoutButton(),
    );
  }

  OutlineButton logoutButton() {
    return OutlineButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: Text('Log Out'),
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide: BorderSide(color: Color(0xfF0496E2), width: 2),
    );
  }

  Padding editProfileItem() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: editProfileButton(),
    );
  }

  SizedBox editProfileButton() {
    return SizedBox(
      height: 40,
      width: 140,
      child: ElevatedButton(
        child: Text('Edit Profile'),
        onPressed: () {},
        style: buttonStyle(),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            roundedRectangleBorder()));
  }

  RoundedRectangleBorder roundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  Row selectLanguageItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        titleLanguage(),
        selecetFaItem(context),
        selectEnItem(context),
      ],
    );
  }

  Column selectEnItem(BuildContext context) {
    return Column(
      children: [titleEN(), handleBoxDecoration(context)],
    );
  }

  Column selecetFaItem(BuildContext context) {
    return Column(
      children: [
        titleFA(),
        handleBoxDecoration(context),
      ],
    );
  }

  Text titleEN() {
    return Text(
      'EN',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
    );
  }

  GestureDetector handleBoxDecoration(BuildContext context) {
    return GestureDetector(
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
                  : Border.all(color: Theme.of(context).accentColor, width: 2)),
          child: _isSelected
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null),
    );
  }

  Text titleFA() {
    return Text(
      'FA',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
    );
  }

  Text titleLanguage() {
    return Text(
      'Language :',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 1,
          color: Colors.white70),
    );
  }

  BoxDecoration gradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
      ),
    );
  }

  Padding saveButtonAppBar() {
    return Padding(
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
    );
  }

  Padding cancelButtonAppBar() {
    return Padding(
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
    );
  }
}
