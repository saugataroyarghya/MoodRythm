//
//  WeatherData.swift
//  MoodRhythms
//
//  Created by kuet on 23/11/23.
//

import Foundation

struct WeatherData:Codable
{
    let location:LocationData
    let current:CurrentData
}
