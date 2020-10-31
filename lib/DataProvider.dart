import 'package:http/http.dart';
import 'dart:convert';

class DataProvider {

    static getTbtcData() async {
    String url = 'http://167.99.255.192:3333/get_tbtc';
    Response response = await get(url);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      String json = response.body;
      Map<String, dynamic> data = jsonDecode(json);
      return data;
    }
    }

    static getKeepData() async {
      String url = 'http://167.99.255.192:3333/get_keep';
      Response response = await get(url);
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        String json = response.body;
        Map<String, dynamic> data = jsonDecode(json);
        return data;
      }
    }

    static getNews() async {
      String url = 'http://167.99.255.192:3333/get_news';
      Response response = await get(url);
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        String json = response.body;
        Map<String, dynamic> data = jsonDecode(json);
        return data;
      }
    }

    static getWallet() async {
      String url = 'http://167.99.255.192:3333/get_wallet';
      Response response = await get(url);
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        String json = response.body;
        Map<String, dynamic> data = jsonDecode(json);
        return data;
      }
    }

  }

