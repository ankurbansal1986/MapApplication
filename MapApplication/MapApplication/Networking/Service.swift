

import UIKit
import Foundation

enum AlertType : Int{
    case toast = 0
    case popUp = 1
}

class Service: NSObject {
    
    private var isAccessToken: Bool = false
    private var deviceType: String?
    private var language: String?
    private var appVersion: String?
    private var deviceID: String?
    private var deviceName: String?
    private var deviceModel: String?
    private var authorizationToken: String?
    private var newAuthorizationToken: String?
    private var strIsAccessToken: String?
    
    typealias successBlock =  (Data?) -> Void
    typealias failureBlock =  (Error? ) -> Void
    typealias boolSuccessBlock = (_ result: Bool) -> Void
    
    public func makeHTTPRequest(path: String, isBackground:Bool = false, alertType:AlertType = .toast ,httpRequestMethod: String,extraHeaders:[String:String]? ,body: [String: Any]?, success: @escaping successBlock, failure: @escaping failureBlock) -> URLSessionDataTask? {
       
        
        //debugPrint("API URL: \(path)")
        //debugPrint("requestBody: ",body ?? "")
        guard let url = URL(string: path) else {
            //debugPrint("Error: cannot create URL")
            failure(nil)
            return nil
        }
        
        let urlRequest: URLRequest = self.request(url, httpRequestMethod, extraHeaders : extraHeaders, body)
        
        ///-->
      
       
        let session = scSharedUrlSession
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {data, response, error -> Void in
           // response.header
            // server may conver header to all non caps or not be so checking both forms
           

           
            // check for any errors
            OperationQueue.main.addOperation {
                guard error == nil else {
                  
                   // debugPrint(error!.localizedDescription)
                    if(!isBackground){
                        if let nserror = error as NSError?{
                            if(nserror.code != NSURLErrorCancelled){
                               
                            }
                        }
                        
                       
                    }
                    failure(error!)
                    return
                }
                
                // make sure we got data
                guard let responseData = data else {
                    //debugPrint("Error: did not receive data")
                    failure( error!)
                    return
                }
                success(responseData)
                
                
                // parse the result as JSON, since that's what the API provides
//                do {
//                    guard let json = try JSONDecoder().decode(type, from: responseData)else{
//                         failure(nil)
//                    }
//                     print("Response Data -- \(json)")
//                    success(json)
////                    guard let json = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [String: Any] else {
////                      //  debugPrint("error trying to convert data to JSON")
////                        failure(nil)
////                        return
////                    }
//                    print("Response Data -- \(json)")
//
//
//
//                    success( json)
//
//                } catch  {
//                    //debugPrint("Eror in JSONSerialization :- %@", error)
//                    failure(error)
//                    return
//                }
            }
        })
        
        dataTask.resume()
        return dataTask
    }
    
    
    
    
    
    func setHeaderFieldsValues( request: URLRequest, extraHeaders: [String:String]?)-> URLRequest {
        var request = request
      
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
//        request.setValue(kHeaderValues.authorization ?? "Basic", forHTTPHeaderField: "Authorization")
//
//        request.setValue(kHeaderValues.deviceId, forHTTPHeaderField: "DeviceId")
//        request.setValue(kHeaderValues.deviceModel, forHTTPHeaderField: "DeviceModel")
//        request.setValue(kHeaderValues.deviceName, forHTTPHeaderField: "DeviceName")
//        request.setValue(kHeaderValues.deviceType, forHTTPHeaderField: "DeviceType")
//        request.setValue(kCommonObjects.selectedLanguage.rawValue, forHTTPHeaderField: "Language")
//
//        request.setValue(kHeaderValues.appVersion, forHTTPHeaderField: "AppVersion")
//       // request.setValue(kHeaderValues.pushToken, forHTTPHeaderField: "PushToken")
//        request.setValue(kHeaderValues.apiVersion, forHTTPHeaderField: "ApiVersion")
//       // request.setValue(kHeaderValues.isPassword, forHTTPHeaderField: "IsPassword")
//        request.setValue(kHeaderValues.deviceOs, forHTTPHeaderField: "DeviceOs")
//        request.setValue("Basic U0hPUlRTLVRWOlNIT1JUUy1UVg==", forHTTPHeaderField: "X-API-AUTH")
       
        if extraHeaders != nil {
            for (key, value) in extraHeaders! {
               
                   request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
        
     
    }
    
    func request(_ url: URL, _ httpRequestMethod: String,extraHeaders : [String:String]? , _ body: [String: Any]?) -> URLRequest {
        
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpRequestMethod
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30;
        urlRequest = setHeaderFieldsValues(request: urlRequest, extraHeaders: extraHeaders)
        //if (httpRequestMethod == "POST" || httpRequestMethod == "PUT") {
        var jsonBody = Data()
        if body != nil {
            if(JSONSerialization.isValidJSONObject(body!)) {
                do {
                    
                    jsonBody = try JSONSerialization.data(withJSONObject: body!, options: JSONSerialization.WritingOptions.prettyPrinted)
                    urlRequest.httpBody = jsonBody
                    
                    //let dataString:String = String(data: jsonBody, encoding: .utf8)! //or String.Encoding.utf8
                    //debugPrint("Request Data: \(String(describing: dataString))")
                } catch {
                   // debugPrint("InvalidJSON - JSON Processing Failed")
                }
            }
            else {
                if let imageData = body?["imageData"] {
                    urlRequest.httpBody = imageData as? Data
                    urlRequest.timeoutInterval = 60;
                }
               // debugPrint("NOT Valid JSON /  Sent image as Data")
            }
        }
        //}
        //debugPrint("Request Headers: \(String(describing: urlRequest.allHTTPHeaderFields))")
        
        return urlRequest
    }
}
