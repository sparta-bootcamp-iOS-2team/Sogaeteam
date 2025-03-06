//
//  UserManager.swift
//  Sogaeteam
//
//  Created by 송규섭 on 3/6/25.
//

import Foundation

class UserManager {
    
    static let shared = UserManager()
    
    private init() {}
    
    let teamMembers: [TeamMember] = [
        TeamMember(name: "송규섭", age: "26", mbti: "ISFJ", comment: "리드하는 사람이에요", imageName: "KS", characterImageName: "person1", description: "님과\n\n잘 맞아요!", charmPoints: [0.5, 0.9, 0.6, 0.6], address: "경기도 성남", blogUrl: "https://subkyu-ios.tistory.com/", role: "2팀 막내", bloodType: "O형", hobby: "음악", strength: ["우직", "섬세"], bio: "무야호"),
        TeamMember(name: "이다성", age: "31", mbti: "ENTJ", comment: "아이디어가 많아요", imageName: "DS", characterImageName: "person2", description: "님과\n\n환상의 조합이에요!", charmPoints: [0.9, 0.5, 0.7, 0.9], address: "서울 강북", blogUrl: "https://uddt.tistory.com/", role: "2팀 작은형", bloodType: "A형", hobby: "사진", strength: ["섬세", "아이디어뱅크"], bio: "안녕하세요 ㅋㅋ\n차은우는 아닙니다 ㅋ"),
        TeamMember(name: "명노훈", age: "32", mbti: "INTP", comment: "중요한 결정을 잘해요", imageName: "NH", characterImageName: "person3", description: "님과\n\n환장의 조합이에요!", charmPoints: [0.9, 0.6, 0.9, 0.8], address: "경기도 광주", blogUrl: "https://velog.io/@mnh4140/posts", role: "2팀 맏형", bloodType: "A형", hobby: "캠핑", strength: ["강단", "칠가이"], bio: "ㅋㅋ 저는 뷔는 아닙니다 ㅋ")
    ]
}
