import 'package:azkar_application_/Core/ReuseableWidgets/alertDialog.dart';
import 'package:azkar_application_/Presentation/Logic/bloc/azkar_bloc.dart';
import 'package:azkar_application_/Presentation/UI/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Core/DepndancyInjection/dependancy.dart' as db;

class AzkarApp extends StatefulWidget {
  const AzkarApp({Key? key}) : super(key: key);

  @override
  State<AzkarApp> createState() => _AzkarAppState();
}

class _AzkarAppState extends State<AzkarApp> {
  bool hasPermission = false;
  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 25,
              color: Color(0xff87854f),
              fontWeight: FontWeight.bold,
            )),
      ),
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (hasPermission) {
            return const Scaffold(
              body: MyWidget(),
            );
          } else {
            return message(
                message: 'Allow Permissions And Try Again', context: context);
          }
        },
        future: getPermission(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => db.db<AzkarBloc>()..add(GetAzanEvent()),
      )
    ], child: HomePage());
  }
}
