//
//  SecondControllerViewModel.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/19/24.
//

import UIKit

class SecondControllerViewModel: NSObject {
    var dataSource: [User] = []
    
    var callback: (([User]) -> Void)?
    
    func fetchData() {
        NetworkManager().fetchUsersData { respond in
            switch respond {
            case .success(let data):
                DispatchQueue.global(qos: .default).async { [unowned self] in
                    self.dataSource = data
                    if let callback = self.callback {
                        callback(data)
                    }
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

