//
//  Model_API.swift
//  FetchData
//
//  Created by Sakkaphong Luaengvilai on 12/1/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

class Model_API: NSObject {
    
    static var sharedInstance = Model_API()
    
    private let Fetch : FetchDataDelegate = FetchModel()
    
    public var Cahce_Image:NSCache = NSCache<NSString , UIImage>()
    
    func Fetch_Image(Image_URL : String , completion:@escaping (UIImage)->())
    {
        
        if let image = Cahce_Image.object(forKey: NSString(string: Image_URL))
        {
            return completion(image)
        }
        else
        {
            
            self.Fetch.FetchData(url: Image_URL , UseCacheIfHave: true) { (data) in
                
                guard let data = data , let image = UIImage(data: data) else { return }
                
                self.Cahce_Image.setObject(image, forKey: NSString(string: Image_URL))
                
                OperationQueue.main.addOperation { return completion(image) }
                
            }
            
        }
        
    }
    
}

