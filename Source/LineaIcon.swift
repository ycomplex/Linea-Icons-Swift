//
//  LineaIcon.swift
//  Soapbox
//
//  Created by User on 05/04/2016.
//  Copyright © 2016 YComplex. All rights reserved.
//

import Foundation
import UIKit

public extension UIBarButtonItem {
    
    /**
     To set an icon, use i.e. `barName.LineaIcon = LineaType.LineaGithub`
     */
    func setLineaIcon(icon: LineaType, iconSize: CGFloat) {
        
        LineaFontLoader.loadFontIfNeeded()
        let font = UIFont(name: icon.font!, size: iconSize)
        
        assert(font != nil, LineaStruct.ErrorAnnounce)
        setTitleTextAttributes([NSFontAttributeName: font!], forState: .Normal)
        title = icon.text
    }
    
    
    /**
     To set an icon, use i.e. `barName.setLineaIcon(LineaType.LineaGithub, iconSize: 35)`
     */
    var LineaIcon: LineaType? {
        set {
            
            LineaFontLoader.loadFontIfNeeded()
            let font = UIFont(name: newValue!.font!, size: 23)
            assert(font != nil,LineaStruct.ErrorAnnounce)
            setTitleTextAttributes([NSFontAttributeName: font!], forState: .Normal)
            title = newValue?.text
        }
        
        get {
            if let title = title {
                
                if let index =  LineaIcons.indexOf(title) {
                    
                    return LineaType(rawValue: index)
                }
            }
            return nil
        }
    }
    
    
    func setLineaText(prefixText prefixText: String, icon: LineaType?, postfixText: String, size: CGFloat) {
        
        LineaFontLoader.loadFontIfNeeded()
        let font = UIFont(name: icon!.font!, size: size)
        
        assert(font != nil, LineaStruct.ErrorAnnounce)
        setTitleTextAttributes([NSFontAttributeName: font!], forState: .Normal)
        
        var text = prefixText
        if let iconText = icon?.text {
            
            text += iconText
        }
        text += postfixText
        title = text
    }
}

public extension UIButton {
    
    /**
     To set an icon, use i.e. `buttonName.setLineaIcon(LineaType.LineaGithub, forState: .Normal)`
     */
    func setLineaIcon(icon: LineaType, forState state: UIControlState) {
        
        if let titleLabel = titleLabel {
            LineaFontLoader.loadFontIfNeeded()
            let font = UIFont(name: icon.font!, size: titleLabel.font.pointSize)
            assert(font != nil, LineaStruct.ErrorAnnounce)
            titleLabel.font = font!
            setTitle(icon.text, forState: state)
        }
    }
    
    
    /**
     To set an icon, use i.e. `buttonName.setLineaIcon(LineaType.LineaGithub, iconSize: 35, forState: .Normal)`
     */
    func setLineaIcon(icon: LineaType, iconSize: CGFloat, forState state: UIControlState) {
        
        setLineaIcon(icon, forState: state)
        if let fontName = titleLabel?.font.fontName {
            
            titleLabel?.font = UIFont(name: fontName, size: iconSize)
        }
    }
    
    
    func setLineaText(prefixText prefixText: String, icon: LineaType?, postfixText: String, size: CGFloat?, forState state: UIControlState, iconSize: CGFloat? = nil) {
        
        if let titleLabel = titleLabel {
            LineaFontLoader.loadFontIfNeeded()
            let textFont = UIFont(name: titleLabel.font!.fontName, size: size ?? titleLabel.font.pointSize)!
            
            let textAttribute = [NSFontAttributeName : textFont]
            let prefixTextAttribured = NSMutableAttributedString(string: prefixText, attributes: textAttribute)
            
            if let iconText = icon?.text {
                let iconFont = UIFont(name: icon!.font!, size: iconSize ?? size ?? titleLabel.font.pointSize)!
                let iconAttribute = [NSFontAttributeName : iconFont]
                
                let iconString = NSAttributedString(string: iconText, attributes: iconAttribute)
                prefixTextAttribured.appendAttributedString(iconString)
            }
            
            let postfixTextAttributed = NSAttributedString(string: postfixText, attributes: textAttribute)
            prefixTextAttribured.appendAttributedString(postfixTextAttributed)
            
            setAttributedTitle(prefixTextAttribured, forState: state)
        }
    }
    
    
    func setLineaTitleColor(color: UIColor) {
        
        let attributedString = NSMutableAttributedString(attributedString: titleLabel!.attributedText!)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, titleLabel!.text!.characters.count))
    }
}


public extension UILabel {
    
    /**
     To set an icon, use i.e. `labelName.LineaIcon = LineaType.LineaGithub`
     */
    var LineaIcon: LineaType? {
        
        set {
            
            if let newValue = newValue {
                
                LineaFontLoader.loadFontIfNeeded()
                let fontLinea = UIFont(name: newValue.font!, size: self.font.pointSize)
                assert(fontLinea != nil, LineaStruct.ErrorAnnounce)
                font = fontLinea!
                text = newValue.text
            }
        }
        
        get {
            if let text = text {
                
                if let index =  LineaIcons.indexOf(text) {
                    
                    return LineaType(rawValue: index)
                }
            }
            return nil
        }
    }
    
