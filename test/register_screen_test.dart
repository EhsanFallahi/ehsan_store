
import 'package:ehsan_store/screens/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(RegisterationScreen());

    expect(find.text('User Name'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('submit to dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(RegisterationScreen());
    final Finder userName = find.widgetWithText(TextFormField, 'User Name');
    final Finder password = find.widgetWithText(TextFormField, 'Password');
    final Finder confirmPassword = find.widgetWithText(TextFormField, 'Confirm Password');
    final Finder submit = find.widgetWithText(ElevatedButton, 'Register');


    await tester.enterText(userName, 'rezafallahi');
    await tester.enterText(password, '3926988');
    await tester.enterText(confirmPassword, '3926988');

    await tester.tap(submit);
    await tester.pump();

    Future.delayed(Duration(seconds: 2));
    expect(find.byIcon(Icons.shopping_cart_sharp), findsOneWidget);
  });


}
