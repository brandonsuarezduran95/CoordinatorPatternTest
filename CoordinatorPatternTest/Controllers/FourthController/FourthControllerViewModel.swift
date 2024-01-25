//
//  FourthControllerViewModel.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/22/24.
//

import Foundation

fileprivate enum Constants {
    static let defaultPost: Post = Post(userId: 1, id: 2, title: "title", body: "string")
}

class FourthControllerViewModel {
    var dataSource: [Post] = []
    
    var callback: (([Post])-> Void)?
    
    func fetchData() {
        NetworkManager().fetchPostsData { result in
            switch result {
            case .success(let data):
                DispatchQueue.global(qos: .default).async { [unowned self] in
                    self.dataSource = data
                    if let callback = self.callback {
                        callback(data)
                    }
                }
            case .failure(let error):
                if let callback = self.callback {
                    callback([Constants.defaultPost])
                }
                print(error.rawValue)
            }
        }
    }
}