    /**
     To set an icon, use i.e. `labelName.setLineaIcon(LineaType.LineaGithub, iconSize: 35)`
     */
    func setLineaIcon(icon: LineaType, iconSize: CGFloat) {
        
        LineaIcon = icon
        font = UIFont(name: font.fontName, size: iconSize)
    }
    
    
    func setLineaText(prefixText prefixText: String, icon: LineaType?, postfixText: String, size: CGFloat?, iconSize: CGFloat? = nil) {
        
        LineaFontLoader.loadFontIfNeeded()
        let textFont = UIFont(name: icon!.font!, size: size ?? self.font.pointSize)
        assert(textFont != nil, LineaStruct.ErrorAnnounce)
        font = textFont!
        
        let textAttribute = [NSFontAttributeName : font]
        let myString = NSMutableAttributedString(string: prefixText, attributes: textAttribute )
        
        
        if let iconText = icon?.text {
            
            let iconFont = UIFont(name: icon!.font!, size: iconSize ?? size ?? self.font.pointSize)!
            let iconAttribute = [NSFontAttributeName : iconFont]
            
            
            let iconString = NSAttributedString(string: iconText, attributes: iconAttribute)
            myString.appendAttributedString(iconString)
        }
        
        let postfixString = NSAttributedString(string: postfixText)
        myString.appendAttributedString(postfixString)
        
        self.attributedText = myString
    }
    
}


// Original idea from https://github.com/thii/FontAwesome.swift/blob/master/FontAwesome/FontAwesome.swift
public extension UIImageView {
    
    /**
     Create UIImage from LineaType
     */
    public func setLineaIconWithName(icon: LineaType, textColor: UIColor, backgroundColor: UIColor = UIColor.clearColor()) {
        
        self.image = UIImage(icon: icon, size: frame.size, textColor: textColor, backgroundColor: backgroundColor)
    }
}


public extension UITabBarItem {
    
    public func setLineaIcon(icon: LineaType) {
        
        image = UIImage(icon: icon, size: CGSize(width: 30, height: 30))
    }
}


public extension UISegmentedControl {
    
    public func setLineaIcon(icon: LineaType, forSegmentAtIndex segment: Int) {
        
        LineaFontLoader.loadFontIfNeeded()
        let font = UIFont(name: icon.font!, size: 23)
        assert(font != nil, LineaStruct.ErrorAnnounce)
        setTitleTextAttributes([NSFontAttributeName: font!], forState: .Normal)
        setTitle(icon.text, forSegmentAtIndex: segment)
    }
}


public extension UIImage {
    
