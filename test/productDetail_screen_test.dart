import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:ehsan_store/screens/product_detail/ProductDetailScreen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(ProductDetailScreen());

    expect(find.text('Price'), findsOneWidget);
    expect(find.text('Buy'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.add_shopping_cart_rounded), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(FavoriteButton), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));
  });
  testWidgets('counter incrase', (WidgetTester tester) async {

    await tester.pumpWidget(ProductDetailScreen());
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('counter decrase', (WidgetTester tester) async {

    await tester.pumpWidget(ProductDetailScreen());
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

}
