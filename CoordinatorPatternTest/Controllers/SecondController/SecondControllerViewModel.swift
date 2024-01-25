//
//  SecondControllerViewModel.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/19/24.
//

import UIKit

fileprivate enum Constants {
    static let defaultUser: User = User(id: 1, name: "Default", username: "Default", email: "@dafault.com", address: Address(street: "StreetName", suite: "Suite", city: "city", zipcode: "12345", geo: Geo(lat: "123", lng: "456")), phone: "123456", website: "www.default.io", company: Company(name: "Company", catchPhrase: "catchPhrase", bs: "bs"))
}

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
                if let callback = self.callback {
                    callback([Constants.defaultUser])
                }
                print(error.rawValue)
            }
        }
    }
}

