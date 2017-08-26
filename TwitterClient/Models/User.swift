//
//	User.swift
//
//	Create by User on 25/8/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class User : NSObject, NSCoding, Mappable{

	var contributorsEnabled : Bool?
	var createdAt : String?
	var defaultProfile : Bool?
	var defaultProfileImage : Bool?
	var descriptionField : String?
    
    var entities : Entity?
    
	var favouritesCount : Int?
	var followRequestSent : Bool?
	var followersCount : Int?
	var following : Bool?
	var friendsCount : Int?
	var geoEnabled : Bool?
    
    var hasExtendedProfile : Bool?
    
	var id : Int?
	var idStr : String?
	var isTranslationEnabled : Bool?
	var isTranslator : Bool?
	var lang : String?
	var listedCount : Int?
	var location : String?
	var muting : Bool?
	var name : String?
	var notifications : Bool?
	var profileBackgroundColor : String?
	var profileBackgroundImageUrl : String?
	var profileBackgroundImageUrlHttps : String?
	var profileBackgroundTile : Bool?
	var profileBannerUrl : String?
	var profileImageUrl : String?
	var profileImageUrlHttps : String?
	var profileLinkColor : String?
	var profileLocation : String?
	var profileSidebarBorderColor : String?
	var profileSidebarFillColor : String?
	var profileTextColor : String?
	var profileUseBackgroundImage : Bool?
	var protectedField : Bool?
	var screenName : String?
	var statusesCount : Int?
	var timeZone : String?
    
    var translatorType : String?
    
	var url : String?
	var utcOffset : Int?
	var verified : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return User()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		contributorsEnabled <- map["contributors_enabled"]
		createdAt <- map["created_at"]
		defaultProfile <- map["default_profile"]
		defaultProfileImage <- map["default_profile_image"]
		descriptionField <- map["description"]
		favouritesCount <- map["favourites_count"]
		followRequestSent <- map["follow_request_sent"]
		followersCount <- map["followers_count"]
		following <- map["following"]
		friendsCount <- map["friends_count"]
		geoEnabled <- map["geo_enabled"]
		id <- map["id"]
		idStr <- map["id_str"]
		isTranslationEnabled <- map["is_translation_enabled"]
		isTranslator <- map["is_translator"]
		lang <- map["lang"]
		listedCount <- map["listed_count"]
		location <- map["location"]
		muting <- map["muting"]
		name <- map["name"]
		notifications <- map["notifications"]
		profileBackgroundColor <- map["profile_background_color"]
		profileBackgroundImageUrl <- map["profile_background_image_url"]
		profileBackgroundImageUrlHttps <- map["profile_background_image_url_https"]
		profileBackgroundTile <- map["profile_background_tile"]
		profileBannerUrl <- map["profile_banner_url"]
		profileImageUrl <- map["profile_image_url"]
		profileImageUrlHttps <- map["profile_image_url_https"]
		profileLinkColor <- map["profile_link_color"]
		profileLocation <- map["profile_location"]
		profileSidebarBorderColor <- map["profile_sidebar_border_color"]
		profileSidebarFillColor <- map["profile_sidebar_fill_color"]
		profileTextColor <- map["profile_text_color"]
		profileUseBackgroundImage <- map["profile_use_background_image"]
		protectedField <- map["protected"]
		screenName <- map["screen_name"]
		statusesCount <- map["statuses_count"]
		timeZone <- map["time_zone"]
		url <- map["url"]
		utcOffset <- map["utc_offset"]
		verified <- map["verified"]
        
        entities <- map["entities"]
        geoEnabled <- map["geo_enabled"]
        translatorType <- map["translator_type"]
        
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contributorsEnabled = aDecoder.decodeObject(forKey: "contributors_enabled") as? Bool
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         defaultProfile = aDecoder.decodeObject(forKey: "default_profile") as? Bool
         defaultProfileImage = aDecoder.decodeObject(forKey: "default_profile_image") as? Bool
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         favouritesCount = aDecoder.decodeObject(forKey: "favourites_count") as? Int
         followRequestSent = aDecoder.decodeObject(forKey: "follow_request_sent") as? Bool
         followersCount = aDecoder.decodeObject(forKey: "followers_count") as? Int
         following = aDecoder.decodeObject(forKey: "following") as? Bool
         friendsCount = aDecoder.decodeObject(forKey: "friends_count") as? Int
         geoEnabled = aDecoder.decodeObject(forKey: "geo_enabled") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         idStr = aDecoder.decodeObject(forKey: "id_str") as? String
         isTranslationEnabled = aDecoder.decodeObject(forKey: "is_translation_enabled") as? Bool
         isTranslator = aDecoder.decodeObject(forKey: "is_translator") as? Bool
         lang = aDecoder.decodeObject(forKey: "lang") as? String
         listedCount = aDecoder.decodeObject(forKey: "listed_count") as? Int
         location = aDecoder.decodeObject(forKey: "location") as? String
         muting = aDecoder.decodeObject(forKey: "muting") as? Bool
         name = aDecoder.decodeObject(forKey: "name") as? String
         notifications = aDecoder.decodeObject(forKey: "notifications") as? Bool
         profileBackgroundColor = aDecoder.decodeObject(forKey: "profile_background_color") as? String
         profileBackgroundImageUrl = aDecoder.decodeObject(forKey: "profile_background_image_url") as? String
         profileBackgroundImageUrlHttps = aDecoder.decodeObject(forKey: "profile_background_image_url_https") as? String
         profileBackgroundTile = aDecoder.decodeObject(forKey: "profile_background_tile") as? Bool
         profileBannerUrl = aDecoder.decodeObject(forKey: "profile_banner_url") as? String
         profileImageUrl = aDecoder.decodeObject(forKey: "profile_image_url") as? String
         profileImageUrlHttps = aDecoder.decodeObject(forKey: "profile_image_url_https") as? String
         profileLinkColor = aDecoder.decodeObject(forKey: "profile_link_color") as? String
         profileLocation = aDecoder.decodeObject(forKey: "profile_location") as? String
         profileSidebarBorderColor = aDecoder.decodeObject(forKey: "profile_sidebar_border_color") as? String
         profileSidebarFillColor = aDecoder.decodeObject(forKey: "profile_sidebar_fill_color") as? String
         profileTextColor = aDecoder.decodeObject(forKey: "profile_text_color") as? String
         profileUseBackgroundImage = aDecoder.decodeObject(forKey: "profile_use_background_image") as? Bool
         protectedField = aDecoder.decodeObject(forKey: "protected") as? Bool
         screenName = aDecoder.decodeObject(forKey: "screen_name") as? String
         statusesCount = aDecoder.decodeObject(forKey: "statuses_count") as? Int
         timeZone = aDecoder.decodeObject(forKey: "time_zone") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         utcOffset = aDecoder.decodeObject(forKey: "utc_offset") as? Int
         verified = aDecoder.decodeObject(forKey: "verified") as? Bool
        
        translatorType = aDecoder.decodeObject(forKey: "translator_type") as? String
        hasExtendedProfile = aDecoder.decodeObject(forKey: "has_extended_profile") as? Bool
        entities = aDecoder.decodeObject(forKey: "entities") as? Entity


	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contributorsEnabled != nil{
			aCoder.encode(contributorsEnabled, forKey: "contributors_enabled")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if defaultProfile != nil{
			aCoder.encode(defaultProfile, forKey: "default_profile")
		}
		if defaultProfileImage != nil{
			aCoder.encode(defaultProfileImage, forKey: "default_profile_image")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if favouritesCount != nil{
			aCoder.encode(favouritesCount, forKey: "favourites_count")
		}
		if followRequestSent != nil{
			aCoder.encode(followRequestSent, forKey: "follow_request_sent")
		}
		if followersCount != nil{
			aCoder.encode(followersCount, forKey: "followers_count")
		}
		if following != nil{
			aCoder.encode(following, forKey: "following")
		}
		if friendsCount != nil{
			aCoder.encode(friendsCount, forKey: "friends_count")
		}
		if geoEnabled != nil{
			aCoder.encode(geoEnabled, forKey: "geo_enabled")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if idStr != nil{
			aCoder.encode(idStr, forKey: "id_str")
		}
		if isTranslationEnabled != nil{
			aCoder.encode(isTranslationEnabled, forKey: "is_translation_enabled")
		}
		if isTranslator != nil{
			aCoder.encode(isTranslator, forKey: "is_translator")
		}
		if lang != nil{
			aCoder.encode(lang, forKey: "lang")
		}
		if listedCount != nil{
			aCoder.encode(listedCount, forKey: "listed_count")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if muting != nil{
			aCoder.encode(muting, forKey: "muting")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if notifications != nil{
			aCoder.encode(notifications, forKey: "notifications")
		}
		if profileBackgroundColor != nil{
			aCoder.encode(profileBackgroundColor, forKey: "profile_background_color")
		}
		if profileBackgroundImageUrl != nil{
			aCoder.encode(profileBackgroundImageUrl, forKey: "profile_background_image_url")
		}
		if profileBackgroundImageUrlHttps != nil{
			aCoder.encode(profileBackgroundImageUrlHttps, forKey: "profile_background_image_url_https")
		}
		if profileBackgroundTile != nil{
			aCoder.encode(profileBackgroundTile, forKey: "profile_background_tile")
		}
		if profileBannerUrl != nil{
			aCoder.encode(profileBannerUrl, forKey: "profile_banner_url")
		}
		if profileImageUrl != nil{
			aCoder.encode(profileImageUrl, forKey: "profile_image_url")
		}
		if profileImageUrlHttps != nil{
			aCoder.encode(profileImageUrlHttps, forKey: "profile_image_url_https")
		}
		if profileLinkColor != nil{
			aCoder.encode(profileLinkColor, forKey: "profile_link_color")
		}
		if profileLocation != nil{
			aCoder.encode(profileLocation, forKey: "profile_location")
		}
		if profileSidebarBorderColor != nil{
			aCoder.encode(profileSidebarBorderColor, forKey: "profile_sidebar_border_color")
		}
		if profileSidebarFillColor != nil{
			aCoder.encode(profileSidebarFillColor, forKey: "profile_sidebar_fill_color")
		}
		if profileTextColor != nil{
			aCoder.encode(profileTextColor, forKey: "profile_text_color")
		}
		if profileUseBackgroundImage != nil{
			aCoder.encode(profileUseBackgroundImage, forKey: "profile_use_background_image")
		}
		if protectedField != nil{
			aCoder.encode(protectedField, forKey: "protected")
		}
		if screenName != nil{
			aCoder.encode(screenName, forKey: "screen_name")
		}
		if statusesCount != nil{
			aCoder.encode(statusesCount, forKey: "statuses_count")
		}
		if timeZone != nil{
			aCoder.encode(timeZone, forKey: "time_zone")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if utcOffset != nil{
			aCoder.encode(utcOffset, forKey: "utc_offset")
		}
		if verified != nil{
			aCoder.encode(verified, forKey: "verified")
		}
        
        if entities != nil{
            aCoder.encode(entities, forKey: "entities")
        }
        
        if hasExtendedProfile != nil{
            aCoder.encode(hasExtendedProfile, forKey: "has_extended_profile")
        }
        
        if translatorType != nil{
            aCoder.encode(translatorType, forKey: "translator_type")
        }

	}

}
