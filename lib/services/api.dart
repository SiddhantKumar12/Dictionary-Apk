import '../models/api_model.dart';
import 'package:http/http.dart' as http;

class API {
  List<String>? words;
  // = ['Apple','grape']

  API() {
    getListData();
    // remove 8-11 line
  }

  Future<List<DataModel>> getAPI(String word) async {
    final url = Uri.parse(
      'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
    );
    var response =
        await http.get(url, headers: {"access-control-allow-origin": "*"});

    if (response.statusCode == 404) {
      return [];
    } else if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }
    return dataModelFromJson(response.body);
  }

  Future<void> getListData() async {
    final url = Uri.parse(
      'https://raw.githubusercontent.com/meetDeveloper/freeDictionaryAPI/master/meta/wordList/english.txt',
    );
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }
    words = response.body.split(' ');
  }
}
