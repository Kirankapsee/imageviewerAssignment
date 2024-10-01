import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Item_model.dart';

class ApiService {
  static const String apiUrl = 'https://testffc.nimapinfotech.com/testdata.json';

  Future<List<ItemModel>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<ItemModel> items =
            List<ItemModel>.from(data['data']['Records'].map((x) => ItemModel.fromJson(x)));
        return items;
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}
