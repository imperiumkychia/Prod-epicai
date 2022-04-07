//
//  AICoach.swift
//  EPICAI
//
//  Created by Abdul fattah on 05/03/22.
//

import Foundation

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct AICoach {
    var lastVideo:LastVideo?
    var thisVideo:ThisVideo?
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct LastVideo {
    var bodyLaguageResult:[BodyLanguage]?
    var speedOfSpeech:SpeedOfSpeech?
    var tonalityResult:TonalityResult?
    var fillerWords:[FillerWord]?
    var videoURLS:[String] = []
    
    static func lastVideoBodyLanguageWordsAiVideos(awsBodyLanguageVideo: [GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachBodyLanguage?]) -> [String] {
        var urlsString = [String]()
        for urlItem in awsBodyLanguageVideo {
            if let videoURL = urlItem?.s3Path {
                urlsString.append(videoURL)
            }
        }
        return urlsString
    }
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct ThisVideo {
    var bodyLaguageResult:[BodyLanguage]?
    var speedOfSpeech:SpeedOfSpeech?
    var tonalityResult:TonalityResult?
    var fillerWords:[FillerWord]?
    var blVideoURLS:[String] = []
    var speedOfSpeechVideoURLS:[String] = []
    var tonalityVideoURLS:[String] = []
    var fillerWordsVideoURLS:[String] = []
    
    static func bodyLanguageWordsAiVideos(awsBodyLanguageVideo: [GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachBodyLanguage?]) -> [String] {
        var urlsString = [String]()
        for urlItem in awsBodyLanguageVideo {
            if let videoURL = urlItem?.s3Path {
                urlsString.append(videoURL)
            }
        }
        return urlsString
    }
    
    static func speedOfSpeechAiVideos(awsSpeedOfSpeechVideo: [GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachSpeed?]) -> [String] {
        var urlsString = [String]()
        for urlItem in awsSpeedOfSpeechVideo {
            if let videoURL = urlItem?.s3Path {
                urlsString.append(videoURL)
            }
        }
        return urlsString
    }
    
    static func tonalityAiVideos(awsTonalityVideo: [GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachTonality?]) -> [String] {
        var urlsString = [String]()
        for urlItem in awsTonalityVideo {
            if let videoURL = urlItem?.s3Path {
                urlsString.append(videoURL)
            }
        }
        return urlsString
    }
    
    static func fillerWordsAiVideos(awsFillerWorldVideo: [GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachFillerword?]) -> [String] {
        var urlsString = [String]()
        for urlItem in awsFillerWorldVideo {
            if let videoURL = urlItem?.s3Path {
                urlsString.append(videoURL)
            }
        }
        return urlsString
    }
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct BodyLanguage {
    
    var type:String
    var score:Double
    
    static func bodyLanguages(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.BlResult?]) -> [BodyLanguage]? {
        var bodyLanguage:[BodyLanguage]? = []
        for item in awsResultArray {
            if let score = item?.score {
                if let type = item?.resultCategoryUuid?[0]?.subtype {
                    bodyLanguage?.append(BodyLanguage(type: type, score: score))
                }
            }
        }
        return bodyLanguage
    }
    
    // CREATED BY CHIA KANG YEE : 5th APRIL 2022
    // Used in EpicAIFeedVM for assignment and EPICAIFeedController for usage
    static func bodyLanguages(awsResultArray:[ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike.BlResult?]) -> [BodyLanguage]? {
        var bodyLanguage:[BodyLanguage]? = []
        for item in awsResultArray {
            if let score = item?.score {
                if let type = item?.resultCategoryUuid?[0]?.subtype {
                    bodyLanguage?.append(BodyLanguage(type: type, score: score))
                }
            }
        }
        return bodyLanguage
    }
    
    static func previousBodyLanguages(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.PreviousVideo.BlResult?]) -> [BodyLanguage]? {
        var bodyLanguage:[BodyLanguage]? = []
        for item in awsResultArray {
            if let score = item?.score {
                if let type = item?.resultCategoryUuid?[0]?.subtype {
                    bodyLanguage?.append(BodyLanguage(type: type, score: score))
                }
            }
        }
        return bodyLanguage
    }
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct SpeedOfSpeech {
    var score:Double
    
    static func speedOfSpeechWordsAiVideos(awsSpeedOfSpeechVideo: GetVideoRelationshipQuery.Data.GetVideoRelationship.AiCoachSpeed?) -> String {
        return awsSpeedOfSpeechVideo?.s3Path ?? ""
    }
    
    static func speedOfResult(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.SpeedResult?]) -> SpeedOfSpeech? {
        var speedOfSpeech:SpeedOfSpeech?
        for item in awsResultArray {
            if let score = item?.score {
                speedOfSpeech = SpeedOfSpeech(score: score)
            }
        }
        return speedOfSpeech
    }
    
    // CREATED BY CHIA KANG YEE : 5th APRIL 2022
    // Used in EpicAIFeedVM for assignment and EPICAIFeedController for usage
    static func speedOfResult(awsResultArray:[ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike.SpeedResult?]) -> SpeedOfSpeech? {
        var speedOfSpeech:SpeedOfSpeech?
        for item in awsResultArray {
            if let score = item?.score {
                speedOfSpeech = SpeedOfSpeech(score: score)
            }
        }
        return speedOfSpeech
    }
    
    static func previousSpeedOfResult(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.PreviousVideo.SpeedResult?]) -> SpeedOfSpeech? {
        var speedOfSpeech:SpeedOfSpeech?
        for item in awsResultArray {
            if let score = item?.score {
                speedOfSpeech = SpeedOfSpeech(score: score)
            }
        }
        return speedOfSpeech
    }
    
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct FillerWord {
    var type:String
    var score:Double
    
    static func fillerWords(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.FwResult?]) -> [FillerWord]? {
        var fwords:[FillerWord]? = []
        if awsResultArray.count > 0 { fwords = [] }
       
        for item in awsResultArray {
            if let fwCategory = item?.resultCategoryUuid?[0]?.subtype {
                if let score = item?.score {
                    fwords?.append(FillerWord(type: fwCategory, score: score))
                }
            }
        }
        return fwords
    }
    
    // CREATED BY CHIA KANG YEE : 5th APRIL 2022
    // Used in EpicAIFeedVM for assignment and EPICAIFeedController for usage
    static func fillerWords(awsResultArray:[ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike.FwResult?]) -> [FillerWord]? {
        var fwords:[FillerWord]? = []
        if awsResultArray.count > 0 { fwords = [] }
       
        for item in awsResultArray {
            if let fwCategory = item?.resultCategoryUuid?[0]?.subtype {
                if let score = item?.score {
                    fwords?.append(FillerWord(type: fwCategory, score: score))
                }
            }
        }
        return fwords
    }
    
    static func previousFillerWords(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.PreviousVideo.FwResult?]) -> [FillerWord]? {
        var fwords:[FillerWord]? = []
        for item in awsResultArray {
            if let fwCategory = item?.resultCategoryUuid?[0]?.subtype {
                if let score = item?.score {
                    fwords?.append(FillerWord(type: fwCategory, score: score))
                }
            }
        }
        return fwords
    }
}

