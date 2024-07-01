//
//  TestNativeView2.swift
//  Runner
//
//  Created by 임지훈 on 6/28/24.
//

import Flutter
import UIKit

class TestNativeViewFactory2: NSObject, FlutterPlatformViewFactory {
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
        return TestNativeView2(
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

class TestNativeView2: NSObject, FlutterPlatformView {
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
        if let creationParams = args as? [String: Any],
           let index = creationParams["index"] as? Int {
            createNativeView(view: _view, index: index)
        } else {
            createNativeView(view: _view, index: 0) // Default to index 0 if not provided
        }
    }
    
    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView, index: Int) {
        // Change background color based on whether the index is odd or even
        if index % 2 == 0 {
            _view.backgroundColor = UIColor.systemBlue // Even index
        } else {
            _view.backgroundColor = UIColor.systemRed // Odd index
        }
        
        let nativeLabel = UILabel()
        nativeLabel.text = "리스트 네이티브 뷰"
        nativeLabel.textColor = UIColor.black
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
        if let url = URL(string: "https://www.example.com/2") {
            UIApplication.shared.open(url)
        }
    }
}
