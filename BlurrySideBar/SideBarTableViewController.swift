//
//  SideBarTableViewController.swift
//  BlurrySideBar
//
//  Created by Apple on 02/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
protocol SideBarTableViewControllerDelegate{
    func sideBarContolDidSelectRow(indexPath: NSIndexPath)
    
}


class SideBarTableViewController: UITableViewController {
    var delegate: SideBarTableViewControllerDelegate?
    var tableData:Array<String> = []

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkTextColor()
            
            let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            
            selectedView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
        }

        cell!.textLabel?.text = tableData[indexPath.row]
        
        // Configure the cell...

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) ->CGFloat {
        return 45.0
    }
        
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.sideBarContolDidSelectRow(indexPath)
        
    }

   
   

}
