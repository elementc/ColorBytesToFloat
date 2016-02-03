//  main.swift
//  ColorBytesToFloat
//
//  Created by Garces, Johann (TEKsystems) on 2/3/16.
//  Copyright © 2016 johannmg. All rights reserved.
//

import Foundation

print("Hello, World!")

extension String {
    var floatVal: Float {
        return (self as NSString).floatValue
    }
}

extension Float {
    var fff: String {
        return String(format: "%.3f", self)
    }
}



var response: String = ""
var kb = NSFileHandle.fileHandleWithStandardInput()
var inputData: NSData?
print ("q to quit")
print ("'trio' to set to triple RBG mode")

func runHexMode(){
    print ("running hex mode: input should be  <RRR,GGG,BBB> ")
    while response != "q" {
        inputData = kb.availableData
        let tempdirty = NSString(data: inputData!, encoding: NSUTF8StringEncoding) as! String
        response = tempdirty.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        let varArray:[String] = response.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " ,./"))
        print("UIColor(red: \((varArray[0].floatVal/255.0).fff), green: \((varArray[1].floatVal/255.0).fff), blue: \((varArray[2].floatVal/255.0).fff), alpha: 1.00)")
    }
    
    
}

while response != "q" {
    inputData = kb.availableData
    let tempdirty = NSString(data: inputData!, encoding: NSUTF8StringEncoding) as! String
    response = tempdirty.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    if (response == "trio"){
        runHexMode()
        break //i know this is a weird control flow, i'm mkaing this super dirty/fast
    }
    else {
        print ("\(response) => \(response.floatVal / 255.0)" )
    }
    
}

