import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;

  const PhotoDetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.image_not_supported,
                size: 100,
                color: Colors.grey,
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Title: $title',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'ID: $id',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
