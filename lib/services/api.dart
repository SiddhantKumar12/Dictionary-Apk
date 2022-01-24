import 'package:flash_cards/models/api_model.dart';
import 'package:http/http.dart' as http;

class API {
  Future<List<DataModel>> getAPI() async {
    final url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/apple');
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }

    return dataModelFromJson(response.body);
  }
}
