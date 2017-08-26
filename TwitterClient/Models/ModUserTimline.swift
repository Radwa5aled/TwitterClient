//
//	ModUserTimline.swift
//
//	Create by User on 26/8/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

//MARK: ModUserTimline
class ModUserTimline : NSObject, NSCoding, Mappable{

	var contributors : AnyObject?
	var coordinates : AnyObject?
	var createdAt : String?
	var entities : Entity?
	var favoriteCount : Int?
	var favorited : Bool?
	var geo : AnyObject?
	var id : Int?
	var idStr : String?
	var inReplyToScreenName : AnyObject?
	var inReplyToStatusId : AnyObject?
	var inReplyToStatusIdStr : AnyObject?
	var inReplyToUserId : AnyObject?
	var inReplyToUserIdStr : AnyObject?
	var isQuoteStatus : Bool?
	var lang : String?
	var place : AnyObject?
	var possiblySensitive : Bool?
	var retweetCount : Int?
	var retweeted : Bool?
	var retweetedStatus : RetweetedStatu?
	var source : String?
	var text : String?
	var truncated : Bool?
	var user : User?


	class func newInstance(map: Map) -> Mappable?{
		return ModUserTimline()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		contributors <- map["contributors"]
		coordinates <- map["coordinates"]
		createdAt <- map["created_at"]
		entities <- map["entities"]
		favoriteCount <- map["favorite_count"]
		favorited <- map["favorited"]
		geo <- map["geo"]
		id <- map["id"]
		idStr <- map["id_str"]
		inReplyToScreenName <- map["in_reply_to_screen_name"]
		inReplyToStatusId <- map["in_reply_to_status_id"]
		inReplyToStatusIdStr <- map["in_reply_to_status_id_str"]
		inReplyToUserId <- map["in_reply_to_user_id"]
		inReplyToUserIdStr <- map["in_reply_to_user_id_str"]
		isQuoteStatus <- map["is_quote_status"]
		lang <- map["lang"]
		place <- map["place"]
		possiblySensitive <- map["possibly_sensitive"]
		retweetCount <- map["retweet_count"]
		retweeted <- map["retweeted"]
		retweetedStatus <- map["retweeted_status"]
		source <- map["source"]
		text <- map["text"]
		truncated <- map["truncated"]
		user <- map["user"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contributors = aDecoder.decodeObject(forKey: "contributors") as AnyObject
         coordinates = aDecoder.decodeObject(forKey: "coordinates") as AnyObject
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         entities = aDecoder.decodeObject(forKey: "entities") as? Entity
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
         favorited = aDecoder.decodeObject(forKey: "favorited") as? Bool
         geo = aDecoder.decodeObject(forKey: "geo") as AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         idStr = aDecoder.decodeObject(forKey: "id_str") as? String
         inReplyToScreenName = aDecoder.decodeObject(forKey: "in_reply_to_screen_name") as AnyObject
         inReplyToStatusId = aDecoder.decodeObject(forKey: "in_reply_to_status_id") as AnyObject
         inReplyToStatusIdStr = aDecoder.decodeObject(forKey: "in_reply_to_status_id_str") as AnyObject
         inReplyToUserId = aDecoder.decodeObject(forKey: "in_reply_to_user_id") as AnyObject
         inReplyToUserIdStr = aDecoder.decodeObject(forKey: "in_reply_to_user_id_str") as AnyObject
         isQuoteStatus = aDecoder.decodeObject(forKey: "is_quote_status") as? Bool
         lang = aDecoder.decodeObject(forKey: "lang") as? String
         place = aDecoder.decodeObject(forKey: "place") as AnyObject
         possiblySensitive = aDecoder.decodeObject(forKey: "possibly_sensitive") as? Bool
         retweetCount = aDecoder.decodeObject(forKey: "retweet_count") as? Int
         retweeted = aDecoder.decodeObject(forKey: "retweeted") as? Bool
         retweetedStatus = aDecoder.decodeObject(forKey: "retweeted_status") as? RetweetedStatu
         source = aDecoder.decodeObject(forKey: "source") as? String
         text = aDecoder.decodeObject(forKey: "text") as? String
         truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
         user = aDecoder.decodeObject(forKey: "user") as? User

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contributors != nil{
			aCoder.encode(contributors, forKey: "contributors")
		}
		if coordinates != nil{
			aCoder.encode(coordinates, forKey: "coordinates")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if entities != nil{
			aCoder.encode(entities, forKey: "entities")
		}
		if favoriteCount != nil{
			aCoder.encode(favoriteCount, forKey: "favorite_count")
		}
		if favorited != nil{
			aCoder.encode(favorited, forKey: "favorited")
		}
		if geo != nil{
			aCoder.encode(geo, forKey: "geo")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if idStr != nil{
			aCoder.encode(idStr, forKey: "id_str")
		}
		if inReplyToScreenName != nil{
			aCoder.encode(inReplyToScreenName, forKey: "in_reply_to_screen_name")
		}
		if inReplyToStatusId != nil{
			aCoder.encode(inReplyToStatusId, forKey: "in_reply_to_status_id")
		}
		if inReplyToStatusIdStr != nil{
			aCoder.encode(inReplyToStatusIdStr, forKey: "in_reply_to_status_id_str")
		}
		if inReplyToUserId != nil{
			aCoder.encode(inReplyToUserId, forKey: "in_reply_to_user_id")
		}
		if inReplyToUserIdStr != nil{
			aCoder.encode(inReplyToUserIdStr, forKey: "in_reply_to_user_id_str")
		}
		if isQuoteStatus != nil{
			aCoder.encode(isQuoteStatus, forKey: "is_quote_status")
		}
		if lang != nil{
			aCoder.encode(lang, forKey: "lang")
		}
		if place != nil{
			aCoder.encode(place, forKey: "place")
		}
		if possiblySensitive != nil{
			aCoder.encode(possiblySensitive, forKey: "possibly_sensitive")
		}
		if retweetCount != nil{
			aCoder.encode(retweetCount, forKey: "retweet_count")
		}
		if retweeted != nil{
			aCoder.encode(retweeted, forKey: "retweeted")
		}
		if retweetedStatus != nil{
			aCoder.encode(retweetedStatus, forKey: "retweeted_status")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if text != nil{
			aCoder.encode(text, forKey: "text")
		}
		if truncated != nil{
			aCoder.encode(truncated, forKey: "truncated")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}

	}

}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//MARK: RetweetedStatu
class RetweetedStatu : NSObject, NSCoding, Mappable{
    
    var contributors : AnyObject?
    var coordinates : AnyObject?
    var createdAt : String?
    var entities : Entity?
    var favoriteCount : Int?
    var favorited : Bool?
    var geo : AnyObject?
    var id : Int?
    var idStr : String?
    var inReplyToScreenName : AnyObject?
    var inReplyToStatusId : AnyObject?
    var inReplyToStatusIdStr : AnyObject?
    var inReplyToUserId : AnyObject?
    var inReplyToUserIdStr : AnyObject?
    var isQuoteStatus : Bool?
    var lang : String?
    var place : AnyObject?
    var possiblySensitive : Bool?
    var retweetCount : Int?
    var retweeted : Bool?
    var source : String?
    var text : String?
    var truncated : Bool?
    var user : User?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return RetweetedStatu()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        contributors <- map["contributors"]
        coordinates <- map["coordinates"]
        createdAt <- map["created_at"]
        entities <- map["entities"]
        favoriteCount <- map["favorite_count"]
        favorited <- map["favorited"]
        geo <- map["geo"]
        id <- map["id"]
        idStr <- map["id_str"]
        inReplyToScreenName <- map["in_reply_to_screen_name"]
        inReplyToStatusId <- map["in_reply_to_status_id"]
        inReplyToStatusIdStr <- map["in_reply_to_status_id_str"]
        inReplyToUserId <- map["in_reply_to_user_id"]
        inReplyToUserIdStr <- map["in_reply_to_user_id_str"]
        isQuoteStatus <- map["is_quote_status"]
        lang <- map["lang"]
        place <- map["place"]
        possiblySensitive <- map["possibly_sensitive"]
        retweetCount <- map["retweet_count"]
        retweeted <- map["retweeted"]
        source <- map["source"]
        text <- map["text"]
        truncated <- map["truncated"]
        user <- map["user"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        contributors = aDecoder.decodeObject(forKey: "contributors") as AnyObject
        coordinates = aDecoder.decodeObject(forKey: "coordinates") as AnyObject
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        entities = aDecoder.decodeObject(forKey: "entities") as? Entity
        favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
        favorited = aDecoder.decodeObject(forKey: "favorited") as? Bool
        geo = aDecoder.decodeObject(forKey: "geo") as AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? Int
        idStr = aDecoder.decodeObject(forKey: "id_str") as? String
        inReplyToScreenName = aDecoder.decodeObject(forKey: "in_reply_to_screen_name") as AnyObject
        inReplyToStatusId = aDecoder.decodeObject(forKey: "in_reply_to_status_id") as AnyObject
        inReplyToStatusIdStr = aDecoder.decodeObject(forKey: "in_reply_to_status_id_str") as AnyObject
        inReplyToUserId = aDecoder.decodeObject(forKey: "in_reply_to_user_id") as AnyObject
        inReplyToUserIdStr = aDecoder.decodeObject(forKey: "in_reply_to_user_id_str") as AnyObject
        isQuoteStatus = aDecoder.decodeObject(forKey: "is_quote_status") as? Bool
        lang = aDecoder.decodeObject(forKey: "lang") as? String
        place = aDecoder.decodeObject(forKey: "place") as AnyObject
        possiblySensitive = aDecoder.decodeObject(forKey: "possibly_sensitive") as? Bool
        retweetCount = aDecoder.decodeObject(forKey: "retweet_count") as? Int
        retweeted = aDecoder.decodeObject(forKey: "retweeted") as? Bool
        source = aDecoder.decodeObject(forKey: "source") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
        truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
        user = aDecoder.decodeObject(forKey: "user") as? User
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if contributors != nil{
            aCoder.encode(contributors, forKey: "contributors")
        }
        if coordinates != nil{
            aCoder.encode(coordinates, forKey: "coordinates")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if entities != nil{
            aCoder.encode(entities, forKey: "entities")
        }
        if favoriteCount != nil{
            aCoder.encode(favoriteCount, forKey: "favorite_count")
        }
        if favorited != nil{
            aCoder.encode(favorited, forKey: "favorited")
        }
        if geo != nil{
            aCoder.encode(geo, forKey: "geo")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if idStr != nil{
            aCoder.encode(idStr, forKey: "id_str")
        }
        if inReplyToScreenName != nil{
            aCoder.encode(inReplyToScreenName, forKey: "in_reply_to_screen_name")
        }
        if inReplyToStatusId != nil{
            aCoder.encode(inReplyToStatusId, forKey: "in_reply_to_status_id")
        }
        if inReplyToStatusIdStr != nil{
            aCoder.encode(inReplyToStatusIdStr, forKey: "in_reply_to_status_id_str")
        }
        if inReplyToUserId != nil{
            aCoder.encode(inReplyToUserId, forKey: "in_reply_to_user_id")
        }
        if inReplyToUserIdStr != nil{
            aCoder.encode(inReplyToUserIdStr, forKey: "in_reply_to_user_id_str")
        }
        if isQuoteStatus != nil{
            aCoder.encode(isQuoteStatus, forKey: "is_quote_status")
        }
        if lang != nil{
            aCoder.encode(lang, forKey: "lang")
        }
        if place != nil{
            aCoder.encode(place, forKey: "place")
        }
        if possiblySensitive != nil{
            aCoder.encode(possiblySensitive, forKey: "possibly_sensitive")
        }
        if retweetCount != nil{
            aCoder.encode(retweetCount, forKey: "retweet_count")
        }
        if retweeted != nil{
            aCoder.encode(retweeted, forKey: "retweeted")
        }
        if source != nil{
            aCoder.encode(source, forKey: "source")
        }
        if text != nil{
            aCoder.encode(text, forKey: "text")
        }
        if truncated != nil{
            aCoder.encode(truncated, forKey: "truncated")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        
    }
    
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//MARK: Description
class Description : NSObject, NSCoding, Mappable{
    
    var urls : [AnyObject]?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Description()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        urls <- map["urls"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        urls = aDecoder.decodeObject(forKey: "urls") as? [AnyObject]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if urls != nil{
            aCoder.encode(urls, forKey: "urls")
        }
        
    }
    
}


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//MARK: Url

class Url : NSObject, NSCoding, Mappable{
    
    var displayUrl : String?
    var expandedUrl : String?
    var indices : [Int]?
    var url : String?
    var urls : [Url]?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Url()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        displayUrl <- map["display_url"]
        expandedUrl <- map["expanded_url"]
        indices <- map["indices"]
        url <- map["url"]
        urls <- map["urls"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        displayUrl = aDecoder.decodeObject(forKey: "display_url") as? String
        expandedUrl = aDecoder.decodeObject(forKey: "expanded_url") as? String
        indices = aDecoder.decodeObject(forKey: "indices") as? [Int]
        url = aDecoder.decodeObject(forKey: "url") as? String
        urls = aDecoder.decodeObject(forKey: "urls") as? [Url]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if displayUrl != nil{
            aCoder.encode(displayUrl, forKey: "display_url")
        }
        if expandedUrl != nil{
            aCoder.encode(expandedUrl, forKey: "expanded_url")
        }
        if indices != nil{
            aCoder.encode(indices, forKey: "indices")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if urls != nil{
            aCoder.encode(urls, forKey: "urls")
        }
        
    }
    
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//MARK: Entity
class Entity : NSObject, NSCoding, Mappable{
    
    var hashtags : [AnyObject]?
    var symbols : [AnyObject]?
    var userMentions : [UserMention]?
    var urls : [Url]?
    var descriptionField : Description?
    var url : Url?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Entity()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        hashtags <- map["hashtags"]
        symbols <- map["symbols"]
        urls <- map["urls"]
        userMentions <- map["user_mentions"]
        descriptionField <- map["description"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        hashtags = aDecoder.decodeObject(forKey: "hashtags") as? [AnyObject]
        symbols = aDecoder.decodeObject(forKey: "symbols") as? [AnyObject]

        userMentions = aDecoder.decodeObject(forKey: "user_mentions") as? [UserMention]
        urls = aDecoder.decodeObject(forKey: "urls") as? [Url]
        descriptionField = aDecoder.decodeObject(forKey: "description") as? Description
        url = aDecoder.decodeObject(forKey: "url") as? Url
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if hashtags != nil{
            aCoder.encode(hashtags, forKey: "hashtags")
        }
        if symbols != nil{
            aCoder.encode(symbols, forKey: "symbols")
        }
        if urls != nil{
            aCoder.encode(urls, forKey: "urls")
        }
        if userMentions != nil{
            aCoder.encode(userMentions, forKey: "user_mentions")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//MARK: UserMention
class UserMention : NSObject, NSCoding, Mappable{
    
    var id : Int?
    var idStr : String?
    var indices : [Int]?
    var name : String?
    var screenName : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return UserMention()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        id <- map["id"]
        idStr <- map["id_str"]
        indices <- map["indices"]
        name <- map["name"]
        screenName <- map["screen_name"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        idStr = aDecoder.decodeObject(forKey: "id_str") as? String
        indices = aDecoder.decodeObject(forKey: "indices") as? [Int]
        name = aDecoder.decodeObject(forKey: "name") as? String
        screenName = aDecoder.decodeObject(forKey: "screen_name") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if idStr != nil{
            aCoder.encode(idStr, forKey: "id_str")
        }
        if indices != nil{
            aCoder.encode(indices, forKey: "indices")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if screenName != nil{
            aCoder.encode(screenName, forKey: "screen_name")
        }
        
    }
    
}
