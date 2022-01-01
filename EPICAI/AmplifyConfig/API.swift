//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateVideo_likeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(videoLikeUuid: String, userUuid: String, videoUuid: String, createdDatetime: String? = nil) {
    graphQLMap = ["video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime]
  }

  public var videoLikeUuid: String {
    get {
      return graphQLMap["video_like_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_like_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var createdDatetime: String? {
    get {
      return graphQLMap["created_datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "created_datetime")
    }
  }
}

public struct UpdateVideo_likeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(videoLikeUuid: String, userUuid: String? = nil, videoUuid: String? = nil, createdDatetime: String? = nil) {
    graphQLMap = ["video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime]
  }

  public var videoLikeUuid: String {
    get {
      return graphQLMap["video_like_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_like_uuid")
    }
  }

  public var userUuid: String? {
    get {
      return graphQLMap["user_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var videoUuid: String? {
    get {
      return graphQLMap["video_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var createdDatetime: String? {
    get {
      return graphQLMap["created_datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "created_datetime")
    }
  }
}

public struct CreateTemporary_testInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(testId: Int, testfield: String? = nil) {
    graphQLMap = ["TestID": testId, "Testfield": testfield]
  }

  public var testId: Int {
    get {
      return graphQLMap["TestID"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TestID")
    }
  }

  public var testfield: String? {
    get {
      return graphQLMap["Testfield"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Testfield")
    }
  }
}

public struct UpdateTemporary_testInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(testId: Int, testfield: String? = nil) {
    graphQLMap = ["TestID": testId, "Testfield": testfield]
  }

  public var testId: Int {
    get {
      return graphQLMap["TestID"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TestID")
    }
  }

  public var testfield: String? {
    get {
      return graphQLMap["Testfield"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Testfield")
    }
  }
}

public struct CreateBl_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var blResultUuid: String {
    get {
      return graphQLMap["bl_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_uuid")
    }
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct UpdateBl_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(blResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var blResultUuid: String {
    get {
      return graphQLMap["bl_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_uuid")
    }
  }

  public var creditUsageUuid: String? {
    get {
      return graphQLMap["credit_usage_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct CreateBl_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
    graphQLMap = ["bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid]
  }

  public var blResultDetailUuid: String {
    get {
      return graphQLMap["bl_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_detail_uuid")
    }
  }

  public var frameNo: Int? {
    get {
      return graphQLMap["frame_no"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_no")
    }
  }

  public var frameTime: String? {
    get {
      return graphQLMap["frame_time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_time")
    }
  }

  public var framePredictResult: String? {
    get {
      return graphQLMap["frame_predict_result"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_predict_result")
    }
  }

  public var blResultUuid: String? {
    get {
      return graphQLMap["bl_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_uuid")
    }
  }
}

public struct UpdateBl_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
    graphQLMap = ["bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid]
  }

  public var blResultDetailUuid: String {
    get {
      return graphQLMap["bl_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_detail_uuid")
    }
  }

  public var frameNo: Int? {
    get {
      return graphQLMap["frame_no"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_no")
    }
  }

  public var frameTime: String? {
    get {
      return graphQLMap["frame_time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_time")
    }
  }

  public var framePredictResult: String? {
    get {
      return graphQLMap["frame_predict_result"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frame_predict_result")
    }
  }

  public var blResultUuid: String? {
    get {
      return graphQLMap["bl_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_result_uuid")
    }
  }
}

public struct CreateCatalogInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
    graphQLMap = ["item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable]
  }

  public var itemUuid: String {
    get {
      return graphQLMap["item_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "item_uuid")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var currency: String? {
    get {
      return graphQLMap["currency"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var validDateFrom: String? {
    get {
      return graphQLMap["valid_date_from"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "valid_date_from")
    }
  }

  public var validDateTo: String? {
    get {
      return graphQLMap["valid_date_to"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "valid_date_to")
    }
  }

  public var quantity: Int? {
    get {
      return graphQLMap["quantity"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  public var planName: String? {
    get {
      return graphQLMap["plan_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plan_name")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var vendor: String? {
    get {
      return graphQLMap["vendor"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var enable: Int? {
    get {
      return graphQLMap["enable"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enable")
    }
  }
}

public struct UpdateCatalogInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
    graphQLMap = ["item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable]
  }

  public var itemUuid: String {
    get {
      return graphQLMap["item_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "item_uuid")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var currency: String? {
    get {
      return graphQLMap["currency"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var validDateFrom: String? {
    get {
      return graphQLMap["valid_date_from"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "valid_date_from")
    }
  }

  public var validDateTo: String? {
    get {
      return graphQLMap["valid_date_to"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "valid_date_to")
    }
  }

  public var quantity: Int? {
    get {
      return graphQLMap["quantity"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  public var planName: String? {
    get {
      return graphQLMap["plan_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plan_name")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var vendor: String? {
    get {
      return graphQLMap["vendor"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var enable: Int? {
    get {
      return graphQLMap["enable"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enable")
    }
  }
}

public struct CreateCredit_usageInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(creditUsageUuid: String, userUuid: String, videoUuid: String, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
    graphQLMap = ["credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid]
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var deviceUuid: String? {
    get {
      return graphQLMap["device_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device_uuid")
    }
  }
}

public struct UpdateCredit_usageInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
    graphQLMap = ["credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid]
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var userUuid: String? {
    get {
      return graphQLMap["user_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var videoUuid: String? {
    get {
      return graphQLMap["video_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var deviceUuid: String? {
    get {
      return graphQLMap["device_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device_uuid")
    }
  }
}

public struct CreateFw_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(fwResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var fwResultUuid: String {
    get {
      return graphQLMap["fw_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_uuid")
    }
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct UpdateFw_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var fwResultUuid: String {
    get {
      return graphQLMap["fw_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_uuid")
    }
  }

  public var creditUsageUuid: String? {
    get {
      return graphQLMap["credit_usage_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct CreateFw_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
    graphQLMap = ["fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid]
  }

  public var fwResultDetailUuid: String {
    get {
      return graphQLMap["fw_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_detail_uuid")
    }
  }

  public var fillerWord: String? {
    get {
      return graphQLMap["filler_word"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filler_word")
    }
  }

  public var fillerWordCount: Int? {
    get {
      return graphQLMap["filler_word_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filler_word_count")
    }
  }

  public var fwResultUuid: String? {
    get {
      return graphQLMap["fw_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_uuid")
    }
  }
}

public struct UpdateFw_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
    graphQLMap = ["fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid]
  }

  public var fwResultDetailUuid: String {
    get {
      return graphQLMap["fw_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_detail_uuid")
    }
  }

  public var fillerWord: String? {
    get {
      return graphQLMap["filler_word"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filler_word")
    }
  }

  public var fillerWordCount: Int? {
    get {
      return graphQLMap["filler_word_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filler_word_count")
    }
  }

  public var fwResultUuid: String? {
    get {
      return graphQLMap["fw_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_result_uuid")
    }
  }
}

public struct CreateNewsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
    graphQLMap = ["news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path]
  }

  public var newsUuid: String {
    get {
      return graphQLMap["news_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "news_uuid")
    }
  }

  public var startDate: String? {
    get {
      return graphQLMap["start_date"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "start_date")
    }
  }

  public var endDate: String? {
    get {
      return graphQLMap["end_date"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "end_date")
    }
  }

  public var enabled: Int? {
    get {
      return graphQLMap["enabled"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enabled")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var path: String? {
    get {
      return graphQLMap["path"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "path")
    }
  }
}

public struct UpdateNewsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
    graphQLMap = ["news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path]
  }

  public var newsUuid: String {
    get {
      return graphQLMap["news_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "news_uuid")
    }
  }

  public var startDate: String? {
    get {
      return graphQLMap["start_date"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "start_date")
    }
  }

  public var endDate: String? {
    get {
      return graphQLMap["end_date"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "end_date")
    }
  }

  public var enabled: Int? {
    get {
      return graphQLMap["enabled"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enabled")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var path: String? {
    get {
      return graphQLMap["path"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "path")
    }
  }
}

public struct CreateScore_weightInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
    graphQLMap = ["weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp]
  }

  public var weightUuid: Int {
    get {
      return graphQLMap["weight_uuid"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight_uuid")
    }
  }

  public var blWeight: Double? {
    get {
      return graphQLMap["bl_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_weight")
    }
  }

  public var tonalityWeight: Double? {
    get {
      return graphQLMap["tonality_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_weight")
    }
  }

  public var speedWeight: Double? {
    get {
      return graphQLMap["speed_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "speed_weight")
    }
  }

  public var fwWeight: Double? {
    get {
      return graphQLMap["fw_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_weight")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var timestamp: String? {
    get {
      return graphQLMap["timestamp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }
}

public struct UpdateScore_weightInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
    graphQLMap = ["weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp]
  }

  public var weightUuid: Int {
    get {
      return graphQLMap["weight_uuid"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight_uuid")
    }
  }

  public var blWeight: Double? {
    get {
      return graphQLMap["bl_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bl_weight")
    }
  }

  public var tonalityWeight: Double? {
    get {
      return graphQLMap["tonality_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_weight")
    }
  }

  public var speedWeight: Double? {
    get {
      return graphQLMap["speed_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "speed_weight")
    }
  }

  public var fwWeight: Double? {
    get {
      return graphQLMap["fw_weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fw_weight")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var timestamp: String? {
    get {
      return graphQLMap["timestamp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "timestamp")
    }
  }
}

public struct CreateSpeed_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var speedResultUuid: String {
    get {
      return graphQLMap["speed_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "speed_result_uuid")
    }
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct UpdateSpeed_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(speedResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var speedResultUuid: String {
    get {
      return graphQLMap["speed_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "speed_result_uuid")
    }
  }

  public var creditUsageUuid: String? {
    get {
      return graphQLMap["credit_usage_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct CreateTonality_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var tonalityResultUuid: String {
    get {
      return graphQLMap["tonality_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_uuid")
    }
  }

  public var creditUsageUuid: String {
    get {
      return graphQLMap["credit_usage_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct UpdateTonality_resultInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(tonalityResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
    graphQLMap = ["tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime]
  }

  public var tonalityResultUuid: String {
    get {
      return graphQLMap["tonality_result_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_uuid")
    }
  }

  public var creditUsageUuid: String? {
    get {
      return graphQLMap["credit_usage_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credit_usage_uuid")
    }
  }

  public var status: String? {
    get {
      return graphQLMap["status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var score: Double? {
    get {
      return graphQLMap["score"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "score")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }
}

public struct CreateTonality_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
    graphQLMap = ["tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid]
  }

  public var tonalityResultDetailUuid: String {
    get {
      return graphQLMap["tonality_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_detail_uuid")
    }
  }

  public var tonalityTime: Int? {
    get {
      return graphQLMap["tonality_time"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_time")
    }
  }

  public var tonalityDb: Double? {
    get {
      return graphQLMap["tonality_db"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_db")
    }
  }

  public var tonalityResultUuid: String? {
    get {
      return graphQLMap["tonality_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_uuid")
    }
  }
}

public struct UpdateTonality_result_detailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
    graphQLMap = ["tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid]
  }

  public var tonalityResultDetailUuid: String {
    get {
      return graphQLMap["tonality_result_detail_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_detail_uuid")
    }
  }

  public var tonalityTime: Int? {
    get {
      return graphQLMap["tonality_time"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_time")
    }
  }

  public var tonalityDb: Double? {
    get {
      return graphQLMap["tonality_db"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_db")
    }
  }

  public var tonalityResultUuid: String? {
    get {
      return graphQLMap["tonality_result_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tonality_result_uuid")
    }
  }
}

public struct CreateTransactionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
    graphQLMap = ["transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency]
  }

  public var transactionUuid: String {
    get {
      return graphQLMap["transaction_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "transaction_uuid")
    }
  }

  public var itemUuid: String {
    get {
      return graphQLMap["item_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "item_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var deviceUuid: String? {
    get {
      return graphQLMap["device_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device_uuid")
    }
  }

  public var vendor: String? {
    get {
      return graphQLMap["vendor"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var vendorTransactionId: String? {
    get {
      return graphQLMap["vendor_transaction_id"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor_transaction_id")
    }
  }

  public var currency: String? {
    get {
      return graphQLMap["currency"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }
}

public struct UpdateTransactionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(transactionUuid: String, itemUuid: String? = nil, userUuid: String? = nil, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
    graphQLMap = ["transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency]
  }

  public var transactionUuid: String {
    get {
      return graphQLMap["transaction_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "transaction_uuid")
    }
  }

  public var itemUuid: String? {
    get {
      return graphQLMap["item_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "item_uuid")
    }
  }

  public var userUuid: String? {
    get {
      return graphQLMap["user_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var amount: Double? {
    get {
      return graphQLMap["amount"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var deviceUuid: String? {
    get {
      return graphQLMap["device_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device_uuid")
    }
  }

  public var vendor: String? {
    get {
      return graphQLMap["vendor"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var vendorTransactionId: String? {
    get {
      return graphQLMap["vendor_transaction_id"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor_transaction_id")
    }
  }

  public var currency: String? {
    get {
      return graphQLMap["currency"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
    graphQLMap = ["user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender]
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var firstName: String? {
    get {
      return graphQLMap["first_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_name")
    }
  }

  public var lastName: String? {
    get {
      return graphQLMap["last_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "last_name")
    }
  }

  public var username: String? {
    get {
      return graphQLMap["username"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var vendor: String {
    get {
      return graphQLMap["vendor"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var vendorUuid: String {
    get {
      return graphQLMap["vendor_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor_uuid")
    }
  }

  public var imageUrl: String? {
    get {
      return graphQLMap["image_url"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image_url")
    }
  }

  public var gender: String? {
    get {
      return graphQLMap["gender"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userUuid: String, email: String? = nil, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String? = nil, vendorUuid: String? = nil, imageUrl: String? = nil, gender: String? = nil) {
    graphQLMap = ["user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender]
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var firstName: String? {
    get {
      return graphQLMap["first_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_name")
    }
  }

  public var lastName: String? {
    get {
      return graphQLMap["last_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "last_name")
    }
  }

  public var username: String? {
    get {
      return graphQLMap["username"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var vendor: String? {
    get {
      return graphQLMap["vendor"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var vendorUuid: String? {
    get {
      return graphQLMap["vendor_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor_uuid")
    }
  }

  public var imageUrl: String? {
    get {
      return graphQLMap["image_url"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image_url")
    }
  }

  public var gender: String? {
    get {
      return graphQLMap["gender"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }
}

public struct CreateUser_loginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
    graphQLMap = ["logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod]
  }

  public var logonUuid: String {
    get {
      return graphQLMap["logon_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "logon_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var loginTime: String? {
    get {
      return graphQLMap["login_time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "login_time")
    }
  }

  public var oauthMethod: String? {
    get {
      return graphQLMap["oauth_method"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "oauth_method")
    }
  }
}

public struct UpdateUser_loginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(logonUuid: String, userUuid: String? = nil, loginTime: String? = nil, oauthMethod: String? = nil) {
    graphQLMap = ["logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod]
  }

  public var logonUuid: String {
    get {
      return graphQLMap["logon_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "logon_uuid")
    }
  }

  public var userUuid: String? {
    get {
      return graphQLMap["user_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var loginTime: String? {
    get {
      return graphQLMap["login_time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "login_time")
    }
  }

  public var oauthMethod: String? {
    get {
      return graphQLMap["oauth_method"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "oauth_method")
    }
  }
}

public struct CreateVideoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, commentsCount: Int? = nil, likesCount: Int? = nil, longitude: String? = nil, latitude: String? = nil, title: String? = nil) {
    graphQLMap = ["video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "comments_count": commentsCount, "likes_count": likesCount, "longitude": longitude, "latitude": latitude, "title": title]
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var datetime: String {
    get {
      return graphQLMap["datetime"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var videoName: String? {
    get {
      return graphQLMap["video_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_name")
    }
  }

  public var videoSize: String? {
    get {
      return graphQLMap["video_size"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_size")
    }
  }

  public var videoInfo: String? {
    get {
      return graphQLMap["video_info"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_info")
    }
  }

  public var path: String? {
    get {
      return graphQLMap["path"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "path")
    }
  }

  public var share: Int? {
    get {
      return graphQLMap["share"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "share")
    }
  }

  public var videoDuration: Double? {
    get {
      return graphQLMap["video_duration"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_duration")
    }
  }

  public var active: Int? {
    get {
      return graphQLMap["active"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "active")
    }
  }

  public var uploadStatus: String? {
    get {
      return graphQLMap["upload_status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "upload_status")
    }
  }

  public var analyseStatus: String? {
    get {
      return graphQLMap["analyse_status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "analyse_status")
    }
  }

  public var commentsCount: Int? {
    get {
      return graphQLMap["comments_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var likesCount: Int? {
    get {
      return graphQLMap["likes_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "likes_count")
    }
  }

  public var longitude: String? {
    get {
      return graphQLMap["longitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var latitude: String? {
    get {
      return graphQLMap["latitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}

public struct UpdateVideoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(videoUuid: String, userUuid: String? = nil, datetime: String? = nil, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, commentsCount: Int? = nil, likesCount: Int? = nil, longitude: String? = nil, latitude: String? = nil, title: String? = nil) {
    graphQLMap = ["video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "comments_count": commentsCount, "likes_count": likesCount, "longitude": longitude, "latitude": latitude, "title": title]
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var userUuid: String? {
    get {
      return graphQLMap["user_uuid"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var videoName: String? {
    get {
      return graphQLMap["video_name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_name")
    }
  }

  public var videoSize: String? {
    get {
      return graphQLMap["video_size"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_size")
    }
  }

  public var videoInfo: String? {
    get {
      return graphQLMap["video_info"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_info")
    }
  }

  public var path: String? {
    get {
      return graphQLMap["path"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "path")
    }
  }

  public var share: Int? {
    get {
      return graphQLMap["share"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "share")
    }
  }

  public var videoDuration: Double? {
    get {
      return graphQLMap["video_duration"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_duration")
    }
  }

  public var active: Int? {
    get {
      return graphQLMap["active"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "active")
    }
  }

  public var uploadStatus: String? {
    get {
      return graphQLMap["upload_status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "upload_status")
    }
  }

  public var analyseStatus: String? {
    get {
      return graphQLMap["analyse_status"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "analyse_status")
    }
  }

  public var commentsCount: Int? {
    get {
      return graphQLMap["comments_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comments_count")
    }
  }

  public var likesCount: Int? {
    get {
      return graphQLMap["likes_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "likes_count")
    }
  }

  public var longitude: String? {
    get {
      return graphQLMap["longitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var latitude: String? {
    get {
      return graphQLMap["latitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}

public struct CreateCommentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
    graphQLMap = ["comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn]
  }

  public var commentUuid: String {
    get {
      return graphQLMap["comment_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comment_uuid")
    }
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var comment: String {
    get {
      return graphQLMap["comment"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comment")
    }
  }

  public var createdOn: String? {
    get {
      return graphQLMap["created_on"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "created_on")
    }
  }

  public var repliedTo: String? {
    get {
      return graphQLMap["replied_to"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "replied_to")
    }
  }

  public var modifiedOn: String? {
    get {
      return graphQLMap["modified_on"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "modified_on")
    }
  }
}

public struct UpdateCommentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
    graphQLMap = ["comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn]
  }

  public var commentUuid: String {
    get {
      return graphQLMap["comment_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comment_uuid")
    }
  }

  public var videoUuid: String {
    get {
      return graphQLMap["video_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "video_uuid")
    }
  }

  public var userUuid: String {
    get {
      return graphQLMap["user_uuid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_uuid")
    }
  }

  public var comment: String {
    get {
      return graphQLMap["comment"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "comment")
    }
  }

  public var createdOn: String? {
    get {
      return graphQLMap["created_on"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "created_on")
    }
  }

  public var repliedTo: String? {
    get {
      return graphQLMap["replied_to"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "replied_to")
    }
  }

  public var modifiedOn: String? {
    get {
      return graphQLMap["modified_on"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "modified_on")
    }
  }
}

public final class CreateVideoLikeMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateVideo_like($createVideo_likeInput: CreateVideo_likeInput!) {\n  createVideo_like(createVideo_likeInput: $createVideo_likeInput) {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public var createVideo_likeInput: CreateVideo_likeInput

  public init(createVideo_likeInput: CreateVideo_likeInput) {
    self.createVideo_likeInput = createVideo_likeInput
  }

  public var variables: GraphQLMap? {
    return ["createVideo_likeInput": createVideo_likeInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createVideo_like", arguments: ["createVideo_likeInput": GraphQLVariable("createVideo_likeInput")], type: .object(CreateVideoLike.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createVideoLike: CreateVideoLike? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createVideo_like": createVideoLike.flatMap { $0.snapshot }])
    }

    public var createVideoLike: CreateVideoLike? {
      get {
        return (snapshot["createVideo_like"] as? Snapshot).flatMap { CreateVideoLike(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createVideo_like")
      }
    }

    public struct CreateVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class DeleteVideoLikeMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteVideo_like($video_like_uuid: String!) {\n  deleteVideo_like(video_like_uuid: $video_like_uuid) {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public var video_like_uuid: String

  public init(video_like_uuid: String) {
    self.video_like_uuid = video_like_uuid
  }

  public var variables: GraphQLMap? {
    return ["video_like_uuid": video_like_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteVideo_like", arguments: ["video_like_uuid": GraphQLVariable("video_like_uuid")], type: .object(DeleteVideoLike.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteVideoLike: DeleteVideoLike? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteVideo_like": deleteVideoLike.flatMap { $0.snapshot }])
    }

    public var deleteVideoLike: DeleteVideoLike? {
      get {
        return (snapshot["deleteVideo_like"] as? Snapshot).flatMap { DeleteVideoLike(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteVideo_like")
      }
    }

    public struct DeleteVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class UpdateVideoLikeMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateVideo_like($updateVideo_likeInput: UpdateVideo_likeInput!) {\n  updateVideo_like(updateVideo_likeInput: $updateVideo_likeInput) {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public var updateVideo_likeInput: UpdateVideo_likeInput

  public init(updateVideo_likeInput: UpdateVideo_likeInput) {
    self.updateVideo_likeInput = updateVideo_likeInput
  }

  public var variables: GraphQLMap? {
    return ["updateVideo_likeInput": updateVideo_likeInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateVideo_like", arguments: ["updateVideo_likeInput": GraphQLVariable("updateVideo_likeInput")], type: .object(UpdateVideoLike.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateVideoLike: UpdateVideoLike? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateVideo_like": updateVideoLike.flatMap { $0.snapshot }])
    }

    public var updateVideoLike: UpdateVideoLike? {
      get {
        return (snapshot["updateVideo_like"] as? Snapshot).flatMap { UpdateVideoLike(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateVideo_like")
      }
    }

    public struct UpdateVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class DeleteTemporaryTestMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTemporary_test($TestID: Int!) {\n  deleteTemporary_test(TestID: $TestID) {\n    __typename\n    TestID\n    Testfield\n  }\n}"

  public var TestID: Int

  public init(TestID: Int) {
    self.TestID = TestID
  }

  public var variables: GraphQLMap? {
    return ["TestID": TestID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTemporary_test", arguments: ["TestID": GraphQLVariable("TestID")], type: .object(DeleteTemporaryTest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTemporaryTest: DeleteTemporaryTest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTemporary_test": deleteTemporaryTest.flatMap { $0.snapshot }])
    }

    public var deleteTemporaryTest: DeleteTemporaryTest? {
      get {
        return (snapshot["deleteTemporary_test"] as? Snapshot).flatMap { DeleteTemporaryTest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTemporary_test")
      }
    }

    public struct DeleteTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_test"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
        GraphQLField("Testfield", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(testId: Int, testfield: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var testId: Int {
        get {
          return snapshot["TestID"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "TestID")
        }
      }

      public var testfield: String? {
        get {
          return snapshot["Testfield"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Testfield")
        }
      }
    }
  }
}

public final class CreateTemporaryTestMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateTemporary_test($createTemporary_testInput: CreateTemporary_testInput!) {\n  createTemporary_test(createTemporary_testInput: $createTemporary_testInput) {\n    __typename\n    TestID\n    Testfield\n  }\n}"

  public var createTemporary_testInput: CreateTemporary_testInput

  public init(createTemporary_testInput: CreateTemporary_testInput) {
    self.createTemporary_testInput = createTemporary_testInput
  }

  public var variables: GraphQLMap? {
    return ["createTemporary_testInput": createTemporary_testInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTemporary_test", arguments: ["createTemporary_testInput": GraphQLVariable("createTemporary_testInput")], type: .object(CreateTemporaryTest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTemporaryTest: CreateTemporaryTest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTemporary_test": createTemporaryTest.flatMap { $0.snapshot }])
    }

    public var createTemporaryTest: CreateTemporaryTest? {
      get {
        return (snapshot["createTemporary_test"] as? Snapshot).flatMap { CreateTemporaryTest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTemporary_test")
      }
    }

    public struct CreateTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_test"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
        GraphQLField("Testfield", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(testId: Int, testfield: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var testId: Int {
        get {
          return snapshot["TestID"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "TestID")
        }
      }

      public var testfield: String? {
        get {
          return snapshot["Testfield"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Testfield")
        }
      }
    }
  }
}

public final class UpdateTemporaryTestMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTemporary_test($updateTemporary_testInput: UpdateTemporary_testInput!) {\n  updateTemporary_test(updateTemporary_testInput: $updateTemporary_testInput) {\n    __typename\n    TestID\n    Testfield\n  }\n}"

  public var updateTemporary_testInput: UpdateTemporary_testInput

  public init(updateTemporary_testInput: UpdateTemporary_testInput) {
    self.updateTemporary_testInput = updateTemporary_testInput
  }

  public var variables: GraphQLMap? {
    return ["updateTemporary_testInput": updateTemporary_testInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTemporary_test", arguments: ["updateTemporary_testInput": GraphQLVariable("updateTemporary_testInput")], type: .object(UpdateTemporaryTest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTemporaryTest: UpdateTemporaryTest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTemporary_test": updateTemporaryTest.flatMap { $0.snapshot }])
    }

    public var updateTemporaryTest: UpdateTemporaryTest? {
      get {
        return (snapshot["updateTemporary_test"] as? Snapshot).flatMap { UpdateTemporaryTest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTemporary_test")
      }
    }

    public struct UpdateTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_test"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
        GraphQLField("Testfield", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(testId: Int, testfield: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var testId: Int {
        get {
          return snapshot["TestID"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "TestID")
        }
      }

      public var testfield: String? {
        get {
          return snapshot["Testfield"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Testfield")
        }
      }
    }
  }
}

public final class DeleteBlResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteBl_result($bl_result_uuid: String!) {\n  deleteBl_result(bl_result_uuid: $bl_result_uuid) {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var bl_result_uuid: String

  public init(bl_result_uuid: String) {
    self.bl_result_uuid = bl_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["bl_result_uuid": bl_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBl_result", arguments: ["bl_result_uuid": GraphQLVariable("bl_result_uuid")], type: .object(DeleteBlResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteBlResult: DeleteBlResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteBl_result": deleteBlResult.flatMap { $0.snapshot }])
    }

    public var deleteBlResult: DeleteBlResult? {
      get {
        return (snapshot["deleteBl_result"] as? Snapshot).flatMap { DeleteBlResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteBl_result")
      }
    }

    public struct DeleteBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class CreateBlResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateBl_result($createBl_resultInput: CreateBl_resultInput!) {\n  createBl_result(createBl_resultInput: $createBl_resultInput) {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var createBl_resultInput: CreateBl_resultInput

  public init(createBl_resultInput: CreateBl_resultInput) {
    self.createBl_resultInput = createBl_resultInput
  }

  public var variables: GraphQLMap? {
    return ["createBl_resultInput": createBl_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBl_result", arguments: ["createBl_resultInput": GraphQLVariable("createBl_resultInput")], type: .object(CreateBlResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createBlResult: CreateBlResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createBl_result": createBlResult.flatMap { $0.snapshot }])
    }

    public var createBlResult: CreateBlResult? {
      get {
        return (snapshot["createBl_result"] as? Snapshot).flatMap { CreateBlResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createBl_result")
      }
    }

    public struct CreateBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class UpdateBlResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateBl_result($updateBl_resultInput: UpdateBl_resultInput!) {\n  updateBl_result(updateBl_resultInput: $updateBl_resultInput) {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var updateBl_resultInput: UpdateBl_resultInput

  public init(updateBl_resultInput: UpdateBl_resultInput) {
    self.updateBl_resultInput = updateBl_resultInput
  }

  public var variables: GraphQLMap? {
    return ["updateBl_resultInput": updateBl_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBl_result", arguments: ["updateBl_resultInput": GraphQLVariable("updateBl_resultInput")], type: .object(UpdateBlResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateBlResult: UpdateBlResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateBl_result": updateBlResult.flatMap { $0.snapshot }])
    }

    public var updateBlResult: UpdateBlResult? {
      get {
        return (snapshot["updateBl_result"] as? Snapshot).flatMap { UpdateBlResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateBl_result")
      }
    }

    public struct UpdateBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class DeleteBlResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteBl_result_detail($bl_result_detail_uuid: String!) {\n  deleteBl_result_detail(bl_result_detail_uuid: $bl_result_detail_uuid) {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public var bl_result_detail_uuid: String

  public init(bl_result_detail_uuid: String) {
    self.bl_result_detail_uuid = bl_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["bl_result_detail_uuid": bl_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBl_result_detail", arguments: ["bl_result_detail_uuid": GraphQLVariable("bl_result_detail_uuid")], type: .object(DeleteBlResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteBlResultDetail: DeleteBlResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteBl_result_detail": deleteBlResultDetail.flatMap { $0.snapshot }])
    }

    public var deleteBlResultDetail: DeleteBlResultDetail? {
      get {
        return (snapshot["deleteBl_result_detail"] as? Snapshot).flatMap { DeleteBlResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteBl_result_detail")
      }
    }

    public struct DeleteBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class CreateBlResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateBl_result_detail($createBl_result_detailInput: CreateBl_result_detailInput!) {\n  createBl_result_detail(createBl_result_detailInput: $createBl_result_detailInput) {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public var createBl_result_detailInput: CreateBl_result_detailInput

  public init(createBl_result_detailInput: CreateBl_result_detailInput) {
    self.createBl_result_detailInput = createBl_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["createBl_result_detailInput": createBl_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBl_result_detail", arguments: ["createBl_result_detailInput": GraphQLVariable("createBl_result_detailInput")], type: .object(CreateBlResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createBlResultDetail: CreateBlResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createBl_result_detail": createBlResultDetail.flatMap { $0.snapshot }])
    }

    public var createBlResultDetail: CreateBlResultDetail? {
      get {
        return (snapshot["createBl_result_detail"] as? Snapshot).flatMap { CreateBlResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createBl_result_detail")
      }
    }

    public struct CreateBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class UpdateBlResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateBl_result_detail($updateBl_result_detailInput: UpdateBl_result_detailInput!) {\n  updateBl_result_detail(updateBl_result_detailInput: $updateBl_result_detailInput) {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public var updateBl_result_detailInput: UpdateBl_result_detailInput

  public init(updateBl_result_detailInput: UpdateBl_result_detailInput) {
    self.updateBl_result_detailInput = updateBl_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["updateBl_result_detailInput": updateBl_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBl_result_detail", arguments: ["updateBl_result_detailInput": GraphQLVariable("updateBl_result_detailInput")], type: .object(UpdateBlResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateBlResultDetail: UpdateBlResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateBl_result_detail": updateBlResultDetail.flatMap { $0.snapshot }])
    }

    public var updateBlResultDetail: UpdateBlResultDetail? {
      get {
        return (snapshot["updateBl_result_detail"] as? Snapshot).flatMap { UpdateBlResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateBl_result_detail")
      }
    }

    public struct UpdateBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class DeleteCatalogMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteCatalog($item_uuid: String!) {\n  deleteCatalog(item_uuid: $item_uuid) {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public var item_uuid: String

  public init(item_uuid: String) {
    self.item_uuid = item_uuid
  }

  public var variables: GraphQLMap? {
    return ["item_uuid": item_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteCatalog", arguments: ["item_uuid": GraphQLVariable("item_uuid")], type: .object(DeleteCatalog.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteCatalog: DeleteCatalog? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteCatalog": deleteCatalog.flatMap { $0.snapshot }])
    }

    public var deleteCatalog: DeleteCatalog? {
      get {
        return (snapshot["deleteCatalog"] as? Snapshot).flatMap { DeleteCatalog(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteCatalog")
      }
    }

    public struct DeleteCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class CreateCatalogMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateCatalog($createCatalogInput: CreateCatalogInput!) {\n  createCatalog(createCatalogInput: $createCatalogInput) {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public var createCatalogInput: CreateCatalogInput

  public init(createCatalogInput: CreateCatalogInput) {
    self.createCatalogInput = createCatalogInput
  }

  public var variables: GraphQLMap? {
    return ["createCatalogInput": createCatalogInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createCatalog", arguments: ["createCatalogInput": GraphQLVariable("createCatalogInput")], type: .object(CreateCatalog.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createCatalog: CreateCatalog? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createCatalog": createCatalog.flatMap { $0.snapshot }])
    }

    public var createCatalog: CreateCatalog? {
      get {
        return (snapshot["createCatalog"] as? Snapshot).flatMap { CreateCatalog(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createCatalog")
      }
    }

    public struct CreateCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class UpdateCatalogMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateCatalog($updateCatalogInput: UpdateCatalogInput!) {\n  updateCatalog(updateCatalogInput: $updateCatalogInput) {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public var updateCatalogInput: UpdateCatalogInput

  public init(updateCatalogInput: UpdateCatalogInput) {
    self.updateCatalogInput = updateCatalogInput
  }

  public var variables: GraphQLMap? {
    return ["updateCatalogInput": updateCatalogInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateCatalog", arguments: ["updateCatalogInput": GraphQLVariable("updateCatalogInput")], type: .object(UpdateCatalog.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateCatalog: UpdateCatalog? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateCatalog": updateCatalog.flatMap { $0.snapshot }])
    }

    public var updateCatalog: UpdateCatalog? {
      get {
        return (snapshot["updateCatalog"] as? Snapshot).flatMap { UpdateCatalog(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateCatalog")
      }
    }

    public struct UpdateCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class DeleteCreditUsageMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteCredit_usage($credit_usage_uuid: String!) {\n  deleteCredit_usage(credit_usage_uuid: $credit_usage_uuid) {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public var credit_usage_uuid: String

  public init(credit_usage_uuid: String) {
    self.credit_usage_uuid = credit_usage_uuid
  }

  public var variables: GraphQLMap? {
    return ["credit_usage_uuid": credit_usage_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteCredit_usage", arguments: ["credit_usage_uuid": GraphQLVariable("credit_usage_uuid")], type: .object(DeleteCreditUsage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteCreditUsage: DeleteCreditUsage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteCredit_usage": deleteCreditUsage.flatMap { $0.snapshot }])
    }

    public var deleteCreditUsage: DeleteCreditUsage? {
      get {
        return (snapshot["deleteCredit_usage"] as? Snapshot).flatMap { DeleteCreditUsage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteCredit_usage")
      }
    }

    public struct DeleteCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class CreateCreditUsageMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateCredit_usage($createCredit_usageInput: CreateCredit_usageInput!) {\n  createCredit_usage(createCredit_usageInput: $createCredit_usageInput) {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public var createCredit_usageInput: CreateCredit_usageInput

  public init(createCredit_usageInput: CreateCredit_usageInput) {
    self.createCredit_usageInput = createCredit_usageInput
  }

  public var variables: GraphQLMap? {
    return ["createCredit_usageInput": createCredit_usageInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createCredit_usage", arguments: ["createCredit_usageInput": GraphQLVariable("createCredit_usageInput")], type: .object(CreateCreditUsage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createCreditUsage: CreateCreditUsage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createCredit_usage": createCreditUsage.flatMap { $0.snapshot }])
    }

    public var createCreditUsage: CreateCreditUsage? {
      get {
        return (snapshot["createCredit_usage"] as? Snapshot).flatMap { CreateCreditUsage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createCredit_usage")
      }
    }

    public struct CreateCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class UpdateCreditUsageMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateCredit_usage($updateCredit_usageInput: UpdateCredit_usageInput!) {\n  updateCredit_usage(updateCredit_usageInput: $updateCredit_usageInput) {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public var updateCredit_usageInput: UpdateCredit_usageInput

  public init(updateCredit_usageInput: UpdateCredit_usageInput) {
    self.updateCredit_usageInput = updateCredit_usageInput
  }

  public var variables: GraphQLMap? {
    return ["updateCredit_usageInput": updateCredit_usageInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateCredit_usage", arguments: ["updateCredit_usageInput": GraphQLVariable("updateCredit_usageInput")], type: .object(UpdateCreditUsage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateCreditUsage: UpdateCreditUsage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateCredit_usage": updateCreditUsage.flatMap { $0.snapshot }])
    }

    public var updateCreditUsage: UpdateCreditUsage? {
      get {
        return (snapshot["updateCredit_usage"] as? Snapshot).flatMap { UpdateCreditUsage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateCredit_usage")
      }
    }

    public struct UpdateCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class DeleteFwResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteFw_result($fw_result_uuid: String!) {\n  deleteFw_result(fw_result_uuid: $fw_result_uuid) {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var fw_result_uuid: String

  public init(fw_result_uuid: String) {
    self.fw_result_uuid = fw_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["fw_result_uuid": fw_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteFw_result", arguments: ["fw_result_uuid": GraphQLVariable("fw_result_uuid")], type: .object(DeleteFwResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteFwResult: DeleteFwResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteFw_result": deleteFwResult.flatMap { $0.snapshot }])
    }

    public var deleteFwResult: DeleteFwResult? {
      get {
        return (snapshot["deleteFw_result"] as? Snapshot).flatMap { DeleteFwResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteFw_result")
      }
    }

    public struct DeleteFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class CreateFwResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateFw_result($createFw_resultInput: CreateFw_resultInput!) {\n  createFw_result(createFw_resultInput: $createFw_resultInput) {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var createFw_resultInput: CreateFw_resultInput

  public init(createFw_resultInput: CreateFw_resultInput) {
    self.createFw_resultInput = createFw_resultInput
  }

  public var variables: GraphQLMap? {
    return ["createFw_resultInput": createFw_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFw_result", arguments: ["createFw_resultInput": GraphQLVariable("createFw_resultInput")], type: .object(CreateFwResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createFwResult: CreateFwResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createFw_result": createFwResult.flatMap { $0.snapshot }])
    }

    public var createFwResult: CreateFwResult? {
      get {
        return (snapshot["createFw_result"] as? Snapshot).flatMap { CreateFwResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createFw_result")
      }
    }

    public struct CreateFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class UpdateFwResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateFw_result($updateFw_resultInput: UpdateFw_resultInput!) {\n  updateFw_result(updateFw_resultInput: $updateFw_resultInput) {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var updateFw_resultInput: UpdateFw_resultInput

  public init(updateFw_resultInput: UpdateFw_resultInput) {
    self.updateFw_resultInput = updateFw_resultInput
  }

  public var variables: GraphQLMap? {
    return ["updateFw_resultInput": updateFw_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateFw_result", arguments: ["updateFw_resultInput": GraphQLVariable("updateFw_resultInput")], type: .object(UpdateFwResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateFwResult: UpdateFwResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateFw_result": updateFwResult.flatMap { $0.snapshot }])
    }

    public var updateFwResult: UpdateFwResult? {
      get {
        return (snapshot["updateFw_result"] as? Snapshot).flatMap { UpdateFwResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateFw_result")
      }
    }

    public struct UpdateFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class DeleteFwResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteFw_result_detail($fw_result_detail_uuid: String!) {\n  deleteFw_result_detail(fw_result_detail_uuid: $fw_result_detail_uuid) {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public var fw_result_detail_uuid: String

  public init(fw_result_detail_uuid: String) {
    self.fw_result_detail_uuid = fw_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["fw_result_detail_uuid": fw_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteFw_result_detail", arguments: ["fw_result_detail_uuid": GraphQLVariable("fw_result_detail_uuid")], type: .object(DeleteFwResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteFwResultDetail: DeleteFwResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteFw_result_detail": deleteFwResultDetail.flatMap { $0.snapshot }])
    }

    public var deleteFwResultDetail: DeleteFwResultDetail? {
      get {
        return (snapshot["deleteFw_result_detail"] as? Snapshot).flatMap { DeleteFwResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteFw_result_detail")
      }
    }

    public struct DeleteFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class CreateFwResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateFw_result_detail($createFw_result_detailInput: CreateFw_result_detailInput!) {\n  createFw_result_detail(createFw_result_detailInput: $createFw_result_detailInput) {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public var createFw_result_detailInput: CreateFw_result_detailInput

  public init(createFw_result_detailInput: CreateFw_result_detailInput) {
    self.createFw_result_detailInput = createFw_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["createFw_result_detailInput": createFw_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFw_result_detail", arguments: ["createFw_result_detailInput": GraphQLVariable("createFw_result_detailInput")], type: .object(CreateFwResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createFwResultDetail: CreateFwResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createFw_result_detail": createFwResultDetail.flatMap { $0.snapshot }])
    }

    public var createFwResultDetail: CreateFwResultDetail? {
      get {
        return (snapshot["createFw_result_detail"] as? Snapshot).flatMap { CreateFwResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createFw_result_detail")
      }
    }

    public struct CreateFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class UpdateFwResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateFw_result_detail($updateFw_result_detailInput: UpdateFw_result_detailInput!) {\n  updateFw_result_detail(updateFw_result_detailInput: $updateFw_result_detailInput) {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public var updateFw_result_detailInput: UpdateFw_result_detailInput

  public init(updateFw_result_detailInput: UpdateFw_result_detailInput) {
    self.updateFw_result_detailInput = updateFw_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["updateFw_result_detailInput": updateFw_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateFw_result_detail", arguments: ["updateFw_result_detailInput": GraphQLVariable("updateFw_result_detailInput")], type: .object(UpdateFwResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateFwResultDetail: UpdateFwResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateFw_result_detail": updateFwResultDetail.flatMap { $0.snapshot }])
    }

    public var updateFwResultDetail: UpdateFwResultDetail? {
      get {
        return (snapshot["updateFw_result_detail"] as? Snapshot).flatMap { UpdateFwResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateFw_result_detail")
      }
    }

    public struct UpdateFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class DeleteNewsMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteNews($news_uuid: String!) {\n  deleteNews(news_uuid: $news_uuid) {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public var news_uuid: String

  public init(news_uuid: String) {
    self.news_uuid = news_uuid
  }

  public var variables: GraphQLMap? {
    return ["news_uuid": news_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteNews", arguments: ["news_uuid": GraphQLVariable("news_uuid")], type: .object(DeleteNews.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteNews: DeleteNews? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteNews": deleteNews.flatMap { $0.snapshot }])
    }

    public var deleteNews: DeleteNews? {
      get {
        return (snapshot["deleteNews"] as? Snapshot).flatMap { DeleteNews(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteNews")
      }
    }

    public struct DeleteNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class CreateNewsMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateNews($createNewsInput: CreateNewsInput!) {\n  createNews(createNewsInput: $createNewsInput) {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public var createNewsInput: CreateNewsInput

  public init(createNewsInput: CreateNewsInput) {
    self.createNewsInput = createNewsInput
  }

  public var variables: GraphQLMap? {
    return ["createNewsInput": createNewsInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createNews", arguments: ["createNewsInput": GraphQLVariable("createNewsInput")], type: .object(CreateNews.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createNews: CreateNews? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createNews": createNews.flatMap { $0.snapshot }])
    }

    public var createNews: CreateNews? {
      get {
        return (snapshot["createNews"] as? Snapshot).flatMap { CreateNews(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createNews")
      }
    }

    public struct CreateNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class UpdateNewsMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateNews($updateNewsInput: UpdateNewsInput!) {\n  updateNews(updateNewsInput: $updateNewsInput) {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public var updateNewsInput: UpdateNewsInput

  public init(updateNewsInput: UpdateNewsInput) {
    self.updateNewsInput = updateNewsInput
  }

  public var variables: GraphQLMap? {
    return ["updateNewsInput": updateNewsInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateNews", arguments: ["updateNewsInput": GraphQLVariable("updateNewsInput")], type: .object(UpdateNews.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateNews: UpdateNews? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateNews": updateNews.flatMap { $0.snapshot }])
    }

    public var updateNews: UpdateNews? {
      get {
        return (snapshot["updateNews"] as? Snapshot).flatMap { UpdateNews(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateNews")
      }
    }

    public struct UpdateNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class DeleteScoreWeightMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteScore_weight($weight_uuid: Int!) {\n  deleteScore_weight(weight_uuid: $weight_uuid) {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public var weight_uuid: Int

  public init(weight_uuid: Int) {
    self.weight_uuid = weight_uuid
  }

  public var variables: GraphQLMap? {
    return ["weight_uuid": weight_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteScore_weight", arguments: ["weight_uuid": GraphQLVariable("weight_uuid")], type: .object(DeleteScoreWeight.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteScoreWeight: DeleteScoreWeight? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteScore_weight": deleteScoreWeight.flatMap { $0.snapshot }])
    }

    public var deleteScoreWeight: DeleteScoreWeight? {
      get {
        return (snapshot["deleteScore_weight"] as? Snapshot).flatMap { DeleteScoreWeight(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteScore_weight")
      }
    }

    public struct DeleteScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class CreateScoreWeightMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateScore_weight($createScore_weightInput: CreateScore_weightInput!) {\n  createScore_weight(createScore_weightInput: $createScore_weightInput) {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public var createScore_weightInput: CreateScore_weightInput

  public init(createScore_weightInput: CreateScore_weightInput) {
    self.createScore_weightInput = createScore_weightInput
  }

  public var variables: GraphQLMap? {
    return ["createScore_weightInput": createScore_weightInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createScore_weight", arguments: ["createScore_weightInput": GraphQLVariable("createScore_weightInput")], type: .object(CreateScoreWeight.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createScoreWeight: CreateScoreWeight? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createScore_weight": createScoreWeight.flatMap { $0.snapshot }])
    }

    public var createScoreWeight: CreateScoreWeight? {
      get {
        return (snapshot["createScore_weight"] as? Snapshot).flatMap { CreateScoreWeight(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createScore_weight")
      }
    }

    public struct CreateScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class UpdateScoreWeightMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateScore_weight($updateScore_weightInput: UpdateScore_weightInput!) {\n  updateScore_weight(updateScore_weightInput: $updateScore_weightInput) {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public var updateScore_weightInput: UpdateScore_weightInput

  public init(updateScore_weightInput: UpdateScore_weightInput) {
    self.updateScore_weightInput = updateScore_weightInput
  }

  public var variables: GraphQLMap? {
    return ["updateScore_weightInput": updateScore_weightInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateScore_weight", arguments: ["updateScore_weightInput": GraphQLVariable("updateScore_weightInput")], type: .object(UpdateScoreWeight.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateScoreWeight: UpdateScoreWeight? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateScore_weight": updateScoreWeight.flatMap { $0.snapshot }])
    }

    public var updateScoreWeight: UpdateScoreWeight? {
      get {
        return (snapshot["updateScore_weight"] as? Snapshot).flatMap { UpdateScoreWeight(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateScore_weight")
      }
    }

    public struct UpdateScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class DeleteSpeedResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteSpeed_result($speed_result_uuid: String!) {\n  deleteSpeed_result(speed_result_uuid: $speed_result_uuid) {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var speed_result_uuid: String

  public init(speed_result_uuid: String) {
    self.speed_result_uuid = speed_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["speed_result_uuid": speed_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteSpeed_result", arguments: ["speed_result_uuid": GraphQLVariable("speed_result_uuid")], type: .object(DeleteSpeedResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteSpeedResult: DeleteSpeedResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteSpeed_result": deleteSpeedResult.flatMap { $0.snapshot }])
    }

    public var deleteSpeedResult: DeleteSpeedResult? {
      get {
        return (snapshot["deleteSpeed_result"] as? Snapshot).flatMap { DeleteSpeedResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteSpeed_result")
      }
    }

    public struct DeleteSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class CreateSpeedResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateSpeed_result($createSpeed_resultInput: CreateSpeed_resultInput!) {\n  createSpeed_result(createSpeed_resultInput: $createSpeed_resultInput) {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var createSpeed_resultInput: CreateSpeed_resultInput

  public init(createSpeed_resultInput: CreateSpeed_resultInput) {
    self.createSpeed_resultInput = createSpeed_resultInput
  }

  public var variables: GraphQLMap? {
    return ["createSpeed_resultInput": createSpeed_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createSpeed_result", arguments: ["createSpeed_resultInput": GraphQLVariable("createSpeed_resultInput")], type: .object(CreateSpeedResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createSpeedResult: CreateSpeedResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createSpeed_result": createSpeedResult.flatMap { $0.snapshot }])
    }

    public var createSpeedResult: CreateSpeedResult? {
      get {
        return (snapshot["createSpeed_result"] as? Snapshot).flatMap { CreateSpeedResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createSpeed_result")
      }
    }

    public struct CreateSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class UpdateSpeedResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateSpeed_result($updateSpeed_resultInput: UpdateSpeed_resultInput!) {\n  updateSpeed_result(updateSpeed_resultInput: $updateSpeed_resultInput) {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var updateSpeed_resultInput: UpdateSpeed_resultInput

  public init(updateSpeed_resultInput: UpdateSpeed_resultInput) {
    self.updateSpeed_resultInput = updateSpeed_resultInput
  }

  public var variables: GraphQLMap? {
    return ["updateSpeed_resultInput": updateSpeed_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateSpeed_result", arguments: ["updateSpeed_resultInput": GraphQLVariable("updateSpeed_resultInput")], type: .object(UpdateSpeedResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateSpeedResult: UpdateSpeedResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateSpeed_result": updateSpeedResult.flatMap { $0.snapshot }])
    }

    public var updateSpeedResult: UpdateSpeedResult? {
      get {
        return (snapshot["updateSpeed_result"] as? Snapshot).flatMap { UpdateSpeedResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateSpeed_result")
      }
    }

    public struct UpdateSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class DeleteTonalityResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTonality_result($tonality_result_uuid: String!) {\n  deleteTonality_result(tonality_result_uuid: $tonality_result_uuid) {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var tonality_result_uuid: String

  public init(tonality_result_uuid: String) {
    self.tonality_result_uuid = tonality_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["tonality_result_uuid": tonality_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTonality_result", arguments: ["tonality_result_uuid": GraphQLVariable("tonality_result_uuid")], type: .object(DeleteTonalityResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTonalityResult: DeleteTonalityResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTonality_result": deleteTonalityResult.flatMap { $0.snapshot }])
    }

    public var deleteTonalityResult: DeleteTonalityResult? {
      get {
        return (snapshot["deleteTonality_result"] as? Snapshot).flatMap { DeleteTonalityResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTonality_result")
      }
    }

    public struct DeleteTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class CreateTonalityResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateTonality_result($createTonality_resultInput: CreateTonality_resultInput!) {\n  createTonality_result(createTonality_resultInput: $createTonality_resultInput) {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var createTonality_resultInput: CreateTonality_resultInput

  public init(createTonality_resultInput: CreateTonality_resultInput) {
    self.createTonality_resultInput = createTonality_resultInput
  }

  public var variables: GraphQLMap? {
    return ["createTonality_resultInput": createTonality_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTonality_result", arguments: ["createTonality_resultInput": GraphQLVariable("createTonality_resultInput")], type: .object(CreateTonalityResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTonalityResult: CreateTonalityResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTonality_result": createTonalityResult.flatMap { $0.snapshot }])
    }

    public var createTonalityResult: CreateTonalityResult? {
      get {
        return (snapshot["createTonality_result"] as? Snapshot).flatMap { CreateTonalityResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTonality_result")
      }
    }

    public struct CreateTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class UpdateTonalityResultMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTonality_result($updateTonality_resultInput: UpdateTonality_resultInput!) {\n  updateTonality_result(updateTonality_resultInput: $updateTonality_resultInput) {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var updateTonality_resultInput: UpdateTonality_resultInput

  public init(updateTonality_resultInput: UpdateTonality_resultInput) {
    self.updateTonality_resultInput = updateTonality_resultInput
  }

  public var variables: GraphQLMap? {
    return ["updateTonality_resultInput": updateTonality_resultInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTonality_result", arguments: ["updateTonality_resultInput": GraphQLVariable("updateTonality_resultInput")], type: .object(UpdateTonalityResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTonalityResult: UpdateTonalityResult? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTonality_result": updateTonalityResult.flatMap { $0.snapshot }])
    }

    public var updateTonalityResult: UpdateTonalityResult? {
      get {
        return (snapshot["updateTonality_result"] as? Snapshot).flatMap { UpdateTonalityResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTonality_result")
      }
    }

    public struct UpdateTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class DeleteTonalityResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTonality_result_detail($tonality_result_detail_uuid: String!) {\n  deleteTonality_result_detail(tonality_result_detail_uuid: $tonality_result_detail_uuid) {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public var tonality_result_detail_uuid: String

  public init(tonality_result_detail_uuid: String) {
    self.tonality_result_detail_uuid = tonality_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["tonality_result_detail_uuid": tonality_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTonality_result_detail", arguments: ["tonality_result_detail_uuid": GraphQLVariable("tonality_result_detail_uuid")], type: .object(DeleteTonalityResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTonalityResultDetail: DeleteTonalityResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTonality_result_detail": deleteTonalityResultDetail.flatMap { $0.snapshot }])
    }

    public var deleteTonalityResultDetail: DeleteTonalityResultDetail? {
      get {
        return (snapshot["deleteTonality_result_detail"] as? Snapshot).flatMap { DeleteTonalityResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTonality_result_detail")
      }
    }

    public struct DeleteTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class CreateTonalityResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateTonality_result_detail($createTonality_result_detailInput: CreateTonality_result_detailInput!) {\n  createTonality_result_detail(createTonality_result_detailInput: $createTonality_result_detailInput) {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public var createTonality_result_detailInput: CreateTonality_result_detailInput

  public init(createTonality_result_detailInput: CreateTonality_result_detailInput) {
    self.createTonality_result_detailInput = createTonality_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["createTonality_result_detailInput": createTonality_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTonality_result_detail", arguments: ["createTonality_result_detailInput": GraphQLVariable("createTonality_result_detailInput")], type: .object(CreateTonalityResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTonalityResultDetail: CreateTonalityResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTonality_result_detail": createTonalityResultDetail.flatMap { $0.snapshot }])
    }

    public var createTonalityResultDetail: CreateTonalityResultDetail? {
      get {
        return (snapshot["createTonality_result_detail"] as? Snapshot).flatMap { CreateTonalityResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTonality_result_detail")
      }
    }

    public struct CreateTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class UpdateTonalityResultDetailMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTonality_result_detail($updateTonality_result_detailInput: UpdateTonality_result_detailInput!) {\n  updateTonality_result_detail(updateTonality_result_detailInput: $updateTonality_result_detailInput) {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public var updateTonality_result_detailInput: UpdateTonality_result_detailInput

  public init(updateTonality_result_detailInput: UpdateTonality_result_detailInput) {
    self.updateTonality_result_detailInput = updateTonality_result_detailInput
  }

  public var variables: GraphQLMap? {
    return ["updateTonality_result_detailInput": updateTonality_result_detailInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTonality_result_detail", arguments: ["updateTonality_result_detailInput": GraphQLVariable("updateTonality_result_detailInput")], type: .object(UpdateTonalityResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTonalityResultDetail: UpdateTonalityResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTonality_result_detail": updateTonalityResultDetail.flatMap { $0.snapshot }])
    }

    public var updateTonalityResultDetail: UpdateTonalityResultDetail? {
      get {
        return (snapshot["updateTonality_result_detail"] as? Snapshot).flatMap { UpdateTonalityResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTonality_result_detail")
      }
    }

    public struct UpdateTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class DeleteTransactionMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTransaction($transaction_uuid: String!) {\n  deleteTransaction(transaction_uuid: $transaction_uuid) {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public var transaction_uuid: String

  public init(transaction_uuid: String) {
    self.transaction_uuid = transaction_uuid
  }

  public var variables: GraphQLMap? {
    return ["transaction_uuid": transaction_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTransaction", arguments: ["transaction_uuid": GraphQLVariable("transaction_uuid")], type: .object(DeleteTransaction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTransaction: DeleteTransaction? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTransaction": deleteTransaction.flatMap { $0.snapshot }])
    }

    public var deleteTransaction: DeleteTransaction? {
      get {
        return (snapshot["deleteTransaction"] as? Snapshot).flatMap { DeleteTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTransaction")
      }
    }

    public struct DeleteTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class CreateTransactionMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateTransaction($createTransactionInput: CreateTransactionInput!) {\n  createTransaction(createTransactionInput: $createTransactionInput) {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public var createTransactionInput: CreateTransactionInput

  public init(createTransactionInput: CreateTransactionInput) {
    self.createTransactionInput = createTransactionInput
  }

  public var variables: GraphQLMap? {
    return ["createTransactionInput": createTransactionInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTransaction", arguments: ["createTransactionInput": GraphQLVariable("createTransactionInput")], type: .object(CreateTransaction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTransaction: CreateTransaction? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTransaction": createTransaction.flatMap { $0.snapshot }])
    }

    public var createTransaction: CreateTransaction? {
      get {
        return (snapshot["createTransaction"] as? Snapshot).flatMap { CreateTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTransaction")
      }
    }

    public struct CreateTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class UpdateTransactionMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTransaction($updateTransactionInput: UpdateTransactionInput!) {\n  updateTransaction(updateTransactionInput: $updateTransactionInput) {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public var updateTransactionInput: UpdateTransactionInput

  public init(updateTransactionInput: UpdateTransactionInput) {
    self.updateTransactionInput = updateTransactionInput
  }

  public var variables: GraphQLMap? {
    return ["updateTransactionInput": updateTransactionInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTransaction", arguments: ["updateTransactionInput": GraphQLVariable("updateTransactionInput")], type: .object(UpdateTransaction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTransaction: UpdateTransaction? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTransaction": updateTransaction.flatMap { $0.snapshot }])
    }

    public var updateTransaction: UpdateTransaction? {
      get {
        return (snapshot["updateTransaction"] as? Snapshot).flatMap { UpdateTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTransaction")
      }
    }

    public struct UpdateTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUser($user_uuid: String!) {\n  deleteUser(user_uuid: $user_uuid) {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public var user_uuid: String

  public init(user_uuid: String) {
    self.user_uuid = user_uuid
  }

  public var variables: GraphQLMap? {
    return ["user_uuid": user_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUser", arguments: ["user_uuid": GraphQLVariable("user_uuid")], type: .object(DeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { $0.snapshot }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (snapshot["deleteUser"] as? Snapshot).flatMap { DeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUser($createUserInput: CreateUserInput!) {\n  createUser(createUserInput: $createUserInput) {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public var createUserInput: CreateUserInput

  public init(createUserInput: CreateUserInput) {
    self.createUserInput = createUserInput
  }

  public var variables: GraphQLMap? {
    return ["createUserInput": createUserInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["createUserInput": GraphQLVariable("createUserInput")], type: .object(CreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUser: CreateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser": createUser.flatMap { $0.snapshot }])
    }

    public var createUser: CreateUser? {
      get {
        return (snapshot["createUser"] as? Snapshot).flatMap { CreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUser($updateUserInput: UpdateUserInput!) {\n  updateUser(updateUserInput: $updateUserInput) {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public var updateUserInput: UpdateUserInput

  public init(updateUserInput: UpdateUserInput) {
    self.updateUserInput = updateUserInput
  }

  public var variables: GraphQLMap? {
    return ["updateUserInput": updateUserInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["updateUserInput": GraphQLVariable("updateUserInput")], type: .object(UpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUser": updateUser.flatMap { $0.snapshot }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (snapshot["updateUser"] as? Snapshot).flatMap { UpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class DeleteUserLoginMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUser_login($logon_uuid: String!) {\n  deleteUser_login(logon_uuid: $logon_uuid) {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public var logon_uuid: String

  public init(logon_uuid: String) {
    self.logon_uuid = logon_uuid
  }

  public var variables: GraphQLMap? {
    return ["logon_uuid": logon_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUser_login", arguments: ["logon_uuid": GraphQLVariable("logon_uuid")], type: .object(DeleteUserLogin.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserLogin: DeleteUserLogin? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUser_login": deleteUserLogin.flatMap { $0.snapshot }])
    }

    public var deleteUserLogin: DeleteUserLogin? {
      get {
        return (snapshot["deleteUser_login"] as? Snapshot).flatMap { DeleteUserLogin(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUser_login")
      }
    }

    public struct DeleteUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class CreateUserLoginMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUser_login($createUser_loginInput: CreateUser_loginInput!) {\n  createUser_login(createUser_loginInput: $createUser_loginInput) {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public var createUser_loginInput: CreateUser_loginInput

  public init(createUser_loginInput: CreateUser_loginInput) {
    self.createUser_loginInput = createUser_loginInput
  }

  public var variables: GraphQLMap? {
    return ["createUser_loginInput": createUser_loginInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser_login", arguments: ["createUser_loginInput": GraphQLVariable("createUser_loginInput")], type: .object(CreateUserLogin.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserLogin: CreateUserLogin? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser_login": createUserLogin.flatMap { $0.snapshot }])
    }

    public var createUserLogin: CreateUserLogin? {
      get {
        return (snapshot["createUser_login"] as? Snapshot).flatMap { CreateUserLogin(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser_login")
      }
    }

    public struct CreateUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class UpdateUserLoginMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUser_login($updateUser_loginInput: UpdateUser_loginInput!) {\n  updateUser_login(updateUser_loginInput: $updateUser_loginInput) {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public var updateUser_loginInput: UpdateUser_loginInput

  public init(updateUser_loginInput: UpdateUser_loginInput) {
    self.updateUser_loginInput = updateUser_loginInput
  }

  public var variables: GraphQLMap? {
    return ["updateUser_loginInput": updateUser_loginInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser_login", arguments: ["updateUser_loginInput": GraphQLVariable("updateUser_loginInput")], type: .object(UpdateUserLogin.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserLogin: UpdateUserLogin? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUser_login": updateUserLogin.flatMap { $0.snapshot }])
    }

    public var updateUserLogin: UpdateUserLogin? {
      get {
        return (snapshot["updateUser_login"] as? Snapshot).flatMap { UpdateUserLogin(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUser_login")
      }
    }

    public struct UpdateUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class DeleteVideoMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteVideo($video_uuid: String!) {\n  deleteVideo(video_uuid: $video_uuid) {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public var video_uuid: String

  public init(video_uuid: String) {
    self.video_uuid = video_uuid
  }

  public var variables: GraphQLMap? {
    return ["video_uuid": video_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteVideo", arguments: ["video_uuid": GraphQLVariable("video_uuid")], type: .object(DeleteVideo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteVideo: DeleteVideo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteVideo": deleteVideo.flatMap { $0.snapshot }])
    }

    public var deleteVideo: DeleteVideo? {
      get {
        return (snapshot["deleteVideo"] as? Snapshot).flatMap { DeleteVideo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteVideo")
      }
    }

    public struct DeleteVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class CreateVideoMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateVideo($createVideoInput: CreateVideoInput!) {\n  createVideo(createVideoInput: $createVideoInput) {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public var createVideoInput: CreateVideoInput

  public init(createVideoInput: CreateVideoInput) {
    self.createVideoInput = createVideoInput
  }

  public var variables: GraphQLMap? {
    return ["createVideoInput": createVideoInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createVideo", arguments: ["createVideoInput": GraphQLVariable("createVideoInput")], type: .object(CreateVideo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createVideo: CreateVideo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createVideo": createVideo.flatMap { $0.snapshot }])
    }

    public var createVideo: CreateVideo? {
      get {
        return (snapshot["createVideo"] as? Snapshot).flatMap { CreateVideo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createVideo")
      }
    }

    public struct CreateVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class UpdateVideoMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateVideo($updateVideoInput: UpdateVideoInput!) {\n  updateVideo(updateVideoInput: $updateVideoInput) {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public var updateVideoInput: UpdateVideoInput

  public init(updateVideoInput: UpdateVideoInput) {
    self.updateVideoInput = updateVideoInput
  }

  public var variables: GraphQLMap? {
    return ["updateVideoInput": updateVideoInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateVideo", arguments: ["updateVideoInput": GraphQLVariable("updateVideoInput")], type: .object(UpdateVideo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateVideo: UpdateVideo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateVideo": updateVideo.flatMap { $0.snapshot }])
    }

    public var updateVideo: UpdateVideo? {
      get {
        return (snapshot["updateVideo"] as? Snapshot).flatMap { UpdateVideo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateVideo")
      }
    }

    public struct UpdateVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class DeleteCommentMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteComment($comment_uuid: String!) {\n  deleteComment(comment_uuid: $comment_uuid) {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public var comment_uuid: String

  public init(comment_uuid: String) {
    self.comment_uuid = comment_uuid
  }

  public var variables: GraphQLMap? {
    return ["comment_uuid": comment_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteComment", arguments: ["comment_uuid": GraphQLVariable("comment_uuid")], type: .object(DeleteComment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteComment: DeleteComment? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteComment": deleteComment.flatMap { $0.snapshot }])
    }

    public var deleteComment: DeleteComment? {
      get {
        return (snapshot["deleteComment"] as? Snapshot).flatMap { DeleteComment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteComment")
      }
    }

    public struct DeleteComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class CreateCommentMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateComment($createCommentInput: CreateCommentInput!) {\n  createComment(createCommentInput: $createCommentInput) {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public var createCommentInput: CreateCommentInput

  public init(createCommentInput: CreateCommentInput) {
    self.createCommentInput = createCommentInput
  }

  public var variables: GraphQLMap? {
    return ["createCommentInput": createCommentInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createComment", arguments: ["createCommentInput": GraphQLVariable("createCommentInput")], type: .object(CreateComment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createComment: CreateComment? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createComment": createComment.flatMap { $0.snapshot }])
    }

    public var createComment: CreateComment? {
      get {
        return (snapshot["createComment"] as? Snapshot).flatMap { CreateComment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createComment")
      }
    }

    public struct CreateComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class UpdateCommentMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateComment($updateCommentInput: UpdateCommentInput!) {\n  updateComment(updateCommentInput: $updateCommentInput) {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public var updateCommentInput: UpdateCommentInput

  public init(updateCommentInput: UpdateCommentInput) {
    self.updateCommentInput = updateCommentInput
  }

  public var variables: GraphQLMap? {
    return ["updateCommentInput": updateCommentInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateComment", arguments: ["updateCommentInput": GraphQLVariable("updateCommentInput")], type: .object(UpdateComment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateComment: UpdateComment? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateComment": updateComment.flatMap { $0.snapshot }])
    }

    public var updateComment: UpdateComment? {
      get {
        return (snapshot["updateComment"] as? Snapshot).flatMap { UpdateComment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateComment")
      }
    }

    public struct UpdateComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class GetVideoLikeQuery: GraphQLQuery {
  public static let operationString =
    "query GetVideo_like($video_like_uuid: String!) {\n  getVideo_like(video_like_uuid: $video_like_uuid) {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public var video_like_uuid: String

  public init(video_like_uuid: String) {
    self.video_like_uuid = video_like_uuid
  }

  public var variables: GraphQLMap? {
    return ["video_like_uuid": video_like_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getVideo_like", arguments: ["video_like_uuid": GraphQLVariable("video_like_uuid")], type: .object(GetVideoLike.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getVideoLike: GetVideoLike? = nil) {
      self.init(snapshot: ["__typename": "Query", "getVideo_like": getVideoLike.flatMap { $0.snapshot }])
    }

    public var getVideoLike: GetVideoLike? {
      get {
        return (snapshot["getVideo_like"] as? Snapshot).flatMap { GetVideoLike(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getVideo_like")
      }
    }

    public struct GetVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class ListVideoLikebyVideoAndUserQuery: GraphQLQuery {
  public static let operationString =
    "query ListVideo_likebyVideoAndUser($user_uuid: String!, $video_uuid: String!) {\n  listVideo_likebyVideoAndUser(user_uuid: $user_uuid, video_uuid: $video_uuid) {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public var user_uuid: String
  public var video_uuid: String

  public init(user_uuid: String, video_uuid: String) {
    self.user_uuid = user_uuid
    self.video_uuid = video_uuid
  }

  public var variables: GraphQLMap? {
    return ["user_uuid": user_uuid, "video_uuid": video_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listVideo_likebyVideoAndUser", arguments: ["user_uuid": GraphQLVariable("user_uuid"), "video_uuid": GraphQLVariable("video_uuid")], type: .list(.object(ListVideoLikebyVideoAndUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listVideoLikebyVideoAndUser: [ListVideoLikebyVideoAndUser?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listVideo_likebyVideoAndUser": listVideoLikebyVideoAndUser.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listVideoLikebyVideoAndUser: [ListVideoLikebyVideoAndUser?]? {
      get {
        return (snapshot["listVideo_likebyVideoAndUser"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListVideoLikebyVideoAndUser(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listVideo_likebyVideoAndUser")
      }
    }

    public struct ListVideoLikebyVideoAndUser: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class ListVideoLikesQuery: GraphQLQuery {
  public static let operationString =
    "query ListVideo_likes {\n  listVideo_likes {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listVideo_likes", type: .list(.object(ListVideoLike.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listVideoLikes: [ListVideoLike?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listVideo_likes": listVideoLikes.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listVideoLikes: [ListVideoLike?]? {
      get {
        return (snapshot["listVideo_likes"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListVideoLike(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listVideo_likes")
      }
    }

    public struct ListVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class GetTemporaryTestQuery: GraphQLQuery {
  public static let operationString =
    "query GetTemporary_test($TestID: Int!) {\n  getTemporary_test(TestID: $TestID) {\n    __typename\n    TestID\n    Testfield\n  }\n}"

  public var TestID: Int

  public init(TestID: Int) {
    self.TestID = TestID
  }

  public var variables: GraphQLMap? {
    return ["TestID": TestID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getTemporary_test", arguments: ["TestID": GraphQLVariable("TestID")], type: .object(GetTemporaryTest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getTemporaryTest: GetTemporaryTest? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTemporary_test": getTemporaryTest.flatMap { $0.snapshot }])
    }

    public var getTemporaryTest: GetTemporaryTest? {
      get {
        return (snapshot["getTemporary_test"] as? Snapshot).flatMap { GetTemporaryTest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTemporary_test")
      }
    }

    public struct GetTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_test"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
        GraphQLField("Testfield", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(testId: Int, testfield: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var testId: Int {
        get {
          return snapshot["TestID"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "TestID")
        }
      }

      public var testfield: String? {
        get {
          return snapshot["Testfield"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Testfield")
        }
      }
    }
  }
}

public final class ListTemporaryTestsQuery: GraphQLQuery {
  public static let operationString =
    "query ListTemporary_tests($limit: Int, $nextToken: String) {\n  listTemporary_tests(limit: $limit, nextToken: $nextToken) {\n    __typename\n    Temporary_tests {\n      __typename\n      TestID\n      Testfield\n    }\n    nextToken\n  }\n}"

  public var limit: Int?
  public var nextToken: String?

  public init(limit: Int? = nil, nextToken: String? = nil) {
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listTemporary_tests", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .list(.object(ListTemporaryTest.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listTemporaryTests: [ListTemporaryTest?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTemporary_tests": listTemporaryTests.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listTemporaryTests: [ListTemporaryTest?]? {
      get {
        return (snapshot["listTemporary_tests"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListTemporaryTest(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listTemporary_tests")
      }
    }

    public struct ListTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_testConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Temporary_tests", type: .list(.object(TemporaryTest.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(temporaryTests: [TemporaryTest?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_testConnection", "Temporary_tests": temporaryTests.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var temporaryTests: [TemporaryTest?]? {
        get {
          return (snapshot["Temporary_tests"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { TemporaryTest(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Temporary_tests")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct TemporaryTest: GraphQLSelectionSet {
        public static let possibleTypes = ["Temporary_test"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
          GraphQLField("Testfield", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(testId: Int, testfield: String? = nil) {
          self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var testId: Int {
          get {
            return snapshot["TestID"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "TestID")
          }
        }

        public var testfield: String? {
          get {
            return snapshot["Testfield"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Testfield")
          }
        }
      }
    }
  }
}

public final class GetBlResultQuery: GraphQLQuery {
  public static let operationString =
    "query GetBl_result($bl_result_uuid: String!) {\n  getBl_result(bl_result_uuid: $bl_result_uuid) {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var bl_result_uuid: String

  public init(bl_result_uuid: String) {
    self.bl_result_uuid = bl_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["bl_result_uuid": bl_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getBl_result", arguments: ["bl_result_uuid": GraphQLVariable("bl_result_uuid")], type: .object(GetBlResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getBlResult: GetBlResult? = nil) {
      self.init(snapshot: ["__typename": "Query", "getBl_result": getBlResult.flatMap { $0.snapshot }])
    }

    public var getBlResult: GetBlResult? {
      get {
        return (snapshot["getBl_result"] as? Snapshot).flatMap { GetBlResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getBl_result")
      }
    }

    public struct GetBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class ListBlResultsQuery: GraphQLQuery {
  public static let operationString =
    "query ListBl_results {\n  listBl_results {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listBl_results", type: .list(.object(ListBlResult.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listBlResults: [ListBlResult?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listBl_results": listBlResults.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listBlResults: [ListBlResult?]? {
      get {
        return (snapshot["listBl_results"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListBlResult(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listBl_results")
      }
    }

    public struct ListBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class GetBlResultDetailQuery: GraphQLQuery {
  public static let operationString =
    "query GetBl_result_detail($bl_result_detail_uuid: String!) {\n  getBl_result_detail(bl_result_detail_uuid: $bl_result_detail_uuid) {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public var bl_result_detail_uuid: String

  public init(bl_result_detail_uuid: String) {
    self.bl_result_detail_uuid = bl_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["bl_result_detail_uuid": bl_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getBl_result_detail", arguments: ["bl_result_detail_uuid": GraphQLVariable("bl_result_detail_uuid")], type: .object(GetBlResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getBlResultDetail: GetBlResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Query", "getBl_result_detail": getBlResultDetail.flatMap { $0.snapshot }])
    }

    public var getBlResultDetail: GetBlResultDetail? {
      get {
        return (snapshot["getBl_result_detail"] as? Snapshot).flatMap { GetBlResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getBl_result_detail")
      }
    }

    public struct GetBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class ListBlResultDetailsQuery: GraphQLQuery {
  public static let operationString =
    "query ListBl_result_details {\n  listBl_result_details {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listBl_result_details", type: .list(.object(ListBlResultDetail.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listBlResultDetails: [ListBlResultDetail?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listBl_result_details": listBlResultDetails.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listBlResultDetails: [ListBlResultDetail?]? {
      get {
        return (snapshot["listBl_result_details"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListBlResultDetail(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listBl_result_details")
      }
    }

    public struct ListBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class GetCatalogQuery: GraphQLQuery {
  public static let operationString =
    "query GetCatalog($item_uuid: String!) {\n  getCatalog(item_uuid: $item_uuid) {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public var item_uuid: String

  public init(item_uuid: String) {
    self.item_uuid = item_uuid
  }

  public var variables: GraphQLMap? {
    return ["item_uuid": item_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getCatalog", arguments: ["item_uuid": GraphQLVariable("item_uuid")], type: .object(GetCatalog.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getCatalog: GetCatalog? = nil) {
      self.init(snapshot: ["__typename": "Query", "getCatalog": getCatalog.flatMap { $0.snapshot }])
    }

    public var getCatalog: GetCatalog? {
      get {
        return (snapshot["getCatalog"] as? Snapshot).flatMap { GetCatalog(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getCatalog")
      }
    }

    public struct GetCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class ListCatalogsQuery: GraphQLQuery {
  public static let operationString =
    "query ListCatalogs {\n  listCatalogs {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCatalogs", type: .list(.object(ListCatalog.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCatalogs: [ListCatalog?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCatalogs": listCatalogs.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listCatalogs: [ListCatalog?]? {
      get {
        return (snapshot["listCatalogs"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListCatalog(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listCatalogs")
      }
    }

    public struct ListCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class GetCreditUsageQuery: GraphQLQuery {
  public static let operationString =
    "query GetCredit_usage($credit_usage_uuid: String!) {\n  getCredit_usage(credit_usage_uuid: $credit_usage_uuid) {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public var credit_usage_uuid: String

  public init(credit_usage_uuid: String) {
    self.credit_usage_uuid = credit_usage_uuid
  }

  public var variables: GraphQLMap? {
    return ["credit_usage_uuid": credit_usage_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getCredit_usage", arguments: ["credit_usage_uuid": GraphQLVariable("credit_usage_uuid")], type: .object(GetCreditUsage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getCreditUsage: GetCreditUsage? = nil) {
      self.init(snapshot: ["__typename": "Query", "getCredit_usage": getCreditUsage.flatMap { $0.snapshot }])
    }

    public var getCreditUsage: GetCreditUsage? {
      get {
        return (snapshot["getCredit_usage"] as? Snapshot).flatMap { GetCreditUsage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getCredit_usage")
      }
    }

    public struct GetCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class ListCreditUsagesQuery: GraphQLQuery {
  public static let operationString =
    "query ListCredit_usages {\n  listCredit_usages {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCredit_usages", type: .list(.object(ListCreditUsage.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCreditUsages: [ListCreditUsage?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCredit_usages": listCreditUsages.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listCreditUsages: [ListCreditUsage?]? {
      get {
        return (snapshot["listCredit_usages"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListCreditUsage(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listCredit_usages")
      }
    }

    public struct ListCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class GetFwResultQuery: GraphQLQuery {
  public static let operationString =
    "query GetFw_result($fw_result_uuid: String!) {\n  getFw_result(fw_result_uuid: $fw_result_uuid) {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var fw_result_uuid: String

  public init(fw_result_uuid: String) {
    self.fw_result_uuid = fw_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["fw_result_uuid": fw_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getFw_result", arguments: ["fw_result_uuid": GraphQLVariable("fw_result_uuid")], type: .object(GetFwResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getFwResult: GetFwResult? = nil) {
      self.init(snapshot: ["__typename": "Query", "getFw_result": getFwResult.flatMap { $0.snapshot }])
    }

    public var getFwResult: GetFwResult? {
      get {
        return (snapshot["getFw_result"] as? Snapshot).flatMap { GetFwResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getFw_result")
      }
    }

    public struct GetFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class ListFwResultsQuery: GraphQLQuery {
  public static let operationString =
    "query ListFw_results {\n  listFw_results {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listFw_results", type: .list(.object(ListFwResult.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listFwResults: [ListFwResult?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listFw_results": listFwResults.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listFwResults: [ListFwResult?]? {
      get {
        return (snapshot["listFw_results"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListFwResult(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listFw_results")
      }
    }

    public struct ListFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class GetFwResultDetailQuery: GraphQLQuery {
  public static let operationString =
    "query GetFw_result_detail($fw_result_detail_uuid: String!) {\n  getFw_result_detail(fw_result_detail_uuid: $fw_result_detail_uuid) {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public var fw_result_detail_uuid: String

  public init(fw_result_detail_uuid: String) {
    self.fw_result_detail_uuid = fw_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["fw_result_detail_uuid": fw_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getFw_result_detail", arguments: ["fw_result_detail_uuid": GraphQLVariable("fw_result_detail_uuid")], type: .object(GetFwResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getFwResultDetail: GetFwResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Query", "getFw_result_detail": getFwResultDetail.flatMap { $0.snapshot }])
    }

    public var getFwResultDetail: GetFwResultDetail? {
      get {
        return (snapshot["getFw_result_detail"] as? Snapshot).flatMap { GetFwResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getFw_result_detail")
      }
    }

    public struct GetFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class ListFwResultDetailsQuery: GraphQLQuery {
  public static let operationString =
    "query ListFw_result_details {\n  listFw_result_details {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listFw_result_details", type: .list(.object(ListFwResultDetail.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listFwResultDetails: [ListFwResultDetail?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listFw_result_details": listFwResultDetails.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listFwResultDetails: [ListFwResultDetail?]? {
      get {
        return (snapshot["listFw_result_details"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListFwResultDetail(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listFw_result_details")
      }
    }

    public struct ListFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class GetNewsQuery: GraphQLQuery {
  public static let operationString =
    "query GetNews($news_uuid: String!) {\n  getNews(news_uuid: $news_uuid) {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public var news_uuid: String

  public init(news_uuid: String) {
    self.news_uuid = news_uuid
  }

  public var variables: GraphQLMap? {
    return ["news_uuid": news_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getNews", arguments: ["news_uuid": GraphQLVariable("news_uuid")], type: .object(GetNews.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getNews: GetNews? = nil) {
      self.init(snapshot: ["__typename": "Query", "getNews": getNews.flatMap { $0.snapshot }])
    }

    public var getNews: GetNews? {
      get {
        return (snapshot["getNews"] as? Snapshot).flatMap { GetNews(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getNews")
      }
    }

    public struct GetNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class ListNewsQuery: GraphQLQuery {
  public static let operationString =
    "query ListNews {\n  listNews {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listNews", type: .list(.object(ListNews.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listNews: [ListNews?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listNews": listNews.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listNews: [ListNews?]? {
      get {
        return (snapshot["listNews"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListNews(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listNews")
      }
    }

    public struct ListNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class GetScoreWeightQuery: GraphQLQuery {
  public static let operationString =
    "query GetScore_weight($weight_uuid: Int!) {\n  getScore_weight(weight_uuid: $weight_uuid) {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public var weight_uuid: Int

  public init(weight_uuid: Int) {
    self.weight_uuid = weight_uuid
  }

  public var variables: GraphQLMap? {
    return ["weight_uuid": weight_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getScore_weight", arguments: ["weight_uuid": GraphQLVariable("weight_uuid")], type: .object(GetScoreWeight.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getScoreWeight: GetScoreWeight? = nil) {
      self.init(snapshot: ["__typename": "Query", "getScore_weight": getScoreWeight.flatMap { $0.snapshot }])
    }

    public var getScoreWeight: GetScoreWeight? {
      get {
        return (snapshot["getScore_weight"] as? Snapshot).flatMap { GetScoreWeight(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getScore_weight")
      }
    }

    public struct GetScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class ListScoreWeightsQuery: GraphQLQuery {
  public static let operationString =
    "query ListScore_weights {\n  listScore_weights {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listScore_weights", type: .list(.object(ListScoreWeight.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listScoreWeights: [ListScoreWeight?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listScore_weights": listScoreWeights.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listScoreWeights: [ListScoreWeight?]? {
      get {
        return (snapshot["listScore_weights"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListScoreWeight(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listScore_weights")
      }
    }

    public struct ListScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class GetSpeedResultQuery: GraphQLQuery {
  public static let operationString =
    "query GetSpeed_result($speed_result_uuid: String!) {\n  getSpeed_result(speed_result_uuid: $speed_result_uuid) {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var speed_result_uuid: String

  public init(speed_result_uuid: String) {
    self.speed_result_uuid = speed_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["speed_result_uuid": speed_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getSpeed_result", arguments: ["speed_result_uuid": GraphQLVariable("speed_result_uuid")], type: .object(GetSpeedResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getSpeedResult: GetSpeedResult? = nil) {
      self.init(snapshot: ["__typename": "Query", "getSpeed_result": getSpeedResult.flatMap { $0.snapshot }])
    }

    public var getSpeedResult: GetSpeedResult? {
      get {
        return (snapshot["getSpeed_result"] as? Snapshot).flatMap { GetSpeedResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getSpeed_result")
      }
    }

    public struct GetSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class ListSpeedResultsQuery: GraphQLQuery {
  public static let operationString =
    "query ListSpeed_results {\n  listSpeed_results {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listSpeed_results", type: .list(.object(ListSpeedResult.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listSpeedResults: [ListSpeedResult?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listSpeed_results": listSpeedResults.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listSpeedResults: [ListSpeedResult?]? {
      get {
        return (snapshot["listSpeed_results"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListSpeedResult(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listSpeed_results")
      }
    }

    public struct ListSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class GetTonalityResultQuery: GraphQLQuery {
  public static let operationString =
    "query GetTonality_result($tonality_result_uuid: String!) {\n  getTonality_result(tonality_result_uuid: $tonality_result_uuid) {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public var tonality_result_uuid: String

  public init(tonality_result_uuid: String) {
    self.tonality_result_uuid = tonality_result_uuid
  }

  public var variables: GraphQLMap? {
    return ["tonality_result_uuid": tonality_result_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getTonality_result", arguments: ["tonality_result_uuid": GraphQLVariable("tonality_result_uuid")], type: .object(GetTonalityResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getTonalityResult: GetTonalityResult? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTonality_result": getTonalityResult.flatMap { $0.snapshot }])
    }

    public var getTonalityResult: GetTonalityResult? {
      get {
        return (snapshot["getTonality_result"] as? Snapshot).flatMap { GetTonalityResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTonality_result")
      }
    }

    public struct GetTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class ListTonalityResultsQuery: GraphQLQuery {
  public static let operationString =
    "query ListTonality_results {\n  listTonality_results {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listTonality_results", type: .list(.object(ListTonalityResult.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listTonalityResults: [ListTonalityResult?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTonality_results": listTonalityResults.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listTonalityResults: [ListTonalityResult?]? {
      get {
        return (snapshot["listTonality_results"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListTonalityResult(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listTonality_results")
      }
    }

    public struct ListTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class GetTonalityResultDetailQuery: GraphQLQuery {
  public static let operationString =
    "query GetTonality_result_detail($tonality_result_detail_uuid: String!) {\n  getTonality_result_detail(tonality_result_detail_uuid: $tonality_result_detail_uuid) {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public var tonality_result_detail_uuid: String

  public init(tonality_result_detail_uuid: String) {
    self.tonality_result_detail_uuid = tonality_result_detail_uuid
  }

  public var variables: GraphQLMap? {
    return ["tonality_result_detail_uuid": tonality_result_detail_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getTonality_result_detail", arguments: ["tonality_result_detail_uuid": GraphQLVariable("tonality_result_detail_uuid")], type: .object(GetTonalityResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getTonalityResultDetail: GetTonalityResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTonality_result_detail": getTonalityResultDetail.flatMap { $0.snapshot }])
    }

    public var getTonalityResultDetail: GetTonalityResultDetail? {
      get {
        return (snapshot["getTonality_result_detail"] as? Snapshot).flatMap { GetTonalityResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTonality_result_detail")
      }
    }

    public struct GetTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class ListTonalityResultDetailsQuery: GraphQLQuery {
  public static let operationString =
    "query ListTonality_result_details {\n  listTonality_result_details {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listTonality_result_details", type: .list(.object(ListTonalityResultDetail.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listTonalityResultDetails: [ListTonalityResultDetail?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTonality_result_details": listTonalityResultDetails.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listTonalityResultDetails: [ListTonalityResultDetail?]? {
      get {
        return (snapshot["listTonality_result_details"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListTonalityResultDetail(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listTonality_result_details")
      }
    }

    public struct ListTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class GetTransactionQuery: GraphQLQuery {
  public static let operationString =
    "query GetTransaction($transaction_uuid: String!) {\n  getTransaction(transaction_uuid: $transaction_uuid) {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public var transaction_uuid: String

  public init(transaction_uuid: String) {
    self.transaction_uuid = transaction_uuid
  }

  public var variables: GraphQLMap? {
    return ["transaction_uuid": transaction_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getTransaction", arguments: ["transaction_uuid": GraphQLVariable("transaction_uuid")], type: .object(GetTransaction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getTransaction: GetTransaction? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTransaction": getTransaction.flatMap { $0.snapshot }])
    }

    public var getTransaction: GetTransaction? {
      get {
        return (snapshot["getTransaction"] as? Snapshot).flatMap { GetTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTransaction")
      }
    }

    public struct GetTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class ListTransactionsQuery: GraphQLQuery {
  public static let operationString =
    "query ListTransactions {\n  listTransactions {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listTransactions", type: .list(.object(ListTransaction.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listTransactions: [ListTransaction?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTransactions": listTransactions.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listTransactions: [ListTransaction?]? {
      get {
        return (snapshot["listTransactions"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListTransaction(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listTransactions")
      }
    }

    public struct ListTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($user_uuid: String!) {\n  getUser(user_uuid: $user_uuid) {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public var user_uuid: String

  public init(user_uuid: String) {
    self.user_uuid = user_uuid
  }

  public var variables: GraphQLMap? {
    return ["user_uuid": user_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser", arguments: ["user_uuid": GraphQLVariable("user_uuid")], type: .object(GetUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUser: GetUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUser": getUser.flatMap { $0.snapshot }])
    }

    public var getUser: GetUser? {
      get {
        return (snapshot["getUser"] as? Snapshot).flatMap { GetUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUser")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class ListUsersQuery: GraphQLQuery {
  public static let operationString =
    "query ListUsers {\n  listUsers {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUsers", type: .list(.object(ListUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUsers: [ListUser?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUsers": listUsers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listUsers: [ListUser?]? {
      get {
        return (snapshot["listUsers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListUser(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listUsers")
      }
    }

    public struct ListUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class GetUserLoginQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser_login($logon_uuid: String!) {\n  getUser_login(logon_uuid: $logon_uuid) {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public var logon_uuid: String

  public init(logon_uuid: String) {
    self.logon_uuid = logon_uuid
  }

  public var variables: GraphQLMap? {
    return ["logon_uuid": logon_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser_login", arguments: ["logon_uuid": GraphQLVariable("logon_uuid")], type: .object(GetUserLogin.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserLogin: GetUserLogin? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUser_login": getUserLogin.flatMap { $0.snapshot }])
    }

    public var getUserLogin: GetUserLogin? {
      get {
        return (snapshot["getUser_login"] as? Snapshot).flatMap { GetUserLogin(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUser_login")
      }
    }

    public struct GetUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class ListUserLoginsQuery: GraphQLQuery {
  public static let operationString =
    "query ListUser_logins {\n  listUser_logins {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUser_logins", type: .list(.object(ListUserLogin.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUserLogins: [ListUserLogin?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUser_logins": listUserLogins.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listUserLogins: [ListUserLogin?]? {
      get {
        return (snapshot["listUser_logins"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListUserLogin(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listUser_logins")
      }
    }

    public struct ListUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class GetVideoQuery: GraphQLQuery {
  public static let operationString =
    "query GetVideo($video_uuid: String!) {\n  getVideo(video_uuid: $video_uuid) {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public var video_uuid: String

  public init(video_uuid: String) {
    self.video_uuid = video_uuid
  }

  public var variables: GraphQLMap? {
    return ["video_uuid": video_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getVideo", arguments: ["video_uuid": GraphQLVariable("video_uuid")], type: .object(GetVideo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getVideo: GetVideo? = nil) {
      self.init(snapshot: ["__typename": "Query", "getVideo": getVideo.flatMap { $0.snapshot }])
    }

    public var getVideo: GetVideo? {
      get {
        return (snapshot["getVideo"] as? Snapshot).flatMap { GetVideo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getVideo")
      }
    }

    public struct GetVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class ListVideosQuery: GraphQLQuery {
  public static let operationString =
    "query ListVideos {\n  listVideos {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listVideos", type: .list(.object(ListVideo.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listVideos: [ListVideo?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listVideos": listVideos.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listVideos: [ListVideo?]? {
      get {
        return (snapshot["listVideos"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListVideo(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listVideos")
      }
    }

    public struct ListVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class ListVideobyUserQuery: GraphQLQuery {
  public static let operationString =
    "query ListVideobyUser($user_uuid: String!) {\n  listVideobyUser(user_uuid: $user_uuid) {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public var user_uuid: String

  public init(user_uuid: String) {
    self.user_uuid = user_uuid
  }

  public var variables: GraphQLMap? {
    return ["user_uuid": user_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listVideobyUser", arguments: ["user_uuid": GraphQLVariable("user_uuid")], type: .list(.object(ListVideobyUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listVideobyUser: [ListVideobyUser?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listVideobyUser": listVideobyUser.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listVideobyUser: [ListVideobyUser?]? {
      get {
        return (snapshot["listVideobyUser"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListVideobyUser(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listVideobyUser")
      }
    }

    public struct ListVideobyUser: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class ListShareableVideoQuery: GraphQLQuery {
  public static let operationString =
    "query ListShareableVideo {\n  listShareableVideo {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listShareableVideo", type: .list(.object(ListShareableVideo.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listShareableVideo: [ListShareableVideo?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listShareableVideo": listShareableVideo.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listShareableVideo: [ListShareableVideo?]? {
      get {
        return (snapshot["listShareableVideo"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListShareableVideo(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listShareableVideo")
      }
    }

    public struct ListShareableVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class GetCommentQuery: GraphQLQuery {
  public static let operationString =
    "query GetComment($comment_uuid: String!) {\n  getComment(comment_uuid: $comment_uuid) {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public var comment_uuid: String

  public init(comment_uuid: String) {
    self.comment_uuid = comment_uuid
  }

  public var variables: GraphQLMap? {
    return ["comment_uuid": comment_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getComment", arguments: ["comment_uuid": GraphQLVariable("comment_uuid")], type: .object(GetComment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getComment: GetComment? = nil) {
      self.init(snapshot: ["__typename": "Query", "getComment": getComment.flatMap { $0.snapshot }])
    }

    public var getComment: GetComment? {
      get {
        return (snapshot["getComment"] as? Snapshot).flatMap { GetComment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getComment")
      }
    }

    public struct GetComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class ListCommentbyVideoQuery: GraphQLQuery {
  public static let operationString =
    "query ListCommentbyVideo($video_uuid: String!) {\n  listCommentbyVideo(video_uuid: $video_uuid) {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public var video_uuid: String

  public init(video_uuid: String) {
    self.video_uuid = video_uuid
  }

  public var variables: GraphQLMap? {
    return ["video_uuid": video_uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCommentbyVideo", arguments: ["video_uuid": GraphQLVariable("video_uuid")], type: .list(.object(ListCommentbyVideo.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCommentbyVideo: [ListCommentbyVideo?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCommentbyVideo": listCommentbyVideo.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listCommentbyVideo: [ListCommentbyVideo?]? {
      get {
        return (snapshot["listCommentbyVideo"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListCommentbyVideo(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listCommentbyVideo")
      }
    }

    public struct ListCommentbyVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class ListCommentsQuery: GraphQLQuery {
  public static let operationString =
    "query ListComments {\n  listComments {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listComments", type: .list(.object(ListComment.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listComments: [ListComment?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "listComments": listComments.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var listComments: [ListComment?]? {
      get {
        return (snapshot["listComments"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ListComment(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "listComments")
      }
    }

    public struct ListComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}

public final class OnCreateVideoLikeSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateVideo_like {\n  onCreateVideo_like {\n    __typename\n    video_like_uuid\n    user_uuid\n    video_uuid\n    created_datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateVideo_like", type: .object(OnCreateVideoLike.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateVideoLike: OnCreateVideoLike? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateVideo_like": onCreateVideoLike.flatMap { $0.snapshot }])
    }

    public var onCreateVideoLike: OnCreateVideoLike? {
      get {
        return (snapshot["onCreateVideo_like"] as? Snapshot).flatMap { OnCreateVideoLike(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateVideo_like")
      }
    }

    public struct OnCreateVideoLike: GraphQLSelectionSet {
      public static let possibleTypes = ["video_like"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_like_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("created_datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoLikeUuid: String, userUuid: String, videoUuid: String? = nil, createdDatetime: String? = nil) {
        self.init(snapshot: ["__typename": "video_like", "video_like_uuid": videoLikeUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "created_datetime": createdDatetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoLikeUuid: String {
        get {
          return snapshot["video_like_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_like_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var createdDatetime: String? {
        get {
          return snapshot["created_datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_datetime")
        }
      }
    }
  }
}

public final class OnCreateTemporaryTestSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateTemporary_test {\n  onCreateTemporary_test {\n    __typename\n    TestID\n    Testfield\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateTemporary_test", type: .object(OnCreateTemporaryTest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateTemporaryTest: OnCreateTemporaryTest? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateTemporary_test": onCreateTemporaryTest.flatMap { $0.snapshot }])
    }

    public var onCreateTemporaryTest: OnCreateTemporaryTest? {
      get {
        return (snapshot["onCreateTemporary_test"] as? Snapshot).flatMap { OnCreateTemporaryTest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateTemporary_test")
      }
    }

    public struct OnCreateTemporaryTest: GraphQLSelectionSet {
      public static let possibleTypes = ["Temporary_test"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("TestID", type: .nonNull(.scalar(Int.self))),
        GraphQLField("Testfield", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(testId: Int, testfield: String? = nil) {
        self.init(snapshot: ["__typename": "Temporary_test", "TestID": testId, "Testfield": testfield])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var testId: Int {
        get {
          return snapshot["TestID"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "TestID")
        }
      }

      public var testfield: String? {
        get {
          return snapshot["Testfield"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Testfield")
        }
      }
    }
  }
}

public final class OnCreateBlResultSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateBl_result {\n  onCreateBl_result {\n    __typename\n    bl_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateBl_result", type: .object(OnCreateBlResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateBlResult: OnCreateBlResult? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateBl_result": onCreateBlResult.flatMap { $0.snapshot }])
    }

    public var onCreateBlResult: OnCreateBlResult? {
      get {
        return (snapshot["onCreateBl_result"] as? Snapshot).flatMap { OnCreateBlResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateBl_result")
      }
    }

    public struct OnCreateBlResult: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result", "bl_result_uuid": blResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultUuid: String {
        get {
          return snapshot["bl_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class OnCreateBlResultDetailSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateBl_result_detail {\n  onCreateBl_result_detail {\n    __typename\n    bl_result_detail_uuid\n    frame_no\n    frame_time\n    frame_predict_result\n    bl_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateBl_result_detail", type: .object(OnCreateBlResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateBlResultDetail: OnCreateBlResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateBl_result_detail": onCreateBlResultDetail.flatMap { $0.snapshot }])
    }

    public var onCreateBlResultDetail: OnCreateBlResultDetail? {
      get {
        return (snapshot["onCreateBl_result_detail"] as? Snapshot).flatMap { OnCreateBlResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateBl_result_detail")
      }
    }

    public struct OnCreateBlResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["bl_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bl_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("frame_no", type: .scalar(Int.self)),
        GraphQLField("frame_time", type: .scalar(String.self)),
        GraphQLField("frame_predict_result", type: .scalar(String.self)),
        GraphQLField("bl_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(blResultDetailUuid: String, frameNo: Int? = nil, frameTime: String? = nil, framePredictResult: String? = nil, blResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "bl_result_detail", "bl_result_detail_uuid": blResultDetailUuid, "frame_no": frameNo, "frame_time": frameTime, "frame_predict_result": framePredictResult, "bl_result_uuid": blResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var blResultDetailUuid: String {
        get {
          return snapshot["bl_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_detail_uuid")
        }
      }

      public var frameNo: Int? {
        get {
          return snapshot["frame_no"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_no")
        }
      }

      public var frameTime: String? {
        get {
          return snapshot["frame_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_time")
        }
      }

      public var framePredictResult: String? {
        get {
          return snapshot["frame_predict_result"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "frame_predict_result")
        }
      }

      public var blResultUuid: String? {
        get {
          return snapshot["bl_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_result_uuid")
        }
      }
    }
  }
}

public final class OnCreateCatalogSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateCatalog {\n  onCreateCatalog {\n    __typename\n    item_uuid\n    amount\n    currency\n    valid_date_from\n    valid_date_to\n    quantity\n    plan_name\n    description\n    vendor\n    enable\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateCatalog", type: .object(OnCreateCatalog.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateCatalog: OnCreateCatalog? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateCatalog": onCreateCatalog.flatMap { $0.snapshot }])
    }

    public var onCreateCatalog: OnCreateCatalog? {
      get {
        return (snapshot["onCreateCatalog"] as? Snapshot).flatMap { OnCreateCatalog(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateCatalog")
      }
    }

    public struct OnCreateCatalog: GraphQLSelectionSet {
      public static let possibleTypes = ["catalog"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("valid_date_from", type: .scalar(String.self)),
        GraphQLField("valid_date_to", type: .scalar(String.self)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("plan_name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("enable", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(itemUuid: String, amount: Double? = nil, currency: String? = nil, validDateFrom: String? = nil, validDateTo: String? = nil, quantity: Int? = nil, planName: String? = nil, description: String? = nil, vendor: String? = nil, enable: Int? = nil) {
        self.init(snapshot: ["__typename": "catalog", "item_uuid": itemUuid, "amount": amount, "currency": currency, "valid_date_from": validDateFrom, "valid_date_to": validDateTo, "quantity": quantity, "plan_name": planName, "description": description, "vendor": vendor, "enable": enable])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }

      public var validDateFrom: String? {
        get {
          return snapshot["valid_date_from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_from")
        }
      }

      public var validDateTo: String? {
        get {
          return snapshot["valid_date_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "valid_date_to")
        }
      }

      public var quantity: Int? {
        get {
          return snapshot["quantity"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "quantity")
        }
      }

      public var planName: String? {
        get {
          return snapshot["plan_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan_name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var enable: Int? {
        get {
          return snapshot["enable"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enable")
        }
      }
    }
  }
}

public final class OnCreateCreditUsageSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateCredit_usage {\n  onCreateCredit_usage {\n    __typename\n    credit_usage_uuid\n    user_uuid\n    video_uuid\n    amount\n    type\n    device_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateCredit_usage", type: .object(OnCreateCreditUsage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateCreditUsage: OnCreateCreditUsage? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateCredit_usage": onCreateCreditUsage.flatMap { $0.snapshot }])
    }

    public var onCreateCreditUsage: OnCreateCreditUsage? {
      get {
        return (snapshot["onCreateCredit_usage"] as? Snapshot).flatMap { OnCreateCreditUsage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateCredit_usage")
      }
    }

    public struct OnCreateCreditUsage: GraphQLSelectionSet {
      public static let possibleTypes = ["credit_usage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .scalar(String.self)),
        GraphQLField("video_uuid", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(creditUsageUuid: String, userUuid: String? = nil, videoUuid: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil) {
        self.init(snapshot: ["__typename": "credit_usage", "credit_usage_uuid": creditUsageUuid, "user_uuid": userUuid, "video_uuid": videoUuid, "amount": amount, "type": type, "device_uuid": deviceUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var userUuid: String? {
        get {
          return snapshot["user_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var videoUuid: String? {
        get {
          return snapshot["video_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }
    }
  }
}

public final class OnCreateFwResultSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateFw_result {\n  onCreateFw_result {\n    __typename\n    fw_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateFw_result", type: .object(OnCreateFwResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateFwResult: OnCreateFwResult? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateFw_result": onCreateFwResult.flatMap { $0.snapshot }])
    }

    public var onCreateFwResult: OnCreateFwResult? {
      get {
        return (snapshot["onCreateFw_result"] as? Snapshot).flatMap { OnCreateFwResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateFw_result")
      }
    }

    public struct OnCreateFwResult: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultUuid: String, creditUsageUuid: String? = nil, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result", "fw_result_uuid": fwResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultUuid: String {
        get {
          return snapshot["fw_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }

      public var creditUsageUuid: String? {
        get {
          return snapshot["credit_usage_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class OnCreateFwResultDetailSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateFw_result_detail {\n  onCreateFw_result_detail {\n    __typename\n    fw_result_detail_uuid\n    filler_word\n    filler_word_count\n    fw_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateFw_result_detail", type: .object(OnCreateFwResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateFwResultDetail: OnCreateFwResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateFw_result_detail": onCreateFwResultDetail.flatMap { $0.snapshot }])
    }

    public var onCreateFwResultDetail: OnCreateFwResultDetail? {
      get {
        return (snapshot["onCreateFw_result_detail"] as? Snapshot).flatMap { OnCreateFwResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateFw_result_detail")
      }
    }

    public struct OnCreateFwResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["fw_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fw_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("filler_word", type: .scalar(String.self)),
        GraphQLField("filler_word_count", type: .scalar(Int.self)),
        GraphQLField("fw_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fwResultDetailUuid: String, fillerWord: String? = nil, fillerWordCount: Int? = nil, fwResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "fw_result_detail", "fw_result_detail_uuid": fwResultDetailUuid, "filler_word": fillerWord, "filler_word_count": fillerWordCount, "fw_result_uuid": fwResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fwResultDetailUuid: String {
        get {
          return snapshot["fw_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_detail_uuid")
        }
      }

      public var fillerWord: String? {
        get {
          return snapshot["filler_word"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word")
        }
      }

      public var fillerWordCount: Int? {
        get {
          return snapshot["filler_word_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "filler_word_count")
        }
      }

      public var fwResultUuid: String? {
        get {
          return snapshot["fw_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_result_uuid")
        }
      }
    }
  }
}

public final class OnCreateNewsSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateNews {\n  onCreateNews {\n    __typename\n    news_uuid\n    start_date\n    end_date\n    enabled\n    name\n    description\n    path\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateNews", type: .object(OnCreateNews.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateNews: OnCreateNews? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateNews": onCreateNews.flatMap { $0.snapshot }])
    }

    public var onCreateNews: OnCreateNews? {
      get {
        return (snapshot["onCreateNews"] as? Snapshot).flatMap { OnCreateNews(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateNews")
      }
    }

    public struct OnCreateNews: GraphQLSelectionSet {
      public static let possibleTypes = ["news"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("news_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("start_date", type: .scalar(String.self)),
        GraphQLField("end_date", type: .scalar(String.self)),
        GraphQLField("enabled", type: .scalar(Int.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(newsUuid: String, startDate: String? = nil, endDate: String? = nil, enabled: Int? = nil, name: String? = nil, description: String? = nil, path: String? = nil) {
        self.init(snapshot: ["__typename": "news", "news_uuid": newsUuid, "start_date": startDate, "end_date": endDate, "enabled": enabled, "name": name, "description": description, "path": path])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var newsUuid: String {
        get {
          return snapshot["news_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "news_uuid")
        }
      }

      public var startDate: String? {
        get {
          return snapshot["start_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "start_date")
        }
      }

      public var endDate: String? {
        get {
          return snapshot["end_date"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "end_date")
        }
      }

      public var enabled: Int? {
        get {
          return snapshot["enabled"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "enabled")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }
    }
  }
}

public final class OnCreateScoreWeightSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateScore_weight {\n  onCreateScore_weight {\n    __typename\n    weight_uuid\n    bl_weight\n    tonality_weight\n    speed_weight\n    fw_weight\n    status\n    timestamp\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateScore_weight", type: .object(OnCreateScoreWeight.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateScoreWeight: OnCreateScoreWeight? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateScore_weight": onCreateScoreWeight.flatMap { $0.snapshot }])
    }

    public var onCreateScoreWeight: OnCreateScoreWeight? {
      get {
        return (snapshot["onCreateScore_weight"] as? Snapshot).flatMap { OnCreateScoreWeight(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateScore_weight")
      }
    }

    public struct OnCreateScoreWeight: GraphQLSelectionSet {
      public static let possibleTypes = ["score_weight"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("weight_uuid", type: .nonNull(.scalar(Int.self))),
        GraphQLField("bl_weight", type: .scalar(Double.self)),
        GraphQLField("tonality_weight", type: .scalar(Double.self)),
        GraphQLField("speed_weight", type: .scalar(Double.self)),
        GraphQLField("fw_weight", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("timestamp", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(weightUuid: Int, blWeight: Double? = nil, tonalityWeight: Double? = nil, speedWeight: Double? = nil, fwWeight: Double? = nil, status: String? = nil, timestamp: String? = nil) {
        self.init(snapshot: ["__typename": "score_weight", "weight_uuid": weightUuid, "bl_weight": blWeight, "tonality_weight": tonalityWeight, "speed_weight": speedWeight, "fw_weight": fwWeight, "status": status, "timestamp": timestamp])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weightUuid: Int {
        get {
          return snapshot["weight_uuid"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "weight_uuid")
        }
      }

      public var blWeight: Double? {
        get {
          return snapshot["bl_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "bl_weight")
        }
      }

      public var tonalityWeight: Double? {
        get {
          return snapshot["tonality_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_weight")
        }
      }

      public var speedWeight: Double? {
        get {
          return snapshot["speed_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_weight")
        }
      }

      public var fwWeight: Double? {
        get {
          return snapshot["fw_weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fw_weight")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var timestamp: String? {
        get {
          return snapshot["timestamp"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "timestamp")
        }
      }
    }
  }
}

public final class OnCreateSpeedResultSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateSpeed_result {\n  onCreateSpeed_result {\n    __typename\n    speed_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateSpeed_result", type: .object(OnCreateSpeedResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateSpeedResult: OnCreateSpeedResult? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateSpeed_result": onCreateSpeedResult.flatMap { $0.snapshot }])
    }

    public var onCreateSpeedResult: OnCreateSpeedResult? {
      get {
        return (snapshot["onCreateSpeed_result"] as? Snapshot).flatMap { OnCreateSpeedResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateSpeed_result")
      }
    }

    public struct OnCreateSpeedResult: GraphQLSelectionSet {
      public static let possibleTypes = ["speed_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("speed_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(speedResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "speed_result", "speed_result_uuid": speedResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var speedResultUuid: String {
        get {
          return snapshot["speed_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "speed_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class OnCreateTonalityResultSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateTonality_result {\n  onCreateTonality_result {\n    __typename\n    tonality_result_uuid\n    credit_usage_uuid\n    status\n    score\n    datetime\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateTonality_result", type: .object(OnCreateTonalityResult.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateTonalityResult: OnCreateTonalityResult? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateTonality_result": onCreateTonalityResult.flatMap { $0.snapshot }])
    }

    public var onCreateTonalityResult: OnCreateTonalityResult? {
      get {
        return (snapshot["onCreateTonality_result"] as? Snapshot).flatMap { OnCreateTonalityResult(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateTonality_result")
      }
    }

    public struct OnCreateTonalityResult: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("credit_usage_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("score", type: .scalar(Double.self)),
        GraphQLField("datetime", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultUuid: String, creditUsageUuid: String, status: String? = nil, score: Double? = nil, datetime: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result", "tonality_result_uuid": tonalityResultUuid, "credit_usage_uuid": creditUsageUuid, "status": status, "score": score, "datetime": datetime])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultUuid: String {
        get {
          return snapshot["tonality_result_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }

      public var creditUsageUuid: String {
        get {
          return snapshot["credit_usage_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "credit_usage_uuid")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var score: Double? {
        get {
          return snapshot["score"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "score")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }
    }
  }
}

public final class OnCreateTonalityResultDetailSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateTonality_result_detail {\n  onCreateTonality_result_detail {\n    __typename\n    tonality_result_detail_uuid\n    tonality_time\n    tonality_db\n    tonality_result_uuid\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateTonality_result_detail", type: .object(OnCreateTonalityResultDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateTonalityResultDetail: OnCreateTonalityResultDetail? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateTonality_result_detail": onCreateTonalityResultDetail.flatMap { $0.snapshot }])
    }

    public var onCreateTonalityResultDetail: OnCreateTonalityResultDetail? {
      get {
        return (snapshot["onCreateTonality_result_detail"] as? Snapshot).flatMap { OnCreateTonalityResultDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateTonality_result_detail")
      }
    }

    public struct OnCreateTonalityResultDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["tonality_result_detail"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_result_detail_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("tonality_time", type: .scalar(Int.self)),
        GraphQLField("tonality_db", type: .scalar(Double.self)),
        GraphQLField("tonality_result_uuid", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(tonalityResultDetailUuid: String, tonalityTime: Int? = nil, tonalityDb: Double? = nil, tonalityResultUuid: String? = nil) {
        self.init(snapshot: ["__typename": "tonality_result_detail", "tonality_result_detail_uuid": tonalityResultDetailUuid, "tonality_time": tonalityTime, "tonality_db": tonalityDb, "tonality_result_uuid": tonalityResultUuid])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var tonalityResultDetailUuid: String {
        get {
          return snapshot["tonality_result_detail_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_detail_uuid")
        }
      }

      public var tonalityTime: Int? {
        get {
          return snapshot["tonality_time"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_time")
        }
      }

      public var tonalityDb: Double? {
        get {
          return snapshot["tonality_db"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_db")
        }
      }

      public var tonalityResultUuid: String? {
        get {
          return snapshot["tonality_result_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tonality_result_uuid")
        }
      }
    }
  }
}

public final class OnCreateTransactionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateTransaction {\n  onCreateTransaction {\n    __typename\n    transaction_uuid\n    item_uuid\n    user_uuid\n    datetime\n    amount\n    type\n    device_uuid\n    vendor\n    vendor_transaction_id\n    currency\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateTransaction", type: .object(OnCreateTransaction.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateTransaction: OnCreateTransaction? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateTransaction": onCreateTransaction.flatMap { $0.snapshot }])
    }

    public var onCreateTransaction: OnCreateTransaction? {
      get {
        return (snapshot["onCreateTransaction"] as? Snapshot).flatMap { OnCreateTransaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateTransaction")
      }
    }

    public struct OnCreateTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transaction_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("item_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Double.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("device_uuid", type: .scalar(String.self)),
        GraphQLField("vendor", type: .scalar(String.self)),
        GraphQLField("vendor_transaction_id", type: .scalar(String.self)),
        GraphQLField("currency", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(transactionUuid: String, itemUuid: String, userUuid: String, datetime: String? = nil, amount: Double? = nil, type: String? = nil, deviceUuid: String? = nil, vendor: String? = nil, vendorTransactionId: String? = nil, currency: String? = nil) {
        self.init(snapshot: ["__typename": "transaction", "transaction_uuid": transactionUuid, "item_uuid": itemUuid, "user_uuid": userUuid, "datetime": datetime, "amount": amount, "type": type, "device_uuid": deviceUuid, "vendor": vendor, "vendor_transaction_id": vendorTransactionId, "currency": currency])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transactionUuid: String {
        get {
          return snapshot["transaction_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "transaction_uuid")
        }
      }

      public var itemUuid: String {
        get {
          return snapshot["item_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "item_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String? {
        get {
          return snapshot["datetime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var amount: Double? {
        get {
          return snapshot["amount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "amount")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var deviceUuid: String? {
        get {
          return snapshot["device_uuid"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "device_uuid")
        }
      }

      public var vendor: String? {
        get {
          return snapshot["vendor"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorTransactionId: String? {
        get {
          return snapshot["vendor_transaction_id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_transaction_id")
        }
      }

      public var currency: String? {
        get {
          return snapshot["currency"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "currency")
        }
      }
    }
  }
}

public final class OnCreateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUser {\n  onCreateUser {\n    __typename\n    user_uuid\n    email\n    first_name\n    last_name\n    username\n    vendor\n    vendor_uuid\n    image_url\n    gender\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUser", type: .object(OnCreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUser: OnCreateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUser": onCreateUser.flatMap { $0.snapshot }])
    }

    public var onCreateUser: OnCreateUser? {
      get {
        return (snapshot["onCreateUser"] as? Snapshot).flatMap { OnCreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUser")
      }
    }

    public struct OnCreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["user"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("first_name", type: .scalar(String.self)),
        GraphQLField("last_name", type: .scalar(String.self)),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
        GraphQLField("vendor_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("image_url", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(userUuid: String, email: String, firstName: String? = nil, lastName: String? = nil, username: String? = nil, vendor: String, vendorUuid: String, imageUrl: String? = nil, gender: String? = nil) {
        self.init(snapshot: ["__typename": "user", "user_uuid": userUuid, "email": email, "first_name": firstName, "last_name": lastName, "username": username, "vendor": vendor, "vendor_uuid": vendorUuid, "image_url": imageUrl, "gender": gender])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var vendor: String {
        get {
          return snapshot["vendor"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor")
        }
      }

      public var vendorUuid: String {
        get {
          return snapshot["vendor_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "vendor_uuid")
        }
      }

      public var imageUrl: String? {
        get {
          return snapshot["image_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image_url")
        }
      }

      public var gender: String? {
        get {
          return snapshot["gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class OnCreateUserLoginSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUser_login {\n  onCreateUser_login {\n    __typename\n    logon_uuid\n    user_uuid\n    login_time\n    oauth_method\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUser_login", type: .object(OnCreateUserLogin.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUserLogin: OnCreateUserLogin? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUser_login": onCreateUserLogin.flatMap { $0.snapshot }])
    }

    public var onCreateUserLogin: OnCreateUserLogin? {
      get {
        return (snapshot["onCreateUser_login"] as? Snapshot).flatMap { OnCreateUserLogin(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUser_login")
      }
    }

    public struct OnCreateUserLogin: GraphQLSelectionSet {
      public static let possibleTypes = ["user_login"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logon_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("login_time", type: .scalar(String.self)),
        GraphQLField("oauth_method", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(logonUuid: String, userUuid: String, loginTime: String? = nil, oauthMethod: String? = nil) {
        self.init(snapshot: ["__typename": "user_login", "logon_uuid": logonUuid, "user_uuid": userUuid, "login_time": loginTime, "oauth_method": oauthMethod])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var logonUuid: String {
        get {
          return snapshot["logon_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "logon_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var loginTime: String? {
        get {
          return snapshot["login_time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login_time")
        }
      }

      public var oauthMethod: String? {
        get {
          return snapshot["oauth_method"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "oauth_method")
        }
      }
    }
  }
}

public final class OnCreateVideoSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateVideo {\n  onCreateVideo {\n    __typename\n    video_uuid\n    user_uuid\n    datetime\n    video_name\n    video_size\n    video_info\n    path\n    share\n    video_duration\n    active\n    upload_status\n    analyse_status\n    likes_count\n    comments_count\n    title\n    longitude\n    latitude\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateVideo", type: .object(OnCreateVideo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateVideo: OnCreateVideo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateVideo": onCreateVideo.flatMap { $0.snapshot }])
    }

    public var onCreateVideo: OnCreateVideo? {
      get {
        return (snapshot["onCreateVideo"] as? Snapshot).flatMap { OnCreateVideo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateVideo")
      }
    }

    public struct OnCreateVideo: GraphQLSelectionSet {
      public static let possibleTypes = ["video"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_name", type: .scalar(String.self)),
        GraphQLField("video_size", type: .scalar(String.self)),
        GraphQLField("video_info", type: .scalar(String.self)),
        GraphQLField("path", type: .scalar(String.self)),
        GraphQLField("share", type: .scalar(Int.self)),
        GraphQLField("video_duration", type: .scalar(Double.self)),
        GraphQLField("active", type: .scalar(Int.self)),
        GraphQLField("upload_status", type: .scalar(String.self)),
        GraphQLField("analyse_status", type: .scalar(String.self)),
        GraphQLField("likes_count", type: .scalar(Int.self)),
        GraphQLField("comments_count", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(videoUuid: String, userUuid: String, datetime: String, videoName: String? = nil, videoSize: String? = nil, videoInfo: String? = nil, path: String? = nil, share: Int? = nil, videoDuration: Double? = nil, active: Int? = nil, uploadStatus: String? = nil, analyseStatus: String? = nil, likesCount: Int? = nil, commentsCount: Int? = nil, title: String? = nil, longitude: String? = nil, latitude: String? = nil) {
        self.init(snapshot: ["__typename": "video", "video_uuid": videoUuid, "user_uuid": userUuid, "datetime": datetime, "video_name": videoName, "video_size": videoSize, "video_info": videoInfo, "path": path, "share": share, "video_duration": videoDuration, "active": active, "upload_status": uploadStatus, "analyse_status": analyseStatus, "likes_count": likesCount, "comments_count": commentsCount, "title": title, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var videoName: String? {
        get {
          return snapshot["video_name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_name")
        }
      }

      public var videoSize: String? {
        get {
          return snapshot["video_size"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_size")
        }
      }

      public var videoInfo: String? {
        get {
          return snapshot["video_info"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_info")
        }
      }

      public var path: String? {
        get {
          return snapshot["path"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "path")
        }
      }

      public var share: Int? {
        get {
          return snapshot["share"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "share")
        }
      }

      public var videoDuration: Double? {
        get {
          return snapshot["video_duration"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_duration")
        }
      }

      public var active: Int? {
        get {
          return snapshot["active"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "active")
        }
      }

      public var uploadStatus: String? {
        get {
          return snapshot["upload_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upload_status")
        }
      }

      public var analyseStatus: String? {
        get {
          return snapshot["analyse_status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "analyse_status")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likes_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likes_count")
        }
      }

      public var commentsCount: Int? {
        get {
          return snapshot["comments_count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "comments_count")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}

public final class OnCreateCommentSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateComment {\n  onCreateComment {\n    __typename\n    comment_uuid\n    video_uuid\n    user_uuid\n    comment\n    created_on\n    replied_to\n    modified_on\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateComment", type: .object(OnCreateComment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateComment: OnCreateComment? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateComment": onCreateComment.flatMap { $0.snapshot }])
    }

    public var onCreateComment: OnCreateComment? {
      get {
        return (snapshot["onCreateComment"] as? Snapshot).flatMap { OnCreateComment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateComment")
      }
    }

    public struct OnCreateComment: GraphQLSelectionSet {
      public static let possibleTypes = ["comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
        GraphQLField("comment", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_on", type: .scalar(String.self)),
        GraphQLField("replied_to", type: .scalar(String.self)),
        GraphQLField("modified_on", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(commentUuid: String, videoUuid: String, userUuid: String, comment: String, createdOn: String? = nil, repliedTo: String? = nil, modifiedOn: String? = nil) {
        self.init(snapshot: ["__typename": "comment", "comment_uuid": commentUuid, "video_uuid": videoUuid, "user_uuid": userUuid, "comment": comment, "created_on": createdOn, "replied_to": repliedTo, "modified_on": modifiedOn])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentUuid: String {
        get {
          return snapshot["comment_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment_uuid")
        }
      }

      public var videoUuid: String {
        get {
          return snapshot["video_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "video_uuid")
        }
      }

      public var userUuid: String {
        get {
          return snapshot["user_uuid"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var comment: String {
        get {
          return snapshot["comment"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "comment")
        }
      }

      public var createdOn: String? {
        get {
          return snapshot["created_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_on")
        }
      }

      public var repliedTo: String? {
        get {
          return snapshot["replied_to"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "replied_to")
        }
      }

      public var modifiedOn: String? {
        get {
          return snapshot["modified_on"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modified_on")
        }
      }
    }
  }
}