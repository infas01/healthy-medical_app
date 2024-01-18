import 'package:flutter/material.dart';
import './global_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'pages/home_page.dart';

class Medreminder extends StatefulWidget {
  const Medreminder({super.key});

  @override
  State<Medreminder> createState() => _MyAppState();
}

class _MyAppState extends State<Medreminder> {
  // This widget is the root of your application.
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
          title: 'Pill Reminder',
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      }),
    );
  }
}
