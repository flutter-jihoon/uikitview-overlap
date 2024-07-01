package com.example.uikitview_overlap

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("test1", 
                                      TestNativeViewFactory1())
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("test2", 
                                      TestNativeViewFactory2())
    }
}