import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'app.dart';
import 'core/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver(); /// Observes state changes

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}
