//
//	Issue.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Issue{

	var content : String!
	var contentRendered : String!
	var created : Int!
	var id : Int!
	var lastModified : Int!
	var lastTouched : Int!
	var member : Member!
	var node : Node!
	var replies : Int!
	var title : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = dictionary["content"] as? String
		contentRendered = dictionary["content_rendered"] as? String
		created = dictionary["created"] as? Int
		id = dictionary["id"] as? Int
		lastModified = dictionary["last_modified"] as? Int
		lastTouched = dictionary["last_touched"] as? Int
		if let memberData = dictionary["member"] as? NSDictionary{
			member = Member(fromDictionary: memberData)
		}
		if let nodeData = dictionary["node"] as? NSDictionary{
			node = Node(fromDictionary: nodeData)
		}
		replies = dictionary["replies"] as? Int
		title = dictionary["title"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if content != nil{
			dictionary["content"] = content
		}
		if contentRendered != nil{
			dictionary["content_rendered"] = contentRendered
		}
		if created != nil{
			dictionary["created"] = created
		}
		if id != nil{
			dictionary["id"] = id
		}
		if lastModified != nil{
			dictionary["last_modified"] = lastModified
		}
		if lastTouched != nil{
			dictionary["last_touched"] = lastTouched
		}
		if member != nil{
			dictionary["member"] = member.toDictionary()
		}
		if node != nil{
			dictionary["node"] = node.toDictionary()
		}
		if replies != nil{
			dictionary["replies"] = replies
		}
		if title != nil{
			dictionary["title"] = title
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}