//
//  AppDelegate.swift
//  HackerBooks
//
//  Created by Javier Contreras on 26/12/15.
//  Copyright © 2015 Ocon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    
    var model : JCOLibrary?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch
       // _ = self.window!.rootViewController as! palabrasTableViewController
        //self.window!.rootViewController as! palabrasTableViewController
        
            //let viewController = self.window!.rootViewController as! MasterViewController
        //let splitViewController = self.window!.rootViewController as! UISplitViewController
        //let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        //navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
     /*
        do {
    
                
                if let url = NSBundle.mainBundle().URLForResource("books_readable.json"),
                    data = NSData(contentsOfURL: url),
                    jsons = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray {
                        

                        return model = JCOLibrary(books: decode(JCOBooks: jsons))
            
        
            }
        
        }catch{
            
           // print("No hay manera")
            fatalError("No se ha podido crear el model")
        
        }*/
        
      //splitViewController.delegate = self
        

        // ----- Ejemplo de arrancar a los chucknorris  ------
        
        //1º. Creo mi storyBoard a manubrio
        let sb = UIStoryboard(name:"TableLibrary",bundle: nil)
        
        //2º. ontener ViewControllesr
        let rootVC = sb.instantiateInitialViewController()
        
        //3º. Crear una window , pasarle el ViewController y por último hacerlo visible
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        
        
            //  ----------- TDD PARA POBRES -----   (No me funciona...)
        
      /*  do {
            
            if let url = NSBundle.mainBundle().URLForResource("books_readable.json"),
                    data = NSData(contentsOfURL: url),
                    JsonBook = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray {
                        
                        
        
         /*
                        //Ver un JSONObject que este dentro del JSONArray
                        
                        // faltaria hacerme un inicilizador de books con el arrayOfBooks y asignarselo a gitJSON
                        let gitJSON =
                        
                        do{
                            
                            let stricGit = try decode(JCOBooks: gitJSON )
                            let ProGit = JCOBooks(stricGit)
        
                        }catch{
                        
                        print ("la cagastes al extraer el JSON")
                        
                        }
        
                */
                    
            }
            
        }catch{
            
            print("la cagamos...al entrar en el JSON")
            
        }
        */
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

