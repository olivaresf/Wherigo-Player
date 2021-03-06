//
//  StringExtensions.swift
//  SkateBudapest
//
//  Created by Horváth Balázs on 2018. 07. 21..
//  Copyright © 2018. Horváth Balázs. All rights reserved.
//

extension String {
    func localized(tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "", comment: "")
    }
}
