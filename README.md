
## Badges
[![GitHub](https://img.shields.io/badge/GitHub-gray.svg)](https://docs.github.com/en/rest?apiVersion=2022-11-28) [![iOS](https://img.shields.io/badge/iOS-white.svg)](https://developer.apple.com)   [![Swift](https://img.shields.io/badge/swift-orange.svg)](https://developer.apple.com/documentation/swift/) [![SwiftData](https://img.shields.io/badge/swiftData-blue.svg)](https://developer.apple.com/xcode/swiftdata/)
[![UITest](https://img.shields.io/badge/UITest-yellow.svg)](https://developer.apple.com/documentation/xctest/user-interface-tests)
[![UnitTest](https://img.shields.io/badge/UnitTests-red.svg)](https://developer.apple.com/documentation/xctest)


# TheCatPokedex

iOS App using CatApi service to search the cat you love, learn more about cats and save your favorites breeds to check later.


## Installation
To keep your API key secure and separate from your code, you can store it in an .xcconfig file.
First create a *.xcconfig file where you are gonna put your api key.
*Plain Text* (Dont rename `API_KEY` text cause we need to read from the info.plist)

`API_KEY = API_KEY_RIGHT_HERE `

Just plain text dont handle it like a string or something. After that double check on your project -> info -> configurations -> debug / release , setup your *.xcconfig file there and thats it you are ready to roll. 
## Demo

|HomeCatView Demo(Pagination)| DetailsCatVIew | Add favorite cat flow|
|---------|---------|-----------|
|![HomeCatView](https://github.com/user-attachments/assets/d310c115-3d68-419e-8e17-f917b2c35096)|  ![DetailsCatView](https://github.com/user-attachments/assets/f750c4a5-3b79-4e6c-bf88-37d2a64d26f5) | ![FavoriteCatFlow](https://github.com/user-attachments/assets/6d87fdcb-ba7b-4125-bee4-b6dc8ca48bf8) |



## Features

- Save and Remove Favorite cat using SwiftData
- Check Cat details
- Open webView to check more information about the cat
- Searchable view to filter cats


## Tech Stack

**Client:** Swift, SwiftUI, SwiftData, iOS18

**Server:** APIRestful


## Lessons Learned

- Improve UITests

## Running Tests

To run tests, You can do it manually using Xcode or you can install fastlane using `brew install fastlane`  and then run `fastlane ios unit_tests` or `fastlane ios ui_tests` in your terminal. You need to have an iphone 16 simulator or you can change the simulator name in fastfile. We are using iOS 18 to develop this app.

## Documentation

[API Documentation (TheCatApi)](https://thecatapi.com)

