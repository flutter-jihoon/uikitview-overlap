import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        title: const Text('UiKitView Overlap Test'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            // child: const UiKitView(
            //   viewType: 'test1',
            //   layoutDirection: TextDirection.ltr,
            //   creationParams: {},
            //   creationParamsCodec: StandardMessageCodec(),
            // ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[400],
                  ),
                  // child: const UiKitView(
                  //   viewType: 'test2',
                  //   layoutDirection: TextDirection.ltr,
                  //   creationParams: {},
                  //   creationParamsCodec: StandardMessageCodec(),
                  // ),
                );
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
