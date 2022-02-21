import 'package:attack_on_titan/Provider/theme_provider.dart';
import 'package:attack_on_titan/Screen/AOT_Screen.dart';
import 'package:attack_on_titan/Screen/CharacterScreen.dart';
import 'package:attack_on_titan/Screen/aot_quiz.dart';
import 'package:attack_on_titan/Screen/titanScreenFirebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return DefaultTabController(
      // initialIndex: 3,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: Theme.of(context).textTheme.bodyText1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'News App',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 22),
                // style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: (themeProvider.themeMode == ThemeMode.light)
                  ? Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    )
                  : Icon(Icons.light_mode),
            ),
          ],
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  "Titan ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "characters",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "quiz",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TitanScreenFirebase(),
            CharacterScreen(),
            AotQuiz(),
          ],
        ),
      ),
    );
  }
}
