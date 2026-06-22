import 'dart:ui';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width > 600 ? 100.0 : 16.0,
        vertical: 8.0,
      ),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage("assets/images/citta-immagine_2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white.withValues(alpha: 0.2),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Benvenuti in City Explorer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color.fromARGB(249, 255, 249, 238),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Qui potrai esplorare varie città, aggiungere le tue preferite e molto altro...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(238, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
