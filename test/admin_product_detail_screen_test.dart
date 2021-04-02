import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
    await tester.pumpWidget(AdminProductDetailScreen());

    expect(find.text('Product Details'), findsOneWidget);
    expect(find.text('Amount'), findsOneWidget);
    expect(find.text('Add Product'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(
        find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
  });
  testWidgets('drawer test', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const welcomeText = "Welcome";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: const Text(welcomeText),
        ),
      ),
    );
    scaffoldKey.currentState.openDrawer();
    await tester.pump();
    expect(find.text(welcomeText), findsOneWidget);
  });
}
