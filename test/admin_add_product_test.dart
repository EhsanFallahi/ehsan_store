import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/admin/add_product/AddProductAdminScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(AddProductAdminScreen());

    expect(find.text('Add Product'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.byIcon( Icons.add_a_photo_rounded), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(5));
  });

}
