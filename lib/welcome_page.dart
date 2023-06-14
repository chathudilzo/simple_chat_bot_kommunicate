import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:simple_chat_bot/plant_class.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
bool _isLoading=true;

List<Plant>_plants=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPlantData();

  }


  List<Plant> parsePlants(String responseBody){
    final parsed=jsonDecode(responseBody)['data'] as List<dynamic>;
    return parsed.map<Plant>((json)=>Plant(id: json['id'],commonName: json['common_name'],scientificName: json['scientific_name'],imageUrl: json['image_url'])).toList();
  }

fetchPlantData()async{
  final apiKey='a-qc_c3M7doZdBVJxi5cAua8eMzxVCnmk3dj0odWf3s';
  final uri=Uri.parse('https://trefle.io/api/v1/plants?token=$apiKey');



  final response=await http.get(uri);
  if (response.statusCode == 200) {
    // Parse and handle the response data
    print(response.body);
    setState(() {
      _plants=parsePlants(response.body);
      _isLoading=false;
    });
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading?CircularProgressIndicator():ListView.builder(
      itemCount: _plants.length,
      itemBuilder: (context,index){
        final plant=_plants[index];
        return ListTile(
          title: Text(plant.commonName),
          subtitle: Text(plant.scientificName),
          leading: Image.network(plant.imageUrl),
        );
    }),
    );
    
  }
}