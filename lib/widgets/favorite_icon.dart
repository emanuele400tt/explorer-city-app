import 'package:flutter/material.dart';

// creazione icona personalizzata per i preferiti
class FavoriteIcon extends StatefulWidget {
  // per salvare lo stato e la funzione di callback
  final bool isFavorite;
  final VoidCallback onTap;

  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  double _scale = 1.0;

  void _playAnimation() {
    setState(() {
      _scale = 1.5;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _scale = 1.0;
        });
      }
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _playAnimation,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Icon(
          widget.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.isFavorite ? Colors.red : Colors.grey[800],
          size: 30,
        ),
      ),
    );
  }
}
