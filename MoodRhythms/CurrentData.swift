//
//  CurrentData.swift
//  MoodRhythms
//
//  Created by kuet on 23/11/23.
//

import Foundation

struct CurrentData:Codable
{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
    let condition:Condition
}