    public convenience init(icon: LineaType, size: CGSize, textColor: UIColor = UIColor.blackColor(), backgroundColor: UIColor = UIColor.clearColor()) {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.Center
        
        // Taken from FontAwesome.io's Fixed Width Icon CSS
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        
        LineaFontLoader.loadFontIfNeeded()
        let font = UIFont(name: icon.font!, size: fontSize)
        assert(font != nil, LineaStruct.ErrorAnnounce)
        let attributes = [NSFontAttributeName: font!, NSForegroundColorAttributeName: textColor, NSBackgroundColorAttributeName: backgroundColor, NSParagraphStyleAttributeName: paragraph]
        
        let attributedString = NSAttributedString(string: icon.text!, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.drawInRect(CGRectMake(0, (size.height - fontSize) / 2, size.width, fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = image {
            self.init(CGImage: image.CGImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }
}


public extension UISlider {
    
    func setLineaMaximumValueImage(icon: LineaType, customSize: CGSize? = nil) {
        
        maximumValueImage = UIImage(icon: icon, size: customSize ?? CGSizeMake(25, 25))
    }
    
    
    func setLineaMinimumValueImage(icon: LineaType, customSize: CGSize? = nil) {
        
        minimumValueImage = UIImage(icon: icon, size: customSize ?? CGSizeMake(25, 25))
    }
}


public extension UIViewController {
    var LineaTitle: LineaType? {
        set {
            if (newValue != nil) {
                LineaFontLoader.loadFontIfNeeded()
                let font = UIFont(name: newValue!.font!, size: 23)
                assert(font != nil,LineaStruct.ErrorAnnounce)
                navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: font!]
                title = newValue?.text
            }
        }
        get {
            if let title = title {
                if let index =  LineaIcons.indexOf(title) {
                    return LineaType(rawValue: index)
                }
            }
            return nil
        }
    }
}



private struct LineaStruct {
    static let ErrorAnnounce = "****** LINEA ICONS SWIFT - Linea font not found in the bundle or not associated with Info.plist when manual installation was performed. ******"
}


private class LineaFontLoader {
    
    struct LineaStatic {
        static var onceToken : dispatch_once_t = 0
    }
    
    static func loadFontIfNeeded() {
        if (UIFont.fontNamesForFamilyName("linea-basic-elaboration-10").count == 0) {
            
            dispatch_once(&LineaStatic.onceToken) {
                loadFont("linea-basic-elaboration-10")
                loadFont("linea-arrows-10")
                loadFont("linea-basic-10")
                loadFont("linea-software-10")
                loadFont("linea-ecommerce-10")
                loadFont("linea-music-10")
                loadFont("linea-weather-10")
            }
        }
    }
    
    static func loadFont(named: String) {
        let bundle = NSBundle(forClass: LineaFontLoader.self)
        var fontURL = NSURL()
        let identifier = bundle.bundleIdentifier
        
        if identifier?.hasPrefix("org.cocoapods") == true {
            fontURL = bundle.URLForResource(named, withExtension: "ttf", subdirectory: "Linea-Icon-Swift.bundle")!
        } else {
            fontURL = bundle.URLForResource(named, withExtension: "ttf")!
        }
        let data = NSData(contentsOfURL: fontURL)!
        
        let provider = CGDataProviderCreateWithCFData(data)
        let font = CGFontCreateWithDataProvider(provider)!
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            
            let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
       
    }
}


/**
 List of all icons in Font Awesome
 */
public enum LineaType: Int {
    
    static var count: Int {
        
        return LineaIcons.count
    }
    
    var text: String? {
        
        return LineaIcons[rawValue]
    }
    
    var font: String? {
        
        return LineaFonts[rawValue]
    }
    
    
    case WeatherAquarius, WeatherAries, WeatherCancer, WeatherCapricorn, WeatherCloud, WeatherCloudDrop, WeatherCloudLightning, WeatherCloudSnowflake, WeatherDownpourFullmoon, WeatherDownpourHalfmoon, WeatherDownpourSun, WeatherDrop, WeatherFirstQuarter, WeatherFog, WeatherFogFullmoon, WeatherFogHalfmoon, WeatherFogSun, WeatherFullmoon, WeatherGemini, WeatherHail, WeatherHailFullmoon, WeatherHailHalfmoon, WeatherHailSun, WeatherLastQuarter, WeatherLeo, WeatherLibra, WeatherLightning, WeatherMistyrain, WeatherMistyrainFullmoon, WeatherMistyrainHalfmoon, WeatherMistyrainSun, WeatherMoon, WeatherMoondownFull, WeatherMoondownHalf, WeatherMoonsetFull, WeatherMoonsetHalf, WeatherMove2, WeatherNewmoon, WeatherPisces, WeatherRain, WeatherRainFullmoon, WeatherRainHalfmoon, WeatherRainSun, WeatherSagittarius, WeatherScorpio, WeatherSnow, WeatherSnowFullmoon, WeatherSnowHalfmoon, WeatherSnowSun, WeatherSnowflake, WeatherStar, WeatherStorm11, WeatherStorm32, WeatherStormFullmoon, WeatherStormHalfmoon, WeatherStormSun, WeatherSun, WeatherSundown, WeatherSunset, WeatherTaurus, WeatherTempest, WeatherTempestFullmoon, WeatherTempestHalfmoon, WeatherTempestSun, WeatherVariableFullmoon, WeatherVariableHalfmoon, WeatherVariableSun, WeatherVirgo, WeatherWaningCresent, WeatherWaningGibbous, WeatherWaxingCresent, WeatherWaxingGibbous, WeatherWind, WeatherWindE, WeatherWindFullmoon, WeatherWindHalfmoon, WeatherWindN, WeatherWindNe, WeatherWindNw, WeatherWindS, WeatherWindSe, WeatherWindSun, WeatherWindSw, WeatherWindW, WeatherWindgust, MusicBeginningButton, MusicBell, MusicCd, MusicDiapason, MusicEjectButton, MusicEndButton, MusicFastforwardButton, MusicHeadphones, MusicIpod, MusicLoudspeaker, MusicMicrophone, MusicMicrophoneOld, MusicMixer, MusicMute, MusicNoteMultiple, MusicNoteSingle, MusicPauseButton, MusicPlayButton, MusicPlaylist, MusicRadioGhettoblaster, MusicRadioPortable, MusicRecord, MusicRecordplayer, MusicRepeatButton, MusicRewindButton, MusicShuffleButton, MusicStopButton, MusicTape, MusicVolumeDown, MusicVolumeUp, EcommerceBag, EcommerceBagCheck, EcommerceBagCloud, EcommerceBagDownload, EcommerceBagMinus, EcommerceBagPlus, EcommerceBagRefresh, EcommerceBagRemove, EcommerceBagSearch, EcommerceBagUpload, EcommerceBanknote, EcommerceBanknotes, EcommerceBasket, EcommerceBasketCheck, EcommerceBasketCloud, EcommerceBasketDownload, EcommerceBasketMinus, EcommerceBasketPlus, EcommerceBasketRefresh, EcommerceBasketRemove, EcommerceBasketSearch, EcommerceBasketUpload, EcommerceBath, EcommerceCart, EcommerceCartCheck, EcommerceCartCloud, EcommerceCartContent, EcommerceCartDownload, EcommerceCartMinus, EcommerceCartPlus, EcommerceCartRefresh, EcommerceCartRemove, EcommerceCartSearch, EcommerceCartUpload, EcommerceCent, EcommerceColon, EcommerceCreditcard, EcommerceDiamond, EcommerceDollar, EcommerceEuro, EcommerceFranc, EcommerceGift, EcommerceGraph1, EcommerceGraph2, EcommerceGraph3, EcommerceGraphDecrease, EcommerceGraphIncrease, EcommerceGuarani, EcommerceKips, EcommerceLira, EcommerceMegaphone, EcommerceMoney, EcommerceNaira, EcommercePesos, EcommercePound, EcommerceReceipt, EcommerceReceiptBath, EcommerceReceiptCent, EcommerceReceiptDollar, EcommerceReceiptEuro, EcommerceReceiptFranc, EcommerceReceiptGuarani, EcommerceReceiptKips, EcommerceReceiptLira, EcommerceReceiptNaira, EcommerceReceiptPesos, EcommerceReceiptPound, EcommerceReceiptRublo, EcommerceReceiptRupee, EcommerceReceiptTugrik, EcommerceReceiptWon, EcommerceReceiptYen, EcommerceReceiptYen2, EcommerceReceptColon, EcommerceRublo, EcommerceRupee, EcommerceSafe, EcommerceSale, EcommerceSales, EcommerceTicket, EcommerceTugriks, EcommerceWallet, EcommerceWon, EcommerceYen, EcommerceYen2, SoftwareAddVectorpoint, SoftwareBoxOval, SoftwareBoxPolygon, SoftwareBoxRectangle, SoftwareBoxRoundedrectangle, SoftwareCharacter, SoftwareCrop, SoftwareEyedropper, SoftwareFontAllcaps, SoftwareFontBaselineShift, SoftwareFontHorizontalScale, SoftwareFontKerning, SoftwareFontLeading, SoftwareFontSize, SoftwareFontSmallcapital, SoftwareFontSmallcaps, SoftwareFontStrikethrough, SoftwareFontTracking, SoftwareFontUnderline, SoftwareFontVerticalScale, SoftwareHorizontalAlignCenter, SoftwareHorizontalAlignLeft, SoftwareHorizontalAlignRight, SoftwareHorizontalDistributeCenter, SoftwareHorizontalDistributeLeft, SoftwareHorizontalDistributeRight, SoftwareIndentFirstline, SoftwareIndentLeft, SoftwareIndentRight, SoftwareLasso, SoftwareLayers1, SoftwareLayers2, SoftwareLayout, SoftwareLayout2Columns, SoftwareLayout3Columns, SoftwareLayout4Boxes, SoftwareLayout4Columns, SoftwareLayout4Lines, SoftwareLayout8Boxes, SoftwareLayoutHeader, SoftwareLayoutHeader2Columns, SoftwareLayoutHeader3Columns, SoftwareLayoutHeader4Boxes, SoftwareLayoutHeader4Columns, SoftwareLayoutHeaderComplex, SoftwareLayoutHeaderComplex2, SoftwareLayoutHeaderComplex3, SoftwareLayoutHeaderComplex4, SoftwareLayoutHeaderSideleft, SoftwareLayoutHeaderSideright, SoftwareLayoutSidebarLeft, SoftwareLayoutSidebarRight, SoftwareMagnete, SoftwarePages, SoftwarePaintbrush, SoftwarePaintbucket, SoftwarePaintroller, SoftwareParagraph, SoftwareParagraphAlignLeft, SoftwareParagraphAlignRight, SoftwareParagraphCenter, SoftwareParagraphJustifyAll, SoftwareParagraphJustifyCenter, SoftwareParagraphJustifyLeft, SoftwareParagraphJustifyRight, SoftwareParagraphSpaceAfter, SoftwareParagraphSpaceBefore, SoftwarePathfinderExclude, SoftwarePathfinderIntersect, SoftwarePathfinderSubtract, SoftwarePathfinderUnite, SoftwarePen, SoftwarePenAdd, SoftwarePenRemove, SoftwarePencil, SoftwarePolygonallasso, SoftwareReflectHorizontal, SoftwareReflectVertical, SoftwareRemoveVectorpoint, SoftwareScaleExpand, SoftwareScaleReduce, SoftwareSelectionOval, SoftwareSelectionPolygon, SoftwareSelectionRectangle, SoftwareSelectionRoundedrectangle, SoftwareShapeOval, SoftwareShapePolygon, SoftwareShapeRectangle, SoftwareShapeRoundedrectangle, SoftwareSlice, SoftwareTransformBezier, SoftwareVectorBox, SoftwareVectorComposite, SoftwareVectorLine, SoftwareVerticalAlignBottom, SoftwareVerticalAlignCenter, SoftwareVerticalAlignTop, SoftwareVerticalDistributeBottom, SoftwareVerticalDistributeCenter, SoftwareVerticalDistributeTop, BasicAccelerator, BasicAlarm, BasicAnchor, BasicAnticlockwise, BasicArchive, BasicArchiveFull, BasicBan, BasicBatteryCharge, BasicBatteryEmpty, BasicBatteryFull, BasicBatteryHalf, BasicBolt, BasicBook, BasicBookPen, BasicBookPencil, BasicBookmark, BasicCalculator, BasicCalendar, BasicCardsDiamonds, BasicCardsHearts, BasicCase, BasicChronometer, BasicClessidre, BasicClock, BasicClockwise, BasicCloud, BasicClubs, BasicCompass, BasicCup, BasicDiamonds, BasicDisplay, BasicDownload, BasicExclamation, BasicEye, BasicEyeClosed, BasicFemale, BasicFlag1, BasicFlag2, BasicFloppydisk, BasicFolder, BasicFolderMultiple, BasicGear, BasicGeolocalize01, BasicGeolocalize05, BasicGlobe, BasicGunsight, BasicHammer, BasicHeadset, BasicHeart, BasicHeartBroken, BasicHelm, BasicHome, BasicInfo, BasicIpod, BasicJoypad, BasicKey, BasicKeyboard, BasicLaptop, BasicLifeBuoy, BasicLightbulb, BasicLink, BasicLock, BasicLockOpen, BasicMagicMouse, BasicMagnifier, BasicMagnifierMinus, BasicMagnifierPlus, BasicMail, BasicMailMultiple, BasicMailOpen, BasicMailOpenText, BasicMale, BasicMap, BasicMessage, BasicMessageMultiple, BasicMessageTxt, BasicMixer2, BasicMouse, BasicNotebook, BasicNotebookPen, BasicNotebookPencil, BasicPaperplane, BasicPencilRuler, BasicPencilRulerPen, BasicPhoto, BasicPicture, BasicPictureMultiple, BasicPin1, BasicPin2, BasicPostcard, BasicPostcardMultiple, BasicPrinter, BasicQuestion, BasicRss, BasicServer, BasicServer2, BasicServerCloud, BasicServerDownload, BasicServerUpload, BasicSettings, BasicShare, BasicSheet, BasicSheetMultiple, BasicSheetPen, BasicSheetPencil, BasicSheetTxt, BasicSigns, BasicSmartphone, BasicSpades, BasicSpread, BasicSpreadBookmark, BasicSpreadText, BasicSpreadTextBookmark, BasicStar, BasicTablet, BasicTarget, BasicTodo, BasicTodoPen, BasicTodoPencil, BasicTodoTxt, BasicTodolistPen, BasicTodolistPencil, BasicTrashcan, BasicTrashcanFull, BasicTrashcanRefresh, BasicTrashcanRemove, BasicUpload, BasicUsb, BasicVideo, BasicWatch, BasicWebpage, BasicWebpageImgTxt, BasicWebpageMultiple, BasicWebpageTxt, BasicWorld, ArrowsAnticlockwise, ArrowsAnticlockwiseDashed, ArrowsButtonDown, ArrowsButtonOff, ArrowsButtonOn, ArrowsButtonUp, ArrowsCheck, ArrowsCircleCheck, ArrowsCircleDown, ArrowsCircleDownleft, ArrowsCircleDownright, ArrowsCircleLeft, ArrowsCircleMinus, ArrowsCirclePlus, ArrowsCircleRemove, ArrowsCircleRight, ArrowsCircleUp, ArrowsCircleUpleft, ArrowsCircleUpright, ArrowsClockwise, ArrowsClockwiseDashed, ArrowsCompress, ArrowsDeny, ArrowsDiagonal, ArrowsDiagonal2, ArrowsDown, ArrowsDownDouble, ArrowsDownleft, ArrowsDownright, ArrowsDragDown, ArrowsDragDownDashed, ArrowsDragHoriz, ArrowsDragLeft, ArrowsDragLeftDashed, ArrowsDragRight, ArrowsDragRightDashed, ArrowsDragUp, ArrowsDragUpDashed, ArrowsDragVert, ArrowsExclamation, ArrowsExpand, ArrowsExpandDiagonal1, ArrowsExpandHorizontal1, ArrowsExpandVertical1, ArrowsFitHorizontal, ArrowsFitVertical, ArrowsGlide, ArrowsGlideHorizontal, ArrowsGlideVertical, ArrowsHamburger1, ArrowsHamburger2, ArrowsHorizontal, ArrowsInfo, ArrowsKeyboardAlt, ArrowsKeyboardCmd, ArrowsKeyboardDelete, ArrowsKeyboardDown, ArrowsKeyboardLeft, ArrowsKeyboardReturn, ArrowsKeyboardRight, ArrowsKeyboardShift, ArrowsKeyboardTab, ArrowsKeyboardUp, ArrowsLeft, ArrowsLeftDouble32, ArrowsMinus, ArrowsMove, ArrowsMove2, ArrowsMoveBottom, ArrowsMoveLeft, ArrowsMoveRight, ArrowsMoveTop, ArrowsPlus, ArrowsQuestion, ArrowsRemove, ArrowsRight, ArrowsRightDouble, ArrowsRotate, ArrowsRotateAnti, ArrowsRotateAntiDashed, ArrowsRotateDashed, ArrowsShrink, ArrowsShrinkDiagonal1, ArrowsShrinkDiagonal2, ArrowsShrinkHorizonal2, ArrowsShrinkHorizontal1, ArrowsShrinkVertical1, ArrowsShrinkVertical2, ArrowsSignDown, ArrowsSignLeft, ArrowsSignRight, ArrowsSignUp, ArrowsSlideDown1, ArrowsSlideDown2, ArrowsSlideLeft1, ArrowsSlideLeft2, ArrowsSlideRight1, ArrowsSlideRight2, ArrowsSlideUp1, ArrowsSlideUp2, ArrowsSlimDown, ArrowsSlimDownDashed, ArrowsSlimLeft, ArrowsSlimLeftDashed, ArrowsSlimRight, ArrowsSlimRightDashed, ArrowsSlimUp, ArrowsSlimUpDashed, ArrowsSquareCheck, ArrowsSquareDown, ArrowsSquareDownleft, ArrowsSquareDownright, ArrowsSquareLeft, ArrowsSquareMinus, ArrowsSquarePlus, ArrowsSquareRemove, ArrowsSquareRight, ArrowsSquareUp, ArrowsSquareUpleft, ArrowsSquareUpright, ArrowsSquares, ArrowsStretchDiagonal1, ArrowsStretchDiagonal2, ArrowsStretchDiagonal3, ArrowsStretchDiagonal4, ArrowsStretchHorizontal1, ArrowsStretchHorizontal2, ArrowsStretchVertical1, ArrowsStretchVertical2, ArrowsSwitchHorizontal, ArrowsSwitchVertical, ArrowsUp, ArrowsUpDouble33, ArrowsUpleft, ArrowsUpright, ArrowsVertical, BasicElaborationBookmarkChecck, BasicElaborationBookmarkMinus, BasicElaborationBookmarkPlus, BasicElaborationBookmarkRemove, BasicElaborationBriefcaseCheck, BasicElaborationBriefcaseDownload, BasicElaborationBriefcaseFlagged, BasicElaborationBriefcaseMinus, BasicElaborationBriefcasePlus, BasicElaborationBriefcaseRefresh, BasicElaborationBriefcaseRemove, BasicElaborationBriefcaseSearch, BasicElaborationBriefcaseStar, BasicElaborationBriefcaseUpload, BasicElaborationBrowserCheck, BasicElaborationBrowserDownload, BasicElaborationBrowserMinus, BasicElaborationBrowserPlus, BasicElaborationBrowserRefresh, BasicElaborationBrowserRemove, BasicElaborationBrowserSearch, BasicElaborationBrowserStar, BasicElaborationBrowserUpload, BasicElaborationCalendarCheck, BasicElaborationCalendarCloud, BasicElaborationCalendarDownload, BasicElaborationCalendarEmpty, BasicElaborationCalendarFlagged, BasicElaborationCalendarHeart, BasicElaborationCalendarMinus, BasicElaborationCalendarNext, BasicElaborationCalendarNoaccess, BasicElaborationCalendarPencil, BasicElaborationCalendarPlus, BasicElaborationCalendarPrevious, BasicElaborationCalendarRefresh, BasicElaborationCalendarRemove, BasicElaborationCalendarSearch, BasicElaborationCalendarStar, BasicElaborationCalendarUpload, BasicElaborationCloudCheck, BasicElaborationCloudDownload, BasicElaborationCloudMinus, BasicElaborationCloudNoaccess, BasicElaborationCloudPlus, BasicElaborationCloudRefresh, BasicElaborationCloudRemove, BasicElaborationCloudSearch, BasicElaborationCloudUpload, BasicElaborationDocumentCheck, BasicElaborationDocumentCloud, BasicElaborationDocumentDownload, BasicElaborationDocumentFlagged, BasicElaborationDocumentGraph, BasicElaborationDocumentHeart, BasicElaborationDocumentMinus, BasicElaborationDocumentNext, BasicElaborationDocumentNoaccess, BasicElaborationDocumentNote, BasicElaborationDocumentPencil, BasicElaborationDocumentPicture, BasicElaborationDocumentPlus, BasicElaborationDocumentPrevious, BasicElaborationDocumentRefresh, BasicElaborationDocumentRemove, BasicElaborationDocumentSearch, BasicElaborationDocumentStar, BasicElaborationDocumentUpload, BasicElaborationFolderCheck, BasicElaborationFolderCloud, BasicElaborationFolderDocument, BasicElaborationFolderDownload, BasicElaborationFolderFlagged, BasicElaborationFolderGraph, BasicElaborationFolderHeart, BasicElaborationFolderMinus, BasicElaborationFolderNext, BasicElaborationFolderNoaccess, BasicElaborationFolderNote, BasicElaborationFolderPencil, BasicElaborationFolderPicture, BasicElaborationFolderPlus, BasicElaborationFolderPrevious, BasicElaborationFolderRefresh, BasicElaborationFolderRemove, BasicElaborationFolderSearch, BasicElaborationFolderStar, BasicElaborationFolderUpload, BasicElaborationMailCheck, BasicElaborationMailCloud, BasicElaborationMailDocument, BasicElaborationMailDownload, BasicElaborationMailFlagged, BasicElaborationMailHeart, BasicElaborationMailNext, BasicElaborationMailNoaccess, BasicElaborationMailNote, BasicElaborationMailPencil, BasicElaborationMailPicture, BasicElaborationMailPrevious, BasicElaborationMailRefresh, BasicElaborationMailRemove, BasicElaborationMailSearch, BasicElaborationMailStar, BasicElaborationMailUpload, BasicElaborationMessageCheck, BasicElaborationMessageDots, BasicElaborationMessageHappy, BasicElaborationMessageHeart, BasicElaborationMessageMinus, BasicElaborationMessageNote, BasicElaborationMessagePlus, BasicElaborationMessageRefresh, BasicElaborationMessageRemove, BasicElaborationMessageSad, BasicElaborationSmartphoneCloud, BasicElaborationSmartphoneHeart, BasicElaborationSmartphoneNoaccess, BasicElaborationSmartphoneNote, BasicElaborationSmartphonePencil, BasicElaborationSmartphonePicture, BasicElaborationSmartphoneRefresh, BasicElaborationSmartphoneSearch, BasicElaborationTabletCloud, BasicElaborationTabletHeart, BasicElaborationTabletNoaccess, BasicElaborationTabletNote, BasicElaborationTabletPencil, BasicElaborationTabletPicture, BasicElaborationTabletRefresh, BasicElaborationTabletSearch, BasicElaborationTodolist2, BasicElaborationTodolistCheck, BasicElaborationTodolistCloud, BasicElaborationTodolistDownload, BasicElaborationTodolistFlagged, BasicElaborationTodolistMinus, BasicElaborationTodolistNoaccess, BasicElaborationTodolistPencil, BasicElaborationTodolistPlus, BasicElaborationTodolistRefresh, BasicElaborationTodolistRemove, BasicElaborationTodolistSearch, BasicElaborationTodolistStar, BasicElaborationTodolistUpload
}

private let LineaIcons = ["\u{e000}", "\u{e001}", "\u{e002}", "\u{e003}", "\u{e004}", "\u{e005}", "\u{e006}", "\u{e007}", "\u{e008}", "\u{e009}", "\u{e00a}", "\u{e00b}", "\u{e00c}", "\u{e00d}", "\u{e00e}", "\u{e00f}", "\u{e010}", "\u{e011}", "\u{e012}", "\u{e013}", "\u{e014}", "\u{e015}", "\u{e016}", "\u{e017}", "\u{e018}", "\u{e019}", "\u{e01a}", "\u{e01b}", "\u{e01c}", "\u{e01d}", "\u{e01e}", "\u{e01f}", "\u{e020}", "\u{e021}", "\u{e022}", "\u{e023}", "\u{e024}", "\u{e025}", "\u{e026}", "\u{e027}", "\u{e028}", "\u{e029}", "\u{e02a}", "\u{e02b}", "\u{e02c}", "\u{e02d}", "\u{e02e}", "\u{e02f}", "\u{e030}", "\u{e031}", "\u{e032}", "\u{e033}", "\u{e034}", "\u{e035}", "\u{e036}", "\u{e037}", "\u{e038}", "\u{e039}", "\u{e03a}", "\u{e03b}", "\u{e03c}", "\u{e03d}", "\u{e03e}", "\u{e03f}", "\u{e040}", "\u{e041}", "\u{e042}", "\u{e043}", "\u{e044}", "\u{e045}", "\u{e046}", "\u{e047}", "\u{e048}", "\u{e049}", "\u{e04a}", "\u{e04b}", "\u{e04c}", "\u{e04d}", "\u{e04e}", "\u{e04f}", "\u{e050}", "\u{e051}", "\u{e052}", "\u{e053}", "\u{e054}", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "`", "{", "|", "}", "~", "\\", "\u{e000}", "\u{e001}", "\u{e002}", "\u{e003}", "\u{e004}", "\u{e005}", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "`", "{", "|", "}", "~", "\\", "\u{e000}", "\u{e001}", "\u{e002}", "\u{e003}", "\u{e004}", "\u{e005}", "\u{e006}", "\u{e007}", "\u{e008}", "\u{e009}", "\u{e00a}", "\u{e00b}", "\u{e00c}", "\u{e00d}", "\u{e00e}", "\u{e00f}", "\u{e010}", "\u{e011}", "\u{e012}", "\u{e013}", "\u{e014}", "\u{e015}", "\u{e016}", "\u{e017}", "\u{e018}", "\u{e019}", "\u{e01a}", "\u{e01b}", "\u{e01c}", "\u{e01d}", "\u{e01e}", "\u{e01f}", "\u{e020}", "\u{e021}", "\u{e022}", "\u{e023}", "\u{e024}", "\u{e025}", "\u{e026}", "\u{e027}", "\u{e028}", "\u{e000}", "\u{e001}", "\u{e002}", "\u{e003}", "\u{e004}", "\u{e005}", "\u{e006}", "\u{e007}", "\u{e008}", "\u{e009}", "\u{e00a}", "\u{e00b}", "\u{e00c}", "\u{e00d}", "\u{e00e}", "\u{e00f}", "\u{e010}", "\u{e011}", "\u{e012}", "\u{e013}", "\u{e014}", "\u{e015}", "\u{e016}", "\u{e017}", "\u{e018}", "\u{e019}", "\u{e01a}", "\u{e01b}", "\u{e01c}", "\u{e01d}", "\u{e01e}", "\u{e01f}", "\u{e020}", "\u{e021}", "\u{e022}", "\u{e023}", "\u{e024}", "\u{e025}", "\u{e026}", "\u{e027}", "\u{e028}", "\u{e029}", "\u{e02a}", "\u{e02b}", "\u{e02c}", "\u{e02d}", "\u{e02e}", "\u{e02f}", "\u{e030}", "\u{e031}", "\u{e032}", "\u{e033}", "\u{e034}", "\u{e035}", "\u{e036}", "\u{e037}", "\u{e038}", "\u{e039}", "\u{e03a}", "\u{e03b}", "\u{e03c}", "\u{e03d}", "\u{e03e}", "\u{e03f}", "\u{e040}", "\u{e041}", "\u{e042}", "\u{e043}", "\u{e044}", "\u{e045}", "\u{e046}", "\u{e047}", "\u{e048}", "\u{e049}", "\u{e04a}", "\u{e04b}", "\u{e04c}", "\u{e04d}", "\u{e04e}", "\u{e04f}", "\u{e050}", "\u{e051}", "\u{e052}", "\u{e053}", "\u{e054}", "\u{e055}", "\u{e056}", "\u{e057}", "\u{e058}", "\u{e059}", "\u{e05a}", "\u{e05b}", "\u{e05c}", "\u{e05d}", "\u{e05e}", "\u{e05f}", "\u{e060}", "\u{e061}", "\u{e062}", "\u{e063}", "\u{e064}", "\u{e065}", "\u{e066}", "\u{e067}", "\u{e068}", "\u{e069}", "\u{e06a}", "\u{e06b}", "\u{e06c}", "\u{e06d}", "\u{e06e}", "\u{e06f}", "\u{e070}", "\u{e071}", "\u{e072}", "\u{e073}", "\u{e074}", "\u{e075}", "\u{e076}", "\u{e077}", "\u{e078}", "\u{e079}", "\u{e07a}", "\u{e07b}", "\u{e07c}", "\u{e07d}", "\u{e07e}", "\u{e07f}", "\u{e080}", "\u{e081}", "\u{e082}", "\u{e083}", "\u{e084}", "\u{e085}", "\u{e086}", "\u{e087}", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "`", "{", "|", "}", "~", "\\", "\u{e000}", "\u{e001}", "\u{e002}", "\u{e003}", "\u{e004}", "\u{e005}", "\u{e006}", "\u{e007}", "\u{e008}", "\u{e009}", "\u{e00a}", "\u{e00b}", "\u{e00c}", "\u{e00d}", "\u{e00e}", "\u{e00f}", "\u{e010}", "\u{e011}", "\u{e012}", "\u{e013}", "\u{e014}", "\u{e015}", "\u{e016}", "\u{e017}", "\u{e018}", "\u{e019}", "\u{e01a}", "\u{e01b}", "\u{e01c}", "\u{e01d}", "\u{e01e}", "\u{e01f}", "\u{e020}", "\u{e021}", "\u{e022}", "\u{e023}", "\u{e024}", "\u{e025}", "\u{e026}", "\u{e027}", "\u{e028}", "\u{e029}", "\u{e02a}", "\u{e02b}", "\u{e02c}", "\u{e02d}", "\u{e02e}", "\u{e02f}", "\u{e030}", "\u{e031}", "\u{e032}"]

private let LineaFonts = ["linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-weather-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-music-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-ecommerce-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-software-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-basic-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-arrows-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", "linea-basic-elaboration-10", ]

