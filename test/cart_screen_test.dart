import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/cart/CartScreen.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(CartScreen());
    expect(find.text('Your Cart'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('Buy'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_sharp), findsOneWidget);

  });

  testWidgets('open dialog for purchase', (WidgetTester tester) async {
    await tester.pumpWidget(CartScreen());
    final Finder buy = find.widgetWithText(ElevatedButton, 'Buy');

    await tester.tap(buy);
    await tester.pump();

    Future.delayed(Duration(seconds: 1));
    expect(find.text('Purchase Confirmation'), findsOneWidget);
  });

}
