import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPlantData();

  }

fetchPlantData()async{
  final apiKey='a-qc_c3M7doZdBVJxi5cAua8eMzxVCnmk3dj0odWf3s';
  final uri=Uri.parse('https://trefle.io/api/v1/plants?token=$apiKey');

  final response=await http.get(uri);
  if (response.statusCode == 200) {
    // Parse and handle the response data
    print(response.body);
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}