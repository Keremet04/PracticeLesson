//
//  Posts.swift
//  PracticeLesson
//
//  Created by Керемет  on 3/2/23.
//

import Foundation

struct Posts: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    let title, body: String
    let tags: [String]
    let reactions: Int
}

