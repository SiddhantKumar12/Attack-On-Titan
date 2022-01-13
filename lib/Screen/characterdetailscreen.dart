import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final String name;
  final String rank;
  final String image;
  final String description;
  final String history;

  const CharacterDetailScreen(
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
      // appBar: AppBar(
      //   title: Text(
      //     widget.name,
      //     style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
      //   ),
      // ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: ListView(
          children: [
            Container(
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
            SizedBox(height: 15),
            Text(
              widget.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 15),
            Text(
              'about',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'histroy',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              widget.history,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )),
    );
  }
}
