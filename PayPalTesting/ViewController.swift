//
//  ViewController.swift
//  PayPalTesting
//
//  Created by Haider Khan on 5/31/20.
//  Copyright © 2020 zkhaider. All rights reserved.
//

import UIKit
import PayPalPartnerAuth
//import PayPalCheckout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let config = Config(
//            clientID: "",
//            payToken: "",
//            universalLink: "",
//            uriScheme: "",
//            onApprove: { },
//            onCancel: { },
//            onError: { _ in },
//            environment: .sandbox
//        )
//        Checkout.set(config: config)
        
        if let builder = PFAuthClientConfigBuilder(
            clientId: "<client_id>",
            redirectURL: "<redirect_uri>",
            scopes: []
            ) {
            builder.setCurrentEnvironment(.live)
            if let authConfig = PFAuthClientConfig(builder: builder) {
                let authenticator = PFAuthenticator(config: authConfig)
                authenticator?.authenticateForAccessToken(with: self, presenting: self)
            }
        }
    }
}

extension ViewController: PFAuthenticationDelegate {
    
    func getTrackingId() -> String! {
        return "some_id"
    }
    
    func onAuthenticationStarted(_ authUnivLinkHandler: PFAuthUnivLinkHandler!) {
        print("")
    }
    
}

