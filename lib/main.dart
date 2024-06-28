import 'package:flutter/material.dart';
import 'package:uikitview_overlap/native_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UiKitView Overlap Test',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('UiKitView Overlap Test'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            child: const NativeView(
              height: 100,
              viewType: 'test1',
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const NativeView(
                  height: 50,
                  viewType: 'test2',
                );
              },
              itemCount: 100,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                  color: Colors.black,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
