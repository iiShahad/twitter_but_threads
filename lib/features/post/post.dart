import 'package:flutter/material.dart';
import 'package:twitter_but_threads/features/post/theme.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Container(
              height: 50,
              width: 100,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: const Center(
                  child: Text('Post'),
                ),
              ),
            ),
            appBar: AppBar(
              leadingWidth: 40,
              leading: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
              centerTitle: false,
              elevation: 0.4,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TitleText(
                text: "New Thread",
                size: 20,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Expanded(
                                child: VerticalDivider(
                              thickness: 2,
                            )),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Opacity(
                                opacity: 0.6,
                                child: CircleAvatar(
                                  radius: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(text: "user name"),
                            TextField(
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                  hintText: "Start a thread...",
                                  border: InputBorder.none),
                            ),
                            Transform.rotate(
                                angle: 1,
                                child: IconButton(
                                    onPressed: () {
                                      final uodefile =
                                          FilePicker.platform.pickFiles();
                                    },
                                    icon: const Icon(
                                      Icons.attach_file,
                                      color: Colors.grey,
                                    ))),
                            Text(
                              "Add to thread",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
