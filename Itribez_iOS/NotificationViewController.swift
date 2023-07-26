
import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        // Customize view controller elements
        titleLabel.text = "Notification"
        backButtonImageView.image = UIImage(named: "Back")
        searchImageView.image = UIImage(named: "Search")
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections in the table view
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the table view
        return 1 // Or the number of notifications you want to display
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue and configure the custom table view cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        // Customize the cell with data for the corresponding notification
        cell.titleLabel.text = "Floyd Miles"
        cell.subtitleLabel.text = "Commented on your post"
        cell.timeLabel.text = "2 mins ago"
        cell.iconImageView.image = UIImage(named: "Image")
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection if needed
    }
}
