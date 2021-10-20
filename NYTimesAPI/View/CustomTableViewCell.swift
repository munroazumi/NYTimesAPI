//
//  CustomTableViewCell.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var byline: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(article: Article) {
        title.text = article.title
        byline.text = article.byline
        
        let formattedDate = article.published_date.convertToDate(current: "YYYY-M-dd'T'HH:mm:ssZZZZZ", convertTo: "MMMM d', 'YYYY H:mm:ss zzz")
        publishDate.text = formattedDate
    }
}
