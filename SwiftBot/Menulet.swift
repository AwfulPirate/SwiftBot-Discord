//
// Created by David Hedbor on 2/20/16.
// Copyright (c) 2016 NeoTron. All rights reserved.
//

import Foundation
import AppKit

class Menulet : NSObject, NSMenuDelegate {
    fileprivate let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    fileprivate let preferencesController = Preferences()
    @IBOutlet weak var menu: NSMenu!
    
    override init() {
        super.init()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        statusItem.menu = menu
        statusItem.image = NSImage(named: "MenuIcon")
        statusItem.image?.isTemplate = true
        statusItem.highlightMode = true
        statusItem.length = NSVariableStatusItemLength
        statusItem.isEnabled = true
        updateTitle()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTitle), name: NSNotification.Name(rawValue: Config.CONFIG_CHANGE_KEY), object: nil)
   }

    func updateTitle() {
        statusItem.title = Config.development ? "[Dev]   " : ""
    }

    @IBAction func openPreferences(_ sender: AnyObject) {
        preferencesController.open(sender)
    }

}
