# TwitterClient

<img src="https://user-images.githubusercontent.com/19505152/29786496-a8398cbe-8c2b-11e7-8680-e28d5b976ba2.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786493-a806c91e-8c2b-11e7-8e8a-ea15f5de0602.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786492-a802a776-8c2b-11e7-8e64-9143a0284327.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786494-a82106b2-8c2b-11e7-9371-227474337c67.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786500-a95a8904-8c2b-11e7-8226-06cc5737967d.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786495-a822f242-8c2b-11e7-8f2e-3a78dcca429f.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/29786498-a8677dfe-8c2b-11e7-9ad3-3e0d9c32da6d.png" width="200">


# Features
- Splash Screen check if there's saved user credential then open user's followers directly, otherwise open Login screen.
- Using TwitterKit SDK user can view it's followers with Pull to Refresh and Infinite Scrolling and cache followers for offline use.
- Follower profile show follower information and latest 10 tweets with sticky header
- open profile image and background image in overlay view
- localization

# Architecture Design Pattern
- MVP (Model-View-Presenter)

# Third party libraries
1. [TwitterKit](https://dev.twitter.com/twitterkit/ios/overview)
2. [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
  - Parse data to JSON and wraps the result of the Alamofire JSON response handler.
   
3. [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
  - Mapping JSON or string JSON to objects and Nested Object.
  - ObjectMapper could generate Realm models and simple Alamofire extension that uses ObjectMapper to automatically map JSON response data     to Swift objects.
   
4. [Kingfisher](https://github.com/onevcat/Kingfisher)
   - Could download images from url asynchronous and caching for UIImageView or UIButton.
   - Cancel downloading and process tasks.

5. [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)
   - Has wide collection of loading Indicators with awesome animations.
   
6. [RKParallaxEffect](https://github.com/RahulKatariya/RKParallaxEffect)
   - Create a parallax effect on TableHeaderView with Full Screen option that view the full image.

7. [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll)
   - Easy for implementation and use Swizzling.
   - provide a handler block and could use it with table view, collection view and scroll view.

8. [SKPhotoBrowser](https://github.com/suzuki-0000/SKPhotoBrowser)
   - Display one or array of images by providing either UIImage objects, or string of URL array.
   - Handling and caching photos from web, Landscape handling.
   - Swipe up/down to dismiss with animation and have download option.
   
9. [TKSubmitTransition](https://github.com/entotsu/TKSubmitTransition)
   - You can find the “Sign in” button rolling and after that, next UIViewController will fade-in.

