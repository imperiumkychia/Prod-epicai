//
//  String+Extensions.swift
//  EPICAI
//
//  Created by Abdul fattah on 14/12/21.
//

import Foundation

extension String {
    func isEmptyString() -> Bool {
        if (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return true;
        }
        else{
            return false;
        }
    }
}


