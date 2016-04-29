//
//  AppDelegate.swift
//  FirebaseTest
//
//  Created by Brian Hill on 4/13/16.
//  Following Firebase iOS Quickstart (not using CocoaPods):
//  https://www.firebase.com/docs/ios/quickstart.html

import UIKit

import Firebase

let event1 = [ "name": "CAB - Warriors Tickets Signup",
               "who": "All Students",
               "when": "514556660",
               "where": "Chapel Lawn"]

let event2 = [ "name": "RHA - Giants Game",
               "who": "All Students",
               "when": "516240000",
               "where": "Galileo Hall"]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create a reference to a Firebase location
        let myRootRef = Firebase(url:"https://gael-events.firebaseio.com")
        
        let allEventsRef = myRootRef.childByAppendingPath("events")
        
        let events = ["event1": event1, "event2": event2]
        
        allEventsRef.setValue(events)
        
        // Read All Events
        allEventsRef.observeEventType(.Value, withBlock: {
            snapshot in print("All Events:\n\(snapshot.value)")
            }
        )

        // Read Event 1
        let event1Ref = allEventsRef.childByAppendingPath("event1")
        event1Ref.observeEventType(.Value, withBlock: {
            snapshot in print("Event 1: \(snapshot.value)")
            }
        )
        
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


}

