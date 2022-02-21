import 'package:attack_on_titan/Screen/titansdetailScreenFirebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TitanScreenFirebase extends StatefulWidget {
  const TitanScreenFirebase({Key? key}) : super(key: key);

  @override
  _TitanScreenFirebaseState createState() => _TitanScreenFirebaseState();
}

class _TitanScreenFirebaseState extends State<TitanScreenFirebase> {
  final Stream<QuerySnapshot> characters = FirebaseFirestore.instance
      .collection('titan')
      .orderBy('date', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: characters,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.requireData;
          return ListView.builder(
              reverse: true,
              itemCount: data.size,
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              itemBuilder: (context, index) {
                // final titansData = titans[index];
                final titansData = data.docs[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TitansDetailScreenFirebase(
                        name: titansData['name'],
                        image: titansData['image'],
                        description: titansData['description'],
                        height: titansData['height'],
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Card(
                      elevation: 6,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedNetworkImage(
                                imageUrl: titansData['image'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: 360,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                alignment: Alignment.bottomLeft,
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.05),
                                        Colors.black.withOpacity(0.1),
                                        Colors.black.withOpacity(0.7),
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter),
                                ),
                                child: Text(
                                  titansData['name'],
                                  // "Titans",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 22),
                                ),
                                // color: Colors.black,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              titansData['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
