import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'places_response.dart';

class PlacesProvider extends ChangeNotifier {
  bool isLoading = false;

  Places? placesResponseModel;
  String? token;

  void updateToken(String value) {
    token = value;

    print("token is $token");

    getServices();
  }

  Future getServices() async {
    isLoading = true;

    Response placesResponse =
        await get(Uri.parse("http://alcaptin.com/api/places"), headers: {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hbGNhcHRpbi5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NjM3ODU4NTQsIm5iZiI6MTY2Mzc4NTg1NCwianRpIjoicWNvTXlwdzRvQzY2WTkzQiIsInN1YiI6MTgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.HVNtKdMgGwI5Pfrg33N9KRT2sFNkkdiOH62VJFq319w"
    });

    dynamic convertedJson = jsonDecode(placesResponse.body);

    placesResponseModel = Places.fromJson(convertedJson);

    isLoading = false;
    notifyListeners();
  }
}
