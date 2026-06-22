import 'package:explorer_city_app/presentation/screens/info_tour_page.dart';
import 'package:flutter/material.dart';

class CityDetailsPage extends StatelessWidget {
  final String cityName;
  final String cityImgPath;
  final String description;

  const CityDetailsPage({
    super.key,
    required this.cityName,
    required this.cityImgPath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cityName)),
      body: Column(
        children: [
          Hero(
            tag: 'tag_image_$cityName',
            child: Image.asset(
              cityImgPath,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(description, style: const TextStyle(fontSize: 18.0)),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoTourPage(cityName: cityName),
                ),
              );
            },
            icon: const Icon(Icons.info_outline, color: Colors.white),
            label: const Text("Richiedi Informazioni Tour"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
