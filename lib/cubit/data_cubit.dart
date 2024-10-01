import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imageviewer/apiService.dart';
import 'package:imageviewer/localdatabase.dart';
import 'package:imageviewer/cubit/data_state.dart';
import 'package:imageviewer/Item_model.dart';

class DataCubit extends Cubit<DataState> {
  final ApiService apiService;
  final DatabaseHelper databaseHelper;

  DataCubit(this.apiService, this.databaseHelper) : super(DataLoading());

  void loadData() async {
    try {
      // First, try to load data from the API
      final List<ItemModel>? apiItems = await apiService.fetchData();

      // If data is fetched from API, save it in local database
      await databaseHelper.insertItems(apiItems!);

      // Emit DataLoaded with API data
      emit(DataLoaded(apiItems));
    } catch (e) {
      // If API call fails, attempt to load data from local database
      final List<ItemModel> localItems = await databaseHelper.getItems();
      if (localItems.isNotEmpty) {
        // Emit DataLoaded with local data if available
        emit(DataLoaded(localItems));
      } else {
        // If both API and local data fail, emit DataError
        // Emit DataError if both API and local data fail
        emit(DataError("Failed to load data. Please check your connection."));
      }
    }
  }
}
