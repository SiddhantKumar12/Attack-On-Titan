import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TitansDetailScreenFirebase extends StatefulWidget {
  final String name;
  final String height;
  final String image;
  final String description;

  TitansDetailScreenFirebase(
      {required this.name,
      required this.image,
      required this.description,
      required this.height});

  @override
  _TitansDetailScreenFirebaseState createState() =>
      _TitansDetailScreenFirebaseState();
}

class _TitansDetailScreenFirebaseState
    extends State<TitansDetailScreenFirebase> {
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
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(imageUrl: widget.image),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  widget.height,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      )),
    );
  }
}
