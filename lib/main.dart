import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/user_bloc/user_cubit.dart';
import 'package:flutter_cubit/repository/user_repository.dart';
import 'package:flutter_cubit/widgets/user_details_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cubit',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => UserCubit(UserDataRepository()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1), () {
      context.read<UserCubit>().getUserDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Cubit Flutter Bloc"),
      ),
      body: Center(
        child: Container(
          color: Colors.orange,
          width: 200,
          height: 200,
          child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserError) {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is UserInitial) {
                return Text("No data yet!!");
              } else if (state is UserLoading) {
                return Text("No data yet!!");
              } else if (state is UserLoaded) {
                return UserDetailsWidget(userData: state.user);
              } else {
                return Text("Unknown");
              }
            },
          ),
        ),
      ),
    );
  }
}
