

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imageviewer/apiService.dart';
import 'package:imageviewer/cubit/data_cubit.dart';
import 'package:imageviewer/dataScreen.dart';
import 'package:imageviewer/localdatabase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(ApiService(), DatabaseHelper())..loadData(),
      child: MaterialApp(
        title: 'Data Viewer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DataScreen(),
      ),
    );
  }
}
