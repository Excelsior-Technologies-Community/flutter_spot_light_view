import 'package:flutter/material.dart';
import '../spotlight/spotlight_view.dart';
import '../spotlight/spotlight_controller.dart';
import '../spotlight/spotlight_shape.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = SpotlightController();
  final sController = SpotlightController();
  final newController = SpotlightController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.start();
            },
            child: SpotlightView(
              shape: SpotlightShape.circle,
              controller: controller,
              title: "Title",
              description: "This is title",
              child: Text(
                'SpotLight View',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              sController.start();
            },
            child: SpotlightView(
              controller: sController,
              shape: SpotlightShape.roundedRectangle,
              title: "Description",
              color: Colors.lightBlueAccent,
              description: "This text is highlighted",
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity, // 🔥 IMPORTANT
                child: const Text(
                  "This is a long multi-line description text. "
                  "It can be spotlighted just like a button. "
                  "The spotlight hole will match the text size.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              newController.start();
            },
            child: SpotlightView(
              controller: newController,
              shape: SpotlightShape.rectangle,
              color: Colors.redAccent,
              title: 'title',
              description: "description",
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity, // 🔥 IMPORTANT
                child: const Text(
                  "This is a long multi-line description text. "
                      "It can be spotlighted just like a button. "
                      "The spotlight hole will match the text size.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
