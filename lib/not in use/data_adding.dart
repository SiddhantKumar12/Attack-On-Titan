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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(hintText: 'name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: rank,
                    decoration: InputDecoration(hintText: 'rank'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: description,
                    decoration: InputDecoration(hintText: 'description'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: height,
                    decoration: InputDecoration(hintText: 'height'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: history,
                    decoration: InputDecoration(hintText: 'histroy'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: image,
                    decoration: InputDecoration(hintText: 'image'),
                  ),
                  TextFormField(
                    controller: extra,
                    decoration: InputDecoration(hintText: 'extra'),
                  ),
                  SizedBox(height: 10),
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
                      child: Text('submit')),
                ],
              ),
            ),
          ),
        ));
  }
}
