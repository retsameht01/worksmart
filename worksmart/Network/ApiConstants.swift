//
//  ApiConstants.swift
//  worksmart
//
//  Created by Tin Le on 9/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation

struct ApiConstants {
    static let WEATHER_API_URL = "https://api.openweathermap.org/data/2.5/weather?"
    static let CITY_KEY = "q"
    static let APP_ID_KEY = "appid"
    //static let GPOS_API_REGISTER = "https://gposwebapi.azurewebsites.net/users/register"
    //static let GPOS_API_LOGIN = "https://gposwebapi.azurewebsites.net/users/authenticate"
    static let GPOS_API_NEW = "https://api.gposdev.com"
    static let GPOS_GETPROVIDER_INFO = "https://gposwebapi.azurewebsites.net/20002/api/providers/%%?start=1/1/2020&end=3/1/2020"
    
    //OLD API
    static let USERNAME = "admin"
    static let PASSWORD = "6786716888"
    static let RESTAURANT_TEST_API = "30002"
    static let SALON_TEST_API = "30002"
    static let GPOS_API_CORE_BASE = "https://www.gposdev.com/"
    //New api url
    
    static let GPOS_API_RESTAURANT_TEST_GET_PRODUCT_CATEGORIES = "https://api.gposdev.com/30001/api/Categories"
    static let GPOS_API_BASE_API = "https://api.gposdev.com/%@/api/%@"
    static let GPOS_API_LOGIN_NEW  = "https://api.gposdev.com/Users/authenticate"
    static let GPOS_API_REGISTER_NEW = "https://api.gposdev.com/Users/register"
    static let GPOS_API_REFRESH_TOKEN = "https://api.gposdev.com/Users/refreshToken"
    static let GPOS_API_USERS = "https://api.gposdevcom/Users"
    
    //use https://www.gposdev.com/30002/Help
    
    static let AUTHORIZE_TEST_API = "https://apitest.authorize.net/xml/v1/request.api"
    static let AUTHORIZE_MERCHANT_ID = "5Q5bffU7d6k"
    static let AUTHORIZE_TRANS_KEY = "3VL8Be9yEd2ZW27B"
    static let AUTHORIZE_TRANS_TYPE = "authCaptureTransaction"
}
