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
          const NativeView(
            height: 100,
            viewType: 'test1',
            creationParams: {},
          ),
          // SizedBox(
          //   height: 100,
          //   child: InkWell(
          //     onTap: () {
          //       debugPrint('Gesture Detected');
          //     },
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NativeView(
                  height: 100,
                  viewType: 'test2',
                  creationParams: {'index': index},
                );
                // return SizedBox(height: 100, child: Text('Item $index'));
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
