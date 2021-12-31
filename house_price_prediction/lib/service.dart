import 'package:http/http.dart' as http;

getPredictions(houseInfo) async{
  try {
    print(houseInfo.toString());
    var response = await http.post(
        Uri.parse("http://10.0.2.2:5000/getpredictions"),
        body: {
          "county": houseInfo["county"],
          "area": houseInfo["area"].toString(),
          "room_count": houseInfo["room_count"][0],
          "building_age": houseInfo["building_age"][0],
          "bath_count": houseInfo["bath_count"].toString(),
          "heating_type": houseInfo["heating_type"][0],
          "balcony": houseInfo["balcony"][0],
          "ware": houseInfo["ware"][0],
          "site": houseInfo["site"][0]
        });
    print(response.body);
  }
  catch (e) {
    print(e);
  }

  // print(response.body.runtimeType.toString());
}