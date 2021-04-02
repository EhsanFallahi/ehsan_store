import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/admin/add_admin/AddAdminScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(AddAdminScreen());

    expect(find.text('Add Admin'), findsOneWidget);
    expect(find.text('Admin List'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byIcon(Icons.delete_forever_rounded), findsOneWidget);
  });
}
