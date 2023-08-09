//
//  NotificationModel.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//

import Foundation

enum ActivityType {
    case liked
    case newFollower
    case suggestFollower
    case comment
}

struct NotificationModel: Identifiable {
    let id = UUID()
    let activity: ActivityType
    let duration: String //Easier to show on UI.
    let usersInContext: [User]
    let post: Post
    var comment: String = ""

    func getUsernames() -> String {
        return usersInContext.map{$0.userName}.joined(separator: ", ")
    }
}

import Foundation

struct User: Identifiable {
    var id = UUID()
    let userName: String
    let userImage: String
}

struct Post: Identifiable {
    let id = UUID()
    let user: User
    let postImage: String
    let caption: String
    let likes: String
    let hasLiked: Bool = false
    let hasBookmarked: Bool = false
}
