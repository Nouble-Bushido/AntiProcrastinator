//
//  LaunchManagerTests.swift
//  AntiProcrastinatorTests
//
//  Created by Артем Чжен on 27.06.2024.
//

import XCTest
@testable import AntiProcrastinator

final class LaunchManagerTests: XCTestCase {
    private var userDefaults: UserDefaultsMock!

    override func setUpWithError() throws {
        userDefaults = UserDefaultsMock()
    }

    override func tearDownWithError() throws {
        userDefaults = nil
    }

    func testIsFirstLaunch_WhenStartApp_ReturnTrue() throws {
        //Given
        let launchManager = LaunchManager(userDefaults: userDefaults)
        
        //When
        let isFirstLaunch = launchManager.isFirstLaunch
        
        //Then
        XCTAssertTrue(isFirstLaunch, "is not true")
    }
    
    func testIsFirstLaunch_AfterSecondsStartApp_ReturnFalse() throws {
        //Given
        let launchManger = LaunchManager(userDefaults: userDefaults)
        
        launchManger.didFinishLaunchingWithOptions()
        
        //When
        let isFirstLaunch = launchManger.isFirstLaunch
        
        //Then
        XCTAssertFalse(isFirstLaunch, "is not false")
    }

    func testDidFinishLaunchingWithOptionsCountOne() throws {
          // Given
          let launchManager = LaunchManager(userDefaults: userDefaults)
          
          // When
          launchManager.didFinishLaunchingWithOptions()
          let launchCount = userDefaults.integer(forKey: "launchmanager_key")
          
          // Then
          XCTAssertEqual(launchCount, 1, "no 1")
      }
      
      func testDidFinishLaunchingWithOptionsCountTwo() throws {
          // Given
          let launchManager = LaunchManager(userDefaults: userDefaults)
          
          // When
          launchManager.didFinishLaunchingWithOptions()
          launchManager.didFinishLaunchingWithOptions()
          let launchCount = userDefaults.integer(forKey: "launchmanager_key")
          
          // Then
          XCTAssertEqual(launchCount, 2, "no 2")
      }
}
