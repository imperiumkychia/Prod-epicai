//
//  AICoachVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 05/03/22.
//

import Foundation

class AICoachVM {
    
    var notifyResult:((AICoach?) -> Void) = { _ in }
    
    var aiCoachResult:AICoach? {
        didSet {
            guard let result = aiCoachResult else { return }
            self.notifyResult(result)
        }
    }
    
    func getVideoResult(videoUUID:String) {
        appSyncClient?.fetch(query: GetVideoRelationshipQuery(video_uuid: videoUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let _ = error { }
            else if let _ = result?.errors?[0] { }
            else {
                var aiCoach = AICoach()
                aiCoach.thisVideo = ThisVideo()
                aiCoach.lastVideo = LastVideo()
                
                if let aiBLDetails = result?.data?.getVideoRelationship?.aiCoachBodyLanguage, aiBLDetails.count > 0 {
                    if let blResult = result?.data?.getVideoRelationship?.blResult, blResult.count > 0 {
                        aiCoach.thisVideo?.bodyLaguageResult =  BodyLanguage.bodyLanguages(awsResultArray: blResult)
                    }
                    //Assign Video URL
                    aiCoach.thisVideo?.blVideoURLS = ThisVideo.bodyLanguageWordsAiVideos(awsBodyLanguageVideo: result?.data?.getVideoRelationship?.aiCoachBodyLanguage ?? [])
                    
                    
                    //Last video
                    if let previousVideo = result?.data?.getVideoRelationship?.previousVideo, previousVideo.count > 0 {
                        if let  blResult = previousVideo[0]?.blResult, blResult.count > 0  {
                            aiCoach.lastVideo?.bodyLaguageResult =  BodyLanguage.previousBodyLanguages(awsResultArray: blResult)
                        }
                    }
                }
                if let aiSpeedDetails = result?.data?.getVideoRelationship?.aiCoachSpeed, aiSpeedDetails.count > 0  {
                    if let  speedResult = result?.data?.getVideoRelationship?.speedResult, speedResult.count > 0 {
                        //print("[DEBUG] AICoachVM : \(speedResult)")
                        aiCoach.thisVideo?.speedOfSpeech = SpeedOfSpeech.speedOfResult(awsResultArray: speedResult)
                    }
                    //Assign Video URL
                    aiCoach.thisVideo?.speedOfSpeechVideoURLS = ThisVideo.speedOfSpeechAiVideos(awsSpeedOfSpeechVideo: result?.data?.getVideoRelationship?.aiCoachSpeed ?? [])
                    
                    //LastVideo
                    if let previousVideo = result?.data?.getVideoRelationship?.previousVideo, previousVideo.count > 0 {
                        if let  speedResult = previousVideo[0]?.speedResult, speedResult.count > 0 {
                            aiCoach.lastVideo?.speedOfSpeech = SpeedOfSpeech.previousSpeedOfResult(awsResultArray: speedResult)
                        }
                    }
                    
                }
                if let aiFWDetails = result?.data?.getVideoRelationship?.aiCoachFillerwords, aiFWDetails.count > 0 {
                    if let  fwResult = result?.data?.getVideoRelationship?.fwResult , fwResult.count > 0 {
                        aiCoach.thisVideo?.fillerWords = FillerWord.fillerWords(awsResultArray: fwResult)
                    }
                    //Assign VideoURL
                    aiCoach.thisVideo?.fillerWordsVideoURLS  = ThisVideo.fillerWordsAiVideos(awsFillerWorldVideo: result?.data?.getVideoRelationship?.aiCoachFillerwords ?? [])
                    //Last Video
                    if let previousVideo = result?.data?.getVideoRelationship?.previousVideo, previousVideo.count > 0 {
                        if let  fwResult = previousVideo[0]?.fwResult, fwResult.count > 0 {
                            aiCoach.lastVideo?.fillerWords = FillerWord.previousFillerWords(awsResultArray: fwResult)
                        }
                    }
                    
                }
                if let aiTonalityDetails = result?.data?.getVideoRelationship?.aiCoachTonality, aiTonalityDetails.count > 0 {
                    if let  tonalityResult = result?.data?.getVideoRelationship?.tonalityResult, tonalityResult.count > 0 {
                        aiCoach.thisVideo?.tonalityResult = TonalityResult.tonalityResult(awsResultArray: tonalityResult)
                        
                        if let tonalityResultArray = result?.data?.getVideoRelationship?.tonalityResultDetail, tonalityResultArray.count > 0 {
                            aiCoach.thisVideo?.tonalityResult?.results = TonalityResult.tonalityResultDetails(awsResultArray: tonalityResultArray)
                        }
                        // Video assignment
                        aiCoach.thisVideo?.tonalityVideoURLS = ThisVideo.tonalityAiVideos(awsTonalityVideo: result?.data?.getVideoRelationship?.aiCoachTonality ?? [])
                    }
                    //Last Video
                    
                    if let previousVideo = result?.data?.getVideoRelationship?.previousVideo, previousVideo.count > 0 {
                        if let  tonalityResult = previousVideo[0]?.tonalityResult, tonalityResult.count > 0 {
                            aiCoach.lastVideo?.tonalityResult = TonalityResult.previousTonalityResult(awsResultArray: tonalityResult)
                            
                            if let previousVideo = result?.data?.getVideoRelationship?.previousVideo, previousVideo.count > 0 {
                                if let tonalityResultArray = previousVideo[0]?.tonalityResultDetail, tonalityResultArray.count > 0 {
                                    aiCoach.lastVideo?.tonalityResult?.results = TonalityResult.previousTonalityResultDetails(awsResultArray: tonalityResultArray)
                                }
                            }
                        }
                    }
                }
                self.aiCoachResult = aiCoach
            }
        })
    }
}
