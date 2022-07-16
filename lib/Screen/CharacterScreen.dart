import 'package:attack_on_titan/Screen/characterdetailscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final Stream<QuerySnapshot> characters = FirebaseFirestore.instance
      .collection('characters')
      .orderBy('date', descending: false)
      .snapshots();
  // Query collectionReference = FirebaseFirestore.instance.collection("Events").orderBy('date');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: characters,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.requireData;
        return ListView.builder(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          itemCount: data.size,
          itemBuilder: (context, index) {
            final characterData = data.docs[index];
            return GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CharacterDetailScreen(
                  name: characterData['name'],
                  rank: characterData['rank'],
                  image: characterData['image'],
                  description: characterData['description'],
                  history: characterData['history'],
                );
              })),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 20,
                        child: Card(
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 180,
                            width: 140,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: characterData['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                    Positioned(
                      top: 30,
                      left: 185,
                      child: Container(
                        height: 150,
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              characterData['name'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              characterData['rank'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Divider(thickness: 2),
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
