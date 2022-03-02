//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Harshad Barapatre on 2/22/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileTweet: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favCount: UILabel!
    
    @IBOutlet weak var tweetDate: UILabel!
    @IBOutlet weak var tweetDateSeparator: UILabel!
    
    var favourited: Bool = false
    var retweeted: Bool = false
    
    var tweetIDx: Int = -1
    var favsCount: Int = -1
    var retweetsCount: Int = -1
    
//    var innerTweetIDx: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTweetDate(_ tweetDatex: String) {
        tweetDate.text = tweetDatex
        tweetDateSeparator.textColor = UIColor(red: 150/256, green: 164/256, blue: 155/256, alpha: 1.0)
        tweetDate.textColor = UIColor(red: 150/256, green: 164/256, blue: 155/256, alpha: 1.0)
    }
    
    func setFavourite(_ isFavourited: Bool, _ favsCountx: Int) {
        favourited = isFavourited
        favsCount = favsCountx
        if (favourited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            favCount.textColor = UIColor(red: 229/256, green: 33/256, blue: 74/256, alpha: 1.0)
            
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            favCount.textColor = UIColor(red: 150/256, green: 164/256, blue: 155/256, alpha: 1.0)
        }
        favCount.text = "\(favsCount)"
    }
    
    @IBAction func favouriteTweet(_ sender: Any) {
        let toBeFavourited = !favourited
        
        if (toBeFavourited) {
            TwitterAPICaller.client?.favouriteTweet(tweetID: tweetIDx, success: {
                self.setFavourite(true, self.favsCount + 1)
            }, failure: { (error) in
                print("Cannot favourite tweet \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavouriteTweet(tweetID: tweetIDx, success: {
                self.setFavourite(false, self.favsCount - 1)
            }, failure: { (error) in
                print("Cannot unfavourite tweet \(error)")
            })
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool, _ retweetsCountx: Int) {
        retweeted = isRetweeted
        retweetsCount = retweetsCountx
        if (retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetCount.textColor = UIColor(red: 0/256, green: 208/256, blue: 131/256, alpha: 1.0)
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetCount.textColor = UIColor(red: 150/256, green: 164/256, blue: 155/256, alpha: 1.0)
        }
        retweetCount.text = "\(retweetsCount)"
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        var rtid = tweetIDx
//        if (innerTweetIDx != -1) {
//            rtid = innerTweetIDx
//        } else {
//            rtid = tweetIDx
//        }
        
        let toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.retweetTweet(tweetID: rtid, success: {
                self.setRetweeted(true, self.retweetsCount + 1)
            }, failure: { (error) in
                print("Cannot retweet tweet \(error)")
            })
        } else {
            TwitterAPICaller.client?.unretweetTweet(tweetID: rtid, success: {
                self.setRetweeted(false, self.retweetsCount - 1)
            }, failure: { (error) in
                print("Cannot unretweet tweet \(error)")
            })
        }
    }
    
}
