//
//	ModFollowers.swift
//
//	Create by User on 25/8/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ModFollowers : NSObject, NSCoding, Mappable{

	var nextCursor : Int?
	var nextCursorStr : String?
	var previousCursor : Int?
	var previousCursorStr : String?
	var users : [User]?


	class func newInstance(map: Map) -> Mappable?{
		return ModFollowers()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		nextCursor <- map["next_cursor"]
		nextCursorStr <- map["next_cursor_str"]
		previousCursor <- map["previous_cursor"]
		previousCursorStr <- map["previous_cursor_str"]
		users <- map["users"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         nextCursor = aDecoder.decodeObject(forKey: "next_cursor") as? Int
         nextCursorStr = aDecoder.decodeObject(forKey: "next_cursor_str") as? String
         previousCursor = aDecoder.decodeObject(forKey: "previous_cursor") as? Int
         previousCursorStr = aDecoder.decodeObject(forKey: "previous_cursor_str") as? String
         users = aDecoder.decodeObject(forKey: "users") as? [User]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if nextCursor != nil{
			aCoder.encode(nextCursor, forKey: "next_cursor")
		}
		if nextCursorStr != nil{
			aCoder.encode(nextCursorStr, forKey: "next_cursor_str")
		}
		if previousCursor != nil{
			aCoder.encode(previousCursor, forKey: "previous_cursor")
		}
		if previousCursorStr != nil{
			aCoder.encode(previousCursorStr, forKey: "previous_cursor_str")
		}
		if users != nil{
			aCoder.encode(users, forKey: "users")
		}

	}

}
