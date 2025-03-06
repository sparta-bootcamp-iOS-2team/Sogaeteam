//
//  TeamMember.swift
//  Sogaeteam
//
//  Created by 송규섭 on 3/6/25.
//

import Foundation

class TeamMember {
    let name: String
    let age: String
    let mbti: String
    let comment: String
    let imageName: String
    let characterImageName: String
    let description: String
    let charmPoints: [Float]
    let address: String
    let blogUrl: String
    let role: String
    let bloodType: String
    let hobby: String
    let strength: [String]
    let bio: String
    
    init(name: String, age: String, mbti: String, comment: String, imageName: String, characterImageName: String, description: String, charmPoints: [Float], address: String, blogUrl: String, role: String, bloodType: String, hobby: String, strength: [String], bio: String) {
        self.name = name
        self.age = age
        self.mbti = mbti
        self.comment = comment
        self.imageName = imageName
        self.characterImageName = characterImageName
        self.description = description
        self.charmPoints = charmPoints
        self.address = address
        self.blogUrl = blogUrl
        self.role = role
        self.bloodType = bloodType
        self.hobby = hobby
        self.strength = strength
        self.bio = bio
    }
}
