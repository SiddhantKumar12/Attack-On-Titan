import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SeasonScreen extends StatefulWidget {
  const SeasonScreen({Key? key}) : super(key: key);

  @override
  _SeasonScreenState createState() => _SeasonScreenState();
}

class _SeasonScreenState extends State<SeasonScreen> {
  List<dynamic> season = [];
  List<dynamic> stateMasters = [];
  List<dynamic> states = [];

  String? seasonId;
  String? stateId;

  @override
  void initState() {
    super.initState();
    this.season.add({"id": 1, 'label': 'season1'});
    this.season.add({"id": 2, 'label': 'season2'});
    this.season.add({"id": 3, 'label': 'season3'});

    this.stateMasters = [
      {"id": 1, "name": "episode1", "ParentId": 1},
      {"id": 2, "name": "episode2", "ParentId": 1},
      {"id": 3, "name": "episode3", "ParentId": 1},
      {"id": 4, "name": "episode4", "ParentId": 2},
      {"id": 5, "name": "episode5", "ParentId": 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('season'),
          ),
          body: Column(
            children: [
              FormHelper.dropDownWidgetWithLabel(context, "season",
                  'select season', this.seasonId, this.season, (onChangedVal) {
                this.seasonId = onChangedVal;
                print('selected season: $onChangedVal');
                this.states = this
                    .stateMasters
                    .where((stateItem) =>
                        stateItem['ParentId'].toString() ==
                        onChangedVal.toString())
                    .toList();
                this.stateId = null;
              }, (onValidateVal) {
                if (onValidateVal == null) {
                  return ' Please Select Country';
                }
                return null;
              },
                  borderColor: Colors.orange,
                  borderRadius: 10,
                  borderFocusColor: Colors.black,
                  optionLabel: 'label',
                  optionValue: 'id'),
              FormHelper.dropDownWidgetWithLabel(context, 'episode',
                  'episode number', this.stateId, this.states, (onChanged) {
                this.stateId = onChanged;
                print('selected episode $onChanged');
              }, (onValidate) {
                return null;
              },
                  borderColor: Colors.orange,
                  borderRadius: 10,
                  borderFocusColor: Colors.black,
                  optionLabel: 'name',
                  optionValue: 'id'),
            ],
          )),
    );
  }
}
