//
//  UILoginTestUITests.swift
//  UILoginTestUITests
//
//  Created by 冯哲宁 on 12/3/22.
//

import XCTest

class UILoginTestUITests: XCTestCase {
    func testLoginSuccess() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let email = app.textFields["Email"]
        XCTAssertTrue(email.exists)
        email.tap()
        email.typeText("test@test.com")
        
        let password = app.secureTextFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText("test")
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let loggedInLabel = app.staticTexts["You are logged in"]
        XCTAssertTrue(loggedInLabel.exists)
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoginFailurePassword() throws {
        let app = XCUIApplication()
        app.launch()
        
        let email = app.textFields["Email"]
        XCTAssertTrue(email.exists)
        email.tap()
        email.typeText("test@test.com")
        
        let password = app.secureTextFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText("wrongpassword")
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let loggedInLabel = app.staticTexts["You are logged in"]
        XCTAssertFalse(loggedInLabel.exists)
    }
    
    func testLoginFailureEmail() throws {
        let app = XCUIApplication()
        app.launch()
        
        let email = app.textFields["Email"]
        XCTAssertTrue(email.exists)
        email.tap()
        email.typeText("feng@test.com")
        
        let password = app.secureTextFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText("test")
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let loggedInLabel = app.staticTexts["You are logged in"]
        XCTAssertFalse(loggedInLabel.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
