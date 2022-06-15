//
//  InstragramPost.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//

import Foundation

struct InstagramPost {
    let numOfLikes : Int
    let userName : String
    let userProfileImage : String
    let mainPostImage : String
    let userLocation : String
    
    
    func getNumOfLikesString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let likesString = numberFormatter.string(for: numOfLikes)!

        return likesString
    }
}
