//
//  AppDelegate.swift
//  DDC Brightness
//
//  Created by Shayan on 7/3/18.
//  Copyright © 2018 Menahi Shayan. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menuView: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let statusSlider = NSSlider()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let icon = NSImage(named: NSImage.Name(rawValue: "mainIcon"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        
        let menuItem = NSMenuItem()
        
        
        statusSlider.isVertical = true
        statusSlider.minValue = 0
        statusSlider.maxValue = 100
        statusSlider.isContinuous = false
        
        statusSlider.target = self
        statusSlider.action = #selector(sliderChange)
        
        statusSlider.setFrameSize(NSSize(width: 20, height: 110))
        statusSlider.frame.size.width = 22
        
        menuItem.title = "Slider"
        menuItem.view = statusSlider
        menuView.addItem(menuItem)
        
     /*   let menuQuitItem = NSMenuItem(title: "", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "")
        menuQuitItem.image = NSImage(named: NSImage.Name("NSStopProgressFreestandingTemplate"))
        menuView.addItem(menuQuitItem)
    */
        
        statusItem.menu = menuView
        
        
        
        let defaults = UserDefaults.standard
        let currentVal = defaults.string(forKey: "currentValue")
        statusSlider.stringValue = (currentVal ?? "").isEmpty ? "50" : currentVal!
        
        
        
    }
    
    @IBAction func sliderChange(_ sender:Any) {
        //statusSlider.isEnabled = false
        ddcCommandChange(b: statusSlider.stringValue)
        ddcCommandChange(b: statusSlider.stringValue)
        ddcCommandChange(b: statusSlider.stringValue)
        ddcCommandChange(b: statusSlider.stringValue)
        ddcCommandChange(b: statusSlider.stringValue)
        //statusSlider.isEnabled = true
        
        let saveValue = UserDefaults.standard
        saveValue.set(statusSlider.stringValue, forKey: "currentValue")
    }
    
    
    func ddcCommandChange(b : String) {
        let shellTask = Process.launchedProcess(launchPath: "/usr/local/bin/ddc", arguments: ["-d", "1", "-b", b])
        shellTask.waitUntilExit()
    }
}

