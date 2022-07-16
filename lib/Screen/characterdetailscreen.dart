import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final String name;
  final String rank;
  final String image;
  final String description;
  final String history;

  CharacterDetailScreen(
      {required this.name,
      required this.rank,
      required this.image,
      required this.description,
      required this.history});

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 300, width: 200,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 15),
            const Text(
              'about',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            const Text(
              'histroy',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              widget.history,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      )),
    );
  }
}
