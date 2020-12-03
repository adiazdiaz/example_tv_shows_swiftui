//
//  DataTestModel.swift
//  ExampleTVShowsSwiftUI
//
//  Created by Alberto Díaz Díaz on 14/11/2020.
//

import Foundation

struct DataTestModel {
    static let TVShowTest = TVShow(id: 76479, name: "The Boys", posterPath: "/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg")
    
    static let TVShowsResponseTest = TVShowsResponse(page: 1, results: [
        TVShow(id: 82856, name: "The Mandalorian", posterPath: "/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg"),
        TVShow(id: 71712, name: "The Good Doctor", posterPath: "/6tfT03sGp9k4c0J3dypjrI8TSAI.jpg"),
        TVShow(id: 1416, name: "Grey\'s Anatomy", posterPath: "/clnyhPqj1SNgpAdeSS6a6fwE6Bo.jpg"),
        TVShow(id: 68507, name: "His Dark Materials", posterPath: "/g6tIKGc3f1H5QMz1dcgCwADKpZ7.jpg"),
        TVShow(id: 63174, name: "Lucifer", posterPath: "/4EYPN5mVIhKLfxGruy7Dy41dTVn.jpg"),
        TVShow(id: 62286, name: "Fear the Walking Dead", posterPath: "/wGFUewXPeMErCe2xnCmmLEiHOGh.jpg"),
        TVShow(id: 76479, name: "The Boys", posterPath: "/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg")
    ], totalResults: 7, totalPages: 1)
    
    static let TVShowDetailTest = TVShowDetail(id: 76479, name: "The Boys", posterPath: "/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg", overview: "***SUPER VILLAIN ALERT*** YOU ARE RECEIVING THIS NOTIFICATION FROM THE DEPARTMENT OF HOMELAND SECURITY. A SUPER VILLAIN ALERT HAS BEEN ISSUED FOR YOUR AREA. PLEASE BE VIGILANT AND REPORT ANY SUSPICIOUS PERSONS OR ACTIVITY. IF YOU BELIEVE YOU HAVE SEEN A SUPER VILLAIN, DO NOT APPROACH OR ATTEMPT TO APPREHEND THEM. CONTACT LAW ENFORCEMENT IMMEDIATELY")
}
