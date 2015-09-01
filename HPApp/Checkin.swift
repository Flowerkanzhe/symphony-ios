//
//  Checkin.swift
//  HPApp
//
//  Created by Echo Wang on 8/16/15.
//
//


class Checkin {
    
    let balance: Int
    let reward: Int
    let streak: Int
    let streaked: Int
    
    init(balance: Int,
        reward: Int,
        streak: Int,
        streaked: Int) {
            self.balance = balance
            self.reward = reward
            self.streak = streak
            self.streaked = streaked
    }
}