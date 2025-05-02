import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyApp/myapp.dart';
import '../data_static/provider/providerGlopal.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ProviderGlobal(),
      child: const Myapp()));
}

