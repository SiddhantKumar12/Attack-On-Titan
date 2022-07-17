import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddingData extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController rank = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController history = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController extra = TextEditingController();

  AddingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(hintText: 'name'),
                ),
                TextFormField(
                  controller: rank,
                  decoration: const InputDecoration(hintText: 'rank'),
                ),
                TextFormField(
                  controller: description,
                  decoration: const InputDecoration(hintText: 'description'),
                ),
                TextFormField(
                  controller: height,
                  decoration: const InputDecoration(hintText: 'height'),
                ),
                TextFormField(
                  controller: history,
                  decoration: const InputDecoration(hintText: 'histroy'),
                ),
                TextFormField(
                  controller: image,
                  decoration: const InputDecoration(hintText: 'image'),
                ),
                TextFormField(
                  controller: extra,
                  decoration: const InputDecoration(hintText: 'extra'),
                ),
                FlatButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        'date': DateTime.now(),
                        'name': name.text.trim(),
                        'rank': rank.text.trim(),
                        'description': description.text.trim(),
                        'height': height.text.trim(),
                        'history': history.text.trim(),
                        'image': image.text.trim(),
                        'extra': extra.text.trim(),
                      };
                      FirebaseFirestore.instance
                          .collection('characters')
                          .add(data);
                    },
                    child: const Text('submit')),
              ],
            ),
          ),
        ));
  }
}
