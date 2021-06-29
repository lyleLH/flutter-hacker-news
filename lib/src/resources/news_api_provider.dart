import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'repository.dart';
import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = new Client();

  Future<List<int>> fetchTopIds() async {
    /// ;
    Uri uri1 = Uri.https('$_root/topstories.json', "");
    final response = await client.get(uri1);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    Uri uri1 = Uri.https('$_root/item/$id.json', "");
    final response = await client.get(uri1);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
