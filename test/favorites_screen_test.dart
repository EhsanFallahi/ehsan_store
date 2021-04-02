import 'package:ehsan_store/main.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'dart:html';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  testWidgets('tester', (WidgetTester tester) async {
    await tester.pumpWidget(FavoritesScreen());
    expect(find.text('Your Favorites'), findsOneWidget);
    expect(find.byWidget(ListView()), findsOneWidget);
  });

}
