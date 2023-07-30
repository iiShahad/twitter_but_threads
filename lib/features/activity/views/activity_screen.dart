import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Activity",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                // borderWidth: 2,
                // borderColor: Colors.grey,
                //radius: 10,
                backgroundColor: Colors.white,
                unselectedBackgroundColor: Colors.black,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.black),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Requests",
                  ),
                  Tab(
                    text: "Replies",
                  ),
                  Tab(
                    text: "Mentions",
                  ),
                  Tab(
                    text: "Quotes",
                  ),
                  Tab(
                    text: "Reposts",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    // All(),
                    // Requests(),
                    // Replies(),
                    // Mentions(),
                    // Quotes(),
                    // Reposts(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
