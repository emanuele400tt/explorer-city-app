import 'package:explorer_city_app/presentation/screens/favorite_page.dart';
import 'package:explorer_city_app/widgets/city_card.dart';
import 'package:explorer_city_app/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:explorer_city_app/core/model/city.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<City> cities = [
    City(
      cityName: "Roma",
      cityImgPath: "assets/images/roma.jpg",
      description:
          "Roma, capitale dell'Italia, è una grande città cosmopolita con una storia artistica, architettonica e culturale che ha influenzato tutto il mondo e che risale a quasi 3000 anni fa.",
    ),
    City(
      cityName: "Siena",
      cityImgPath: "assets/images/siena.jpg",
      description:
          "Siena, città della Toscana, nel Centro Italia, si distingue per i suoi edifici medievali in mattoni.",
      alignImg: Alignment.topCenter,
    ),
    City(
      cityName: "Pisa",
      cityImgPath: "assets/images/pisa.jpg",
      description:
          "Pisa è una città italiana della Toscana conosciuta soprattutto per la celebre torre pendente.",
    ),
    City(
      cityName: "Firenze",
      cityImgPath: "assets/images/firenze.jpg",
      description:
          "Firenze, capoluogo della Toscana, ospita molti capolavori dell'arte e dell'architettura rinascimentale.",
    ),
  ];

  final List<City> favoriteCities = [];

  void toggleFavorite(City city) {
    setState(() {
      if (favoriteCities.contains(city)) {
        favoriteCities.remove(city);
      } else {
        favoriteCities.add(city);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City Explorer"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritePage(favoriteCities: favoriteCities),
                ),
              );
            },
          ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildGridView();
          } else {
            return _buildListView();
          }
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        HomeHeader(),
        ...cities.map(
          (city) => CityCard(
            cityName: city.cityName,
            cityImgPath: city.cityImgPath,
            description: city.description,
            imageAlignment: city.alignImg,
            isFavorite: favoriteCities.contains(city),
            onFavoriteToggle: () => toggleFavorite(city),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return ListView(
      children: [
        HomeHeader(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.15,
            ),
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return CityCard(
                cityName: city.cityName,
                cityImgPath: city.cityImgPath,
                description: city.description,
                imageAlignment: city.alignImg,
                isFavorite: favoriteCities.contains(city),
                onFavoriteToggle: () => toggleFavorite(city),
              );
            },
          ),
        ),
      ],
    );
  }
}
