import 'package:explorer_city_app/widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:explorer_city_app/presentation/screens/city_details_page.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final String cityImgPath;
  final String description;
  final AlignmentGeometry imageAlignment;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CityCard({
    super.key,
    required this.cityName,
    required this.cityImgPath,
    required this.description,
    this.imageAlignment = Alignment.center,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: 'tag_image_$cityName',
            child: Image.asset(
              cityImgPath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
              alignment: imageAlignment,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        cityName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      FavoriteIcon(
                        isFavorite: isFavorite,
                        onTap: onFavoriteToggle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Flexible(
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Stai visualizzando i dettagli di $cityName",
                          ),
                          duration: const Duration(seconds: 4),
                          backgroundColor: Colors.blueAccent,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityDetailsPage(
                            cityName: cityName,
                            cityImgPath: cityImgPath,
                            description: description,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Scopri di più",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
