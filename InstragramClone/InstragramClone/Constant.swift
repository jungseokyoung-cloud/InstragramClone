//
//  Constant.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//
struct K {
    static let stroyCellID = "storyCell"
    static let storyNibName = "StoryCell"
    static let feedNibName = "FeedCell"
    static let feedCellID = "feedCell"
    
    struct StoryBoard {
        static let loginNavigation = "LoginNavigationVC"
        static let loginVC = "LoginVC"
        static let registerVC = "RegisterVC"
        static let mainVC = "MainVC"
    }
    
    struct storyCell {
        static let cellId = "collectionCell"
        static let cellNibName = "MyCollectionViewCell"
    }
    struct Search {
        static let searchCellID = "searchFeedCell"
        static let searchNibName = "SearchCollectionViewCell"
    }
    struct Segue {
        static let firstToLogin = "firstToLogin"
        static let firstToRegister = "firstToRegister"
        static let loginToRegister = "LoginToRegister"
        static let registerToLogin = "RegisterToLogin"
    }
    
    struct NotificationVC {
        static let flowNotifyCell = "flowNotifyCell"
        static let notifyCell = "notifyCell"
    }
}
