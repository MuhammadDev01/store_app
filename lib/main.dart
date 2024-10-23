import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit.dart';
import 'package:store_app/screens/home_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const StoreApp(),
    ),
  );
}

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("$bloc $change");
    super.onChange(bloc, change);
  }
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit()..getAllproducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routes: {
          HomePage.id: (context) => const HomePage(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
}
