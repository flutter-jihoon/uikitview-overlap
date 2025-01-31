//
//  TestNativeView1.swift
//  Runner
//
//  Created by 임지훈 on 6/27/24.
//

import Flutter
import UIKit

class TestNativeViewFactory1: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return TestNativeView1(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class TestNativeView1: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView) {
        _view.backgroundColor = UIColor.black
        
        let nativeLabel = UILabel()
        nativeLabel.text = "상단 네이티브 뷰"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        _view.addSubview(nativeLabel)
        
        nativeLabel.centerXAnchor.constraint(equalTo: _view.centerXAnchor).isActive = true
        nativeLabel.centerYAnchor.constraint(equalTo: _view.centerYAnchor).isActive = true
        
        // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        _view.addGestureRecognizer(tapGestureRecognizer)
        _view.isUserInteractionEnabled = true
    }

    
    @objc func viewTapped() {
        if let url = URL(string: "https://www.example.com/1") {
            UIApplication.shared.open(url)
        }
    }
}
