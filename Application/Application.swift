import UIKit

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds)
        window!.backgroundColor = .groupTableViewBackground
        window!.makeKeyAndVisible()
        window!.rootViewController = View()
        return true
    }
}
