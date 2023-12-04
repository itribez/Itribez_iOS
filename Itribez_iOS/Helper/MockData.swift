//
//  MockData.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//

import Foundation

struct MockData {
    var activity: [NotificationModel] = [
        NotificationModel(activity: .liked,
                          duration: "15m",
                          usersInContext: [User(userName: "cristiano", userImage: "user_8"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .newFollower,
                          duration: "18h",
                          usersInContext: [User(userName: "rock'n_roll", userImage: "user_14")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "5h",
                          usersInContext: [User(userName: "axeyked", userImage: "user_2"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .comment,
                          duration: "5h",
                          usersInContext: [User(userName: "zendaya", userImage: "user_9")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: "@pankajgaikar ❤️🙏🏻"),
        NotificationModel(activity: .suggestFollower,
                          duration: "6h",
                          usersInContext: [User(userName: "abhijit_007", userImage: "user_17")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "abhishekkgadge", userImage: "user_1"), User(userName: "axeyked", userImage: "user_2") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "sherlock", userImage: "user_20"), User(userName: "john_watson", userImage: "user_8") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .suggestFollower,
                          duration: "6h",
                          usersInContext: [User(userName: "hiker.benn", userImage: "user_18")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .newFollower,
                          duration: "8h",
                          usersInContext: [User(userName: "abasu63", userImage: "user_19")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "harry_potter", userImage: "user_9"), User(userName: "john_wisley", userImage: "user_16") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .newFollower,
                          duration: "18h",
                          usersInContext: [User(userName: "power_of_shiva_99", userImage: "user_20")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "15m",
                          usersInContext: [User(userName: "cristiano", userImage: "user_8"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .newFollower,
                          duration: "18h",
                          usersInContext: [User(userName: "rock'n_roll", userImage: "user_14")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "5h",
                          usersInContext: [User(userName: "axeyked", userImage: "user_2"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .comment,
                          duration: "5h",
                          usersInContext: [User(userName: "zendaya", userImage: "user_9")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: "@pankajgaikar ❤️🙏🏻"),
        NotificationModel(activity: .suggestFollower,
                          duration: "6h",
                          usersInContext: [User(userName: "abhijit_007", userImage: "user_17")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "abhishekkgadge", userImage: "user_1"), User(userName: "axeyked", userImage: "user_2") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "sherlock", userImage: "user_20"), User(userName: "john_watson", userImage: "user_8") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .suggestFollower,
                          duration: "6h",
                          usersInContext: [User(userName: "hiker.benn", userImage: "user_18")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .newFollower,
                          duration: "8h",
                          usersInContext: [User(userName: "abasu63", userImage: "user_19")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "harry_potter", userImage: "user_9"), User(userName: "john_wisley", userImage: "user_16") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .newFollower,
                          duration: "18h",
                          usersInContext: [User(userName: "power_of_shiva_99", userImage: "user_20")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "15m",
                          usersInContext: [User(userName: "cristiano", userImage: "user_8"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .newFollower,
                          duration: "18h",
                          usersInContext: [User(userName: "rock'n_roll", userImage: "user_14")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "5h",
                          usersInContext: [User(userName: "axeyked", userImage: "user_2"), User(userName: "neymarjr", userImage: "user_7")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
        NotificationModel(activity: .comment,
                          duration: "5h",
                          usersInContext: [User(userName: "zendaya", userImage: "user_9")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: "@pankajgaikar ❤️🙏🏻"),
        NotificationModel(activity: .suggestFollower,
                          duration: "6h",
                          usersInContext: [User(userName: "abhijit_007", userImage: "user_17")],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked"),
                          comment: ""),
        NotificationModel(activity: .liked,
                          duration: "46m",
                          usersInContext: [User(userName: "abhishekkgadge", userImage: "user_1"), User(userName: "axeyked", userImage: "user_2") ],
                          post: Post(user: User(userName: "pankajgaikar", userImage: "user_16"), postImage: "post_18", caption: "If any one attempts to haul down the American flag, shoot him on the spot.", likes: "leomessi and others liked")),
    ]
    
    
    
    var posts: [Post] = [
        Post(user: User(userName: "ivanrakitik", userImage: "user_16"),
             postImage: "post_1",
             caption: "SERIAL, n. A literary work, usually a story that is not true, creeping through several issues of a newspaper or magazine.",
             likes: "leomessi and others liked"),
        Post(user: User(userName: "andreasiniesta", userImage: "user_15"),
             postImage: "post_2",
             caption: "I'm doing philosophy like an old woman, first I'm looking for my pencil, then I'm looking for my glasses, then I'm looking for my pencil again",
             likes: "waynerooney and others liked"),
        Post(user: User(userName: "sergioramos", userImage: "user_14"),
             postImage: "post_3",
             caption: "The way in which men cling to old institutions after the life has departed out of them, and out of themselves, reminds me of those monkeys which cling by their tails ... beyond the hunter's reach long after they are dead.",
             likes: "leomessi and others liked"),
        Post(user: User(userName: "antogriezmann", userImage: "user_13"),
             postImage: "post_4",
             caption: "I invite you to sit down in front of your television set when your station goes on the air ... and keep your eyes glued to that set until the station signs off. I can assure you that you will observe a great wasteland.",
             likes: "davidbeckham and others liked"),
        Post(user: User(userName: "iamzlatanibrahimovic", userImage: "user_12"),
             postImage: "post_5",
             caption: "O speculators about perpetual motion, how many vain chimeras have you created in the like quest? Go and take your place with the seekers after gold.",
             likes: "sherlock and others liked"),
        Post(user: User(userName: "fernandotorres", userImage: "user_11"),
             postImage: "post_6",
             caption: "After all, for mankind as a whole there are no exports. We did not start developing by obtaining foreign exchange from Mars or the moon. Mankind is a closed society.",
             likes: "john_watson and others liked"),
    ]
}