/// Application define Model
/// Retriving data from API, GetVideoRelationship
struct TonalityResult {
    var score:Double?
    var averageDecibel:Double?
    var maxDecibel:Double?
    var minDecibel:Double?
    var results:[Double]?

    static func tonalityResult(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.TonalityResult?]) -> TonalityResult? {
        var tonality:TonalityResult?
        for item in awsResultArray {
            if let _ = item?.tonalityResultUuid {
                tonality = TonalityResult()
            }
            if let score = item?.score {
                tonality?.score = score
            }
            if let avDecible = item?.averageDecibel {
                tonality?.averageDecibel = avDecible
            }
            if let maxDecible = item?.maxDecibel {
                tonality?.maxDecibel = maxDecible
            }
            if let minDecible = item?.minDecibel {
                tonality?.minDecibel = minDecible
            }
        }
        return tonality
    }
    
    // CREATED BY CHIA KANG YEE : 5th APRIL 2022
    // Used in EpicAIFeedVM for assignment and EPICAIFeedController for usage
    static func tonalityResult(awsResultArray:[ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike.TonalityResult?]) -> TonalityResult? {
        var tonality:TonalityResult?
        for item in awsResultArray {
            if let _ = item?.tonalityResultUuid {
                tonality = TonalityResult()
            }
            if let score = item?.score {
                tonality?.score = score
            }
            if let avDecible = item?.averageDecibel {
                tonality?.averageDecibel = avDecible
            }
            if let maxDecible = item?.maxDecibel {
                tonality?.maxDecibel = maxDecible
            }
            if let minDecible = item?.minDecibel {
                tonality?.minDecibel = minDecible
            }
        }
        return tonality
    }
    
    
    static func previousTonalityResult(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.PreviousVideo.TonalityResult?]) -> TonalityResult? {
        var tonality:TonalityResult?
        for item in awsResultArray {
            if let _ = item?.tonalityResultUuid {
                tonality = TonalityResult()
            }
            if let score = item?.score {
                tonality?.score = score
            }
            if let avDecible = item?.averageDecibel {
                tonality?.averageDecibel = avDecible
            }
            if let maxDecible = item?.maxDecibel {
                tonality?.maxDecibel = maxDecible
            }
            if let minDecible = item?.minDecibel {
                tonality?.minDecibel = minDecible
            }
        }
        return tonality
    }
    
    static func tonalityResultDetails(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.TonalityResultDetail?]) -> [Double]? {
        var tResult:[Double]? = []
        for item in awsResultArray {
            if let score = item?.tonalityDb {
                tResult?.append(score)
            }
        }
        return tResult
    }
    
    // CREATED BY CHIA KANG YEE : 5th APRIL 2022
    // Used in EpicAIFeedVM for assignment and EPICAIFeedController for usage
    static func tonalityResultDetails(awsResultArray:[ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike.TonalityResultDetail?]) -> [Double]? {
        var tResult:[Double]? = []
        for item in awsResultArray {
            if let score = item?.tonalityDb {
                tResult?.append(score)
            }
        }
        return tResult
    }
    
    
    static func previousTonalityResultDetails(awsResultArray:[GetVideoRelationshipQuery.Data.GetVideoRelationship.PreviousVideo.TonalityResultDetail?]) -> [Double]? {
        var tResult:[Double]? = []
        for item in awsResultArray {
            if let score = item?.tonalityDb {
                tResult?.append(score)
            }
        }
        return tResult
    }
    
}
