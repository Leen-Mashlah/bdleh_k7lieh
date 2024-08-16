import 'dart:convert';

import 'package:flutter_web_dashboard/constants/api_constant.dart';
import 'package:flutter_web_dashboard/controllers/api_controller/modle.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class ComplaintsController extends GetxController {

  RxList<Complain> complaintsList = <Complain>[].obs;
void complaintsData()async{

  print("66666666666666666666666");


  var headers = {
  'Accept': 'application/json'
};
var request = await  http.Request('GET', Uri.parse('${baseUrl}complains'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

var responseComplain=  await http.Response.fromStream(response);
 
  var responsebody = jsonDecode(responseComplain.body)['data'];
  

print(responsebody);


  


if (response.statusCode == 200) {
      List<Data> dataList =[];
       for(int b=0;b<responsebody.length;b++){
       dataList.add(Data.fromJson(responsebody[b]));
     }
    complaintsList.add(Complain(data: dataList, message: ''));

}
else {
  print("55555555555555555555555555");
  print(response.reasonPhrase);
}

}
@override
  void onInit() {
    complaintsData();
    super.onInit();
  }



}