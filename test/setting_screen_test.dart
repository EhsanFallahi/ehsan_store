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

    expect(find.text('Setting'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('FA'), findsOneWidget);
    expect(find.text('EN'), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));
  });
}
