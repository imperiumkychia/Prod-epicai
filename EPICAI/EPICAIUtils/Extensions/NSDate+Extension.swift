//
//  NSDate+Extension.swift
//  EPICAI
//
//  Created by Abdul fattah on 23/12/21.
//

import Foundation

extension Date {

    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy - HH:mm"
        return dateFormatter.string(from: self)
    }

    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }

    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    
    func getServerDate() -> String {
        let format = "yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
    
    func getDisplayDate(string:String?) -> String? {
        let dateFormatter = DateFormatter()
        let targetDateFormat = "dd/MM/yyyy"
        let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = originalDateFormat
        guard let string = string, let date = dateFormatter.date(from: string) else { return nil}
        dateFormatter.dateFormat = targetDateFormat
        return dateFormatter.string(from: date)
    }
}

extension String {
    func getDisplayDate() -> String {
        let dateFormatter = DateFormatter()
        let targetDateFormat = "dd/MM/yyyy HH:mm:ss"
        let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = originalDateFormat
        guard let date = dateFormatter.date(from: self) else { return ""}
        dateFormatter.dateFormat = targetDateFormat
        return dateFormatter.string(from: date)
    }
}

extension TimeInterval{
    
    var minuteSecondMS: String {
        return String(format:"%d:%02d.%02d", minute, second, millisecond)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*100).truncatingRemainder(dividingBy: 100))
    }
    
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 100)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        return String(format: "%0.2d:%0.2d:%0.2d",minutes,seconds,ms)
    }
}
