import 'package:ehsan_store/main.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(LoginScreen());

    expect(find.text('User Name'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(OutlineButton), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('submit to dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(LoginScreen());
    final Finder userName = find.widgetWithText(TextFormField, 'User Name');
    final Finder password = find.widgetWithText(TextFormField, 'Password');
    final Finder submit = find.widgetWithText(ElevatedButton, 'Login');

    expect(find.text('dont submitted'), findsNothing);

    await tester.enterText(userName, 'rezafallahi');
    await tester.enterText(password, '3926988');

    await tester.tap(submit);
    await tester.pump();

    Future.delayed(Duration(seconds: 2));
    expect(find.byIcon(Icons.shopping_cart_sharp), findsOneWidget);
  });

  testWidgets('submit form to adminPanel', (WidgetTester tester) async {
    await tester.pumpWidget(LoginScreen());
    final Finder userName = find.widgetWithText(TextFormField, 'User Name');
    final Finder password = find.widgetWithText(TextFormField, 'password');
    final Finder submit = find.widgetWithText(OutlineButton, 'Register');

    expect(find.text('dont submitted'), findsNothing);

    await tester.enterText(userName, 'ehsanfallahi');
    await tester.enterText(password, '5968486');

    await tester.tap(submit);
    await tester.pump();

    Future.delayed(Duration(seconds: 2));
    expect(find.byIcon(Icons.exit_to_app_rounded), findsOneWidget);
  });

}
