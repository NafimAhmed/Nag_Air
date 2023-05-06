
import 'dart:convert';

import 'package:http/http.dart' as http;



class Callapi{

  final String _url="https://nag-air-server.vercel.app/api/signup";

  postData(data,apiUrl){

   return http.post(
        Uri.parse(_url),
      body: jsonEncode(data),
     headers: _setHeaders()
    );




  }

  _setHeaders()=>{
    'Content-type':"application/json",
    'Accept':"application/json"
  };


}