import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:imageviewer/Item_model.dart';
import 'package:imageviewer/apiService.dart';
import 'package:imageviewer/localdatabase.dart';

abstract class DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<ItemModel> items;
  DataLoaded(this.items);
}

class DataError extends DataState {
  final String message;
  DataError(this.message);
}