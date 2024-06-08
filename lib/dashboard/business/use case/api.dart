import 'package:assessment/common/common%20widget/common_widget.dart';
import 'package:assessment/dashboard/data/modal/modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  var limit = 10;
  var offset = 0; // Offset to track the number of items fetched
  final baseUrl = 'https://fakestoreapi.com/products';
  bool isLoading = false;

  List<ProductModel> dataList = [];

  Future<void> fetchData(BuildContext context) async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();

      try {
        final url = Uri.parse('$baseUrl?limit=$limit&offset=$offset');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          List<ProductModel> fetchedData = ProductModel.fromRawJsonList(response.body);
          if (fetchedData.isNotEmpty) {
            dataList.addAll(fetchedData);
            offset += fetchedData.length; // Update offset
          }
          isLoading = false;
          notifyListeners();
        }else{
          isLoading = false;
          notifyListeners();
          CommonWidget.alertBox(context, title: 'Failed', content: 'Some error occurred', buttonText: 'ok');
        }
      } catch (e) {
        isLoading = false;
        notifyListeners();
        CommonWidget.alertBox(context, title: 'Failed', content: 'Some internal error occurred', buttonText: 'ok');
        print(e.toString());
      }

      isLoading = false;
      notifyListeners();
    }
  }
}




// import 'dart:convert';
//
// import 'package:assessment/dashboard/data/modal/modal.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiProvider extends ChangeNotifier{
//   var limit = 5;
//   final baseUrl = 'https://fakestoreapi.com/products?limit=';
//   bool isLoading = false;
//
//   List<ProductModel> dataList = [];
//
//   Future<void> fetchData() async{
//     isLoading = true;
//     notifyListeners();
//     try{
//       final url = Uri.parse('$baseUrl$limit');
//       final response = await http.get(url);
//       if(response.statusCode == 200){
//         dataList = ProductModel.fromRawJsonList(response.body);
//         isLoading = false;
//         notifyListeners();
//         print('-- ${dataList}');
//       }else{
//         isLoading = false;
//         notifyListeners();
//       }
//     }catch(e){
//       isLoading = false;
//       notifyListeners();
//       print(e.toString());
//     }
//   }
//
// }