//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit
import AVFoundation

// ########################################################################
// MARK: - Maximum video length in minutes
let maximumVideoLength: Int = 20

// MARK: - Frame Per Second
let fps: Int32 = 2

// MARK: - Video preset
let videoQuality: AVCaptureSession.Preset = .high

// MARK: - Audio bitrate
let audioBitRate: Int = 44000

let videoExtension = ".mp4"

let videoBucketkey = ""
let bodyPointBucketkey = "bodypoint/"
let audioPointBucketkey = "audio/"
let profileImagesBucketkey = "profileImages/"

let audioPoint = "AudioPoint"
let bodyPoint = "BodyPoint"
let videoTitlePlaceHolder = "Video title..."
let extractedAudioFileName = "EPICAudioFromVideo.m4a"

// #########################################################################
// MARK: - Color Palette
public struct Palette {
    static let darkPurple = UIColor(named: "AI2AR_darkPurple")
    static let lightPurple = UIColor(named: "AI2AR_lightPurple")
    static let pink = UIColor(named: "AI2AR_pink")
    static let grey = UIColor(named: "AI2AR_grey")
    static let tabbarBackground = UIColor(named: "AI2AR_tabbarbackground")
    static let lightBlue = UIColor(named: "AI2AR_lightBlue")
    
    struct V2 {
        static let V2_VCBackground = UIColor.modedColor(light: "#ffffff", dark: "#0a0b17")
        static let V2_VCTitle = UIColor.modedColor(light: "#37373a", dark: "#e8e9ed")
        static let v2_darkBlue = UIColor(named: "v2_darkBlue")
        static let v2_lightBlue = UIColor(named: "v2_lightBlue")
        static let v2_lightOrange = UIColor(named: "v2_lightOrange")
        static let v2_orange = UIColor(named: "v2_orange")
        static let V2_tabBarBackground = UIColor.modedColor(light: "#ffffff", dark: "#161728")
        static let V2_tabBarItemBackground = UIColor.modedColor(light: "#474c8c", dark: "#474c8c")
        static let V2_tabBarTitle = V2_tabBarBackground
        static let V2_feedsDate = UIColor.modedColor(light: "#c1c1c6", dark: "#91919a")
        static let V2_pageControlIndicatorSelected = UIColor.modedColor(light: "#8487b2", dark: "#474c8e")
        static let V2_pageControlIndicatorUnselected = UIColor.modedColor(light: "#e1e1e2", dark: "#2a2b36")
        static let V2_pieChartLegendLabel = UIColor(hex:"#37373a")
        static let V2_pieChartLegendDescription = UIColor.modedColor(light: "#69696b", dark: "#b0b1b7")
        static let V2_pieChartYellow = UIColor(hex: "#f7d68b")
        static let V2_pieChartBlue = UIColor(hex: "#a6d2f1")
        static let V2_pieChartGreen = UIColor(hex: "#b8d9ac")
        static let V2_pieChartRed = UIColor(hex: "#ff6d5d")
        static let V2_pieChartInnerCircle = UIColor.modedColor(light: "#eff0ff", dark: "#151628")
        static let V2_cameraBottomCenterButtonBackground = UIColor.modedColor(light: "#474c8c", dark: "#b3b4bc")
        static let V2_cameraBottomSideBackground = UIColor.modedColor(light: "#b3c4d0", dark: "#334357")
        static let V2_cameraBottomSideButton = UIColor.modedColor(light: "#62686e", dark: "#878e9a")
        static let V2_cameraTimerLabel = UIColor.modedColor(light: "#62686e", dark: "#8f8d98")
        static let V2_cameraVCSwitchSelectedBackground = UIColor.modedColor(light: "#ffffff", dark: "#161728")
        static let V2_cameraVCSwitchUnselectedBackground = UIColor.modedColor(light: "#344754", dark: "#314350")
        static let V2_cameraVCSwitchUnselectedTint = UIColor(hex: "#576771")
        static let V2_cameraVCBackground = UIColor(hex: "#547e97")
        static let V2_cameraVCCloseButtonBackground = UIColor.modedColor(light: "#bac9d2", dark: "#293c48")
        static let V2_cameraVCCloseButtonTint = UIColor.modedColor(light: "#344754", dark: "#878e9a")
        static let V2_tonalityLegendTitle = UIColor.modedColor(light: "#352641", dark: "#b0b1b7")
        static let V2_fillerWordsGrey = UIColor(hex: "#d5d7e3")
        static let V2_fillerWordsLightBlue = UIColor(hex: "#57b8ff")
        static let V2_fillerWordsBlue = UIColor(hex: "#0062ff")
        static let V2_alertButtonBackgroundBlue = UIColor(hex: "#474c8b")
        static let V2_profileTableDivider = UIColor.modedColor(light: "#f0f0f0", dark: "#202020")
        static let V2_linkBlue = UIColor(hex: "#007aff")
        static let V2_settingsGenericCellDivider = UIColor.modedColor(light: "#c8c7cc", dark: "#c8c7cc")
        static let V2_settingsGenericCellDetail = UIColor.modedColor(light: "#8e8e93", dark: "#8e8e93")
        static let V2_settingsGenericCellArrow = UIColor.modedColor(light: "#d1d1d6", dark: "#d1d1d6")
        static let V2_SettingsTableHeader = UIColor(hex: "#686868")
        static let V2_VideoMoreButton = UIColor(hex: "#091065")
        static let V2_VideoTrimCancelButton = UIColor(hex: "#cecfe0")
    }
}

// MARK: - Fonts
class LatoFont {
    class Names {
        static let regular = "Lato-Regular"
        static let italic = "Lato-Italic"
        static let hairline = "Lato-Hairline"
        static let hairlineItalic = "Lato-HairlineItalic"
        static let light = "Lato-Light"
        static let lightItalic = "Lato-LightItalic"
        static let bold = "Lato-Bold"
        static let boldItalic = "Lato-BoldItalic"
        static let black = "Lato-Black"
        static let blackItalic = "Lato-BlackItalic"
    }
    
    static let regular = UIFont(name: Names.regular, size: 14.0)!
    static let italic = UIFont(name: Names.italic, size: 14.0)!
    static let hairline = UIFont(name: Names.hairline, size: 14.0)!
    static let hairlineItalic = UIFont(name: Names.hairlineItalic, size: 14.0)!
    static let light = UIFont(name: Names.light, size: 14.0)!
    static let lightItalic = UIFont(name: Names.lightItalic, size: 14.0)!
    static let bold = UIFont(name: Names.bold, size: 14.0)!
    static let boldItalic = UIFont(name: Names.boldItalic, size: 14.0)!
    static let black = UIFont(name: Names.black, size: 14.0)!
    static let blackItalic = UIFont(name: Names.blackItalic, size: 14.0)!
}

// MARK: - Segues
public enum Segues: String {
    case showSignUpVC
    case showMainVC
    case showMainVC2
    case showDetailsVC
    case showAppSettingsVC
    case showHelpVC
    case showAnnouncementVC
    case showRegisterUserVC1
    case showRegisterUserVC2
    case showUserDetailsVC
}

public enum Joints: String {
    case right_handMidEnd_joint
    case right_arm_joint
    case right_forearm_joint
    case right_upLeg_joint
    case right_leg_joint
    case right_foot_joint
    case right_eyeball_joint
    case left_handMidEnd_joint
    case left_arm_joint
    case left_forearm_joint
    case left_upLeg_joint
    case left_leg_joint
    case left_foot_joint
    case left_eyeball_joint
    case nose_joint
    case neck_1_joint
}

// MARK - CSV header
let bodyPoseCSVHeader = ["timelapse",
                 "nose_x", "nose_y",
                 "neck_x", "neck_y",
                 "r_shoulder_x", "r_shoulder_y",
                 "r_elbow_x", "r_elbow_y",
                 "r_wrist_x", "r_wrist_y",
                 "l_shoulder_x", "l_shoulder_y",
                 "l_elbow_x", "l_elbow_y",
                 "l_wrist_x", "l_wrist_y",
                 "root_x", "root_y",
                 "r_hip_x", "r_hip_y",
                 "r_knee_x", "r_knee_y",
                 "r_ankle_x", "r_ankle_y",
                 "l_hip_x", "l_hip_y",
                 "l_knee_x", "l_knee_y",
                 "l_ankle_x", "l_ankle_y",
                 "l_eye_x", "l_eye_y",
                 "r_eye_x", "r_eye_y",
                 "l_ear_x", "l_ear_y",
                 "r_ear_x", "r_ear_y"]

let audioCSVHeader = ["timelapse", "sound_dB"]



public let museoFont = UIFont(name: "Museo", size: 17.0)
