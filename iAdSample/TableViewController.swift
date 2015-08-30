//
//  TableViewController.swift
//  iAdSample
//
//  Created by koogawa on 2015/08/30.
//  Copyright (c) 2015 Kosuke Ogawa. All rights reserved.
//

import UIKit
import iAd

class TableViewController: UITableViewController {

    var values = Array(count: 20, repeatedValue: "Hoge")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepare interstitial Ad
        UIViewController.prepareInterstitialAds()

        // Show iAd
        self.canDisplayBannerAds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return values.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = values[indexPath.row]

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        self.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Manual
        var displayed = self.requestInterstitialAdPresentation()
        println(displayed)
    }
}
