import 'package:attack_on_titan/Provider/theme_provider.dart';
import 'package:attack_on_titan/Screen/data_adding.dart';
import 'package:attack_on_titan/Screen/season_screen.dart';
import 'package:attack_on_titan/Screen/titanScreenFirebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CharacterScreen.dart';

class AOT_Screen extends StatefulWidget {
  const AOT_Screen({Key? key}) : super(key: key);

  @override
  _AOT_ScreenState createState() => _AOT_ScreenState();
}

class _AOT_ScreenState extends State<AOT_Screen> {
  Widget build(BuildContext context) {
    // ThemeProvider themeProvider =
    //     Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      body: ListView(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddingData();
              }));
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HomeCard(
                description: 'Description',
                title: 'Titans',
                imageUrl: 'assets/images/colossal.jpg',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TitanScreenFirebase(),
                    ),
                  );
                },
              ),
              _HomeCard(
                description: 'character description',
                title: 'character',
                imageUrl: 'assets/images/colossal.jpg',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterScreen(),
                    ),
                  );
                },
              ),
              _HomeCard(
                description: 'Season description',
                title: 'Season',
                imageUrl: 'assets/images/colossal.jpg',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeasonScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback ontap;

  _HomeCard(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 22, right: 20),
      child: Container(
        child: GestureDetector(
          onTap: ontap,
          child: Card(
            elevation: 6,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 170,
                      width: 360,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        title,
                        // "Titans",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 24),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
