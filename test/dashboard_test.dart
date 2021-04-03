import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(DashboardScreen());

    expect(find.text('Ehsan Store'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_sharp), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(1));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.widgetWithIcon(FloatingActionButton,  Icons.search_rounded), findsOneWidget);
  });

  testWidgets('drawer test', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const hiText = "Hi";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: const Text(hiText),
        ),
      ),
    );
    scaffoldKey.currentState.openDrawer();
    await tester.pump();
    expect(find.text(hiText), findsOneWidget);
  });
}
