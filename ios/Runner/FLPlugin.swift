//
//  FLPlugin.swift
//  Runner
//
//  Created by 임지훈 on 6/27/24.
//

import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "test1")
        registrar.register(factory, withId: "test2")
    }
}
