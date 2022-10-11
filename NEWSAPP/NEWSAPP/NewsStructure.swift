//
//  NewsStructure.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 19/03/22.
//

import Foundation
import UIKit

struct AddNews
{
    var title : String
    var ShortDescription : String
    var LongDescription : String
    var isFav : Bool
    var imageName : UIImage
    var date : String
    var originalDate : Date?
    let uuid: String = UUID().uuidString
}
var addNews1 : [AddNews] = []
var favNews : [AddNews] = []
var recent : [AddNews] = []

var dictSort = [String:[AddNews]]()

//var arrDate : [String] = []
//var arrDate2 : [String] = []
//var setDate = Set<String>()
//
//
//
//func insertData()
//{
//    for i in 0...addNews1.count-1
//    {
//        arrDate.append(addNews1[i].date)
//    }
//    for i in arrDate
//    {
//        setDate.insert(i)
//    }
//
//    for i in setDate
//    {
//        arrDate2.append(i)
//    }
//    arrDate2.sort()
//}
