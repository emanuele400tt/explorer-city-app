import 'package:explorer_city_app/presentation/screens/city_details_page.dart';
import 'package:flutter/material.dart';
import 'package:explorer_city_app/core/model/city.dart';

class FavoritePage extends StatelessWidget {
  final List<City> favoriteCities;

  const FavoritePage({super.key, required this.favoriteCities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Le mie preferite ❤️")),
      body: favoriteCities.isEmpty
          ? const Center(
              child: Text(
                "Nessuna città aggiunta tra i preferito",
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: favoriteCities.length,
              itemBuilder: (context, index) {
                final city = favoriteCities[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(city.cityImgPath),
                  ),
                  title: Text(city.cityName),
                  subtitle: const Text("Tocca per i dettagli"),
                  trailing: const Icon(Icons.favorite, color: Colors.red),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityDetailsPage(
                          cityName: city.cityName,
                          cityImgPath: city.cityImgPath,
                          description: city.description,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
