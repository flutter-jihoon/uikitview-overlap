import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        weak var registrar = self.registrar(forPlugin: "plugin")

        self.registrar(forPlugin: "plugin2")!.register(
            TestNativeViewFactory2(messenger: registrar!.messenger()),
            withId: "test2")
        self.registrar(forPlugin: "plugin1")!.register(
            TestNativeViewFactory1(messenger: registrar!.messenger()),
            withId: "test1")

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
