//
//  LearnViewController.swift
//  HPApp
//
//  Created by Meng To on 2015-01-15.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit
import Spring

class LearnViewController: UIViewController {
    
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var currentStreakLabel: UILabel!
    
    @IBOutlet var rewardLabel: SpringLabel!
    
    private var loginAction : LoginAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let token = LocalStore.accessToken() {
            DesignerNewsService.checkin(token, response: handleResponse)
        } else {
            self.loginAction = LoginAction(viewController: self, completion: nil)
        }
    }
    
    private func handleResponse(checkin: Checkin?, error: Error?) {
        if let checkin = checkin {
            self.balanceLabel.text = "\(checkin.balance)"
            self.currentStreakLabel.text = "连续签到 \(checkin.streak)/\(checkin.streaked)"
            if(checkin.reward > 0){
                self.rewardLabel.text = "+\(checkin.reward)"
                self.rewardLabel.animation = "zoomOut"
                self.rewardLabel.animate()
            } else {
                self.rewardLabel.text = "已签"
                self.rewardLabel.animation = "zoomIn"
                self.rewardLabel.animate()
            }
            
        }
    }
}
