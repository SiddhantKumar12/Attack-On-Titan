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
  final Stream<QuerySnapshot> characters =
      FirebaseFirestore.instance.collection('characters').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: characters,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.requireData;
            return ListView.builder(
                // reverse: true,
                itemCount: data.size,
                itemBuilder: (context, index) {
                  final characterData = data.docs[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                          // Positioned(
                          //     top: 35,
                          //     left: 20,
                          //     child: Material(
                          //       child: Container(
                          //         height: 100,
                          //         width: 90,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(0),
                          //         ),
                          //       ),
                          //     )),
                          Positioned(
                              top: 0,
                              left: 20,
                              child: Card(
                                elevation: 10,
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
                                    // image: const DecorationImage(
                                    //   fit: BoxFit.cover,
                                    //   image:
                                    //       AssetImage('assets/images/pic.jpg'),
                                    // ),
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      characterData['rank'],
                                      // 'null',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    const Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

// class FireStorageService extends ChangeNotifier {
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String Image) async {
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }
