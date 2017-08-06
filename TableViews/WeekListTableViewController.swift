//
//  WeekListTableViewController.swift
//  TableViews
//
//  Created by Collin Cannavo on 5/23/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class WeekListTableViewController: UITableViewController {
    
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return daysOfWeek.count
        
        // You generally don't want to use a specific number (i.e. "return 7") because you may end up adding more or subtracting. You will want your daysOfWeek to be "var" not "let"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayOfWeekCell", for: indexPath)
        
        // the withIdentifier: you go to your main storyboard, click on the small map and click on the cell and then change the identifier in the Attributes Inspector under "Table View Cell", hit enter then copy and paste it here
        
        // Get object to display in cell
        let day = daysOfWeek[indexPath.row]
        
        
        // 1 section and 7 rows (7 rows for each day). So it looks like (0,0) for Monday and (0,1) for Tuesday
        
        //Display it in the cell
        cell.textLabel?.text = day
        
        return cell
        
        
    }
    
    
    // MARK: - Navigation
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check the segue's identifier
        if segue.identifier == "todayDetailVC" {
            
            // Get the index path for the selected row.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
                
                // Get the day(object) to be passed.
        let day = daysOfWeek[indexPath.row]
                
                
                // Get the new view controller using segue.destinationViewController
        let dayDetailVC = segue.destination as? DayDetailViewController
                
                
                // Pass the selected object to the new view controller.
        dayDetailVC?.dayTitle = day
        
            }
            }
            
        }
}
