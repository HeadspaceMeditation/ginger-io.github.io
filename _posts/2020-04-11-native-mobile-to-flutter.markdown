---
layout: post
title: "Migrating from Native Mobile to Flutter."
date: 2020-04-11
categories: [mobile, flutter]
author: Bobby Manuel 
---

Over the last six months, the Ginger mobile team has been busy rewriting our native iOS and Android mobile apps into a shiny new cross-platform Flutter App!  The app has been live in production since February and we are excited to share the incredible gains we have achieved.

![Ginger screenshots](/assets/images/ginger_home_screenshots.png)

### The results are in!

- 2 - 3x improvement in development velocity after the switch.
- 98% shared code across both platforms.
- Reduction from 140,000 lines of code to 31,000 lines of code.  This is despite launching with a brand new online/offline content system that did not exist in the native apps.
- The application polish and user experience is on par with our native iOS application and easily superior to our native android application.
- Most importantly, we experienced no Flutter related bugs or unpredictable behaviors after the launch.

### How long did this take? 

- Project spanned 5 months: Aug to Dec 2019 
- Beta release to Android users in February 2020.
- Release to all users Android + iOS March 2020.

### What problems were we hoping to solve?

We are too small to have dedicated native iOS and Android apps.  Maintaining redundancy across two mobile teams would have required us to maintain four to six developers rather than as few as two to three in a cross platform environment.

The organizational complexity of maintaining iOS and Android teams created inefficiencies from engineering all the way up to marketing.  We hypothesized that having a single team and product would reduce the social complexity within our team, allowing us to move faster and have a more unified product experience.

Finally, Our legacy native apps had accumulated years of technical debt; we were ready for a full rewrite.

_Our key objectives were..._

- to have one product rather than two (feature parity).
- to simplify product communication within the team and externally. 
- to unify the mobile team. 
- to reduce the cost and time of each feature we ship. 
- to improve the scalability and redundancy within our mobile team.
- to increase the overall software quality of the product. 

This finally seemed possible as the cross-platform mobile space dramatically matured over the last two years: there were two great options to choose from, _Flutter_ and _React Native_.


### Why did we end up choosing Flutter? 

The biggest challenge we faced was the timeline within which we had to complete the switch: just 5 short months.  Our native apps had 140,000 lines of code between the two platforms, so we needed to factor in both the learning curve and development speed.

_Regardless of our choice our entire team would have to..._

1. learn a new programming language and UI framework
3. add sufficient test coverage to confidently launch the application
4. deliver a highly secure application. 

At the end of the day, the developers called it.  Flutter felt much more approachable and less like a web platform than React Native.

#### Things we liked about React:

- Maturity and community size: React Native has been in production for much longer.
- Testing utilities are definitely better on React.
- More third party library support.

#### Things we liked about Flutter:

- Without javascript developers on our mobile team, the learning curve for Dart/Flutter was substantially lower than Javascript/React Native. 
- Flutter offered clean, straight-forward conventions that were easy to learn, expressive and explicit.
- Android Studio offered a turnkey development environment with performance monitoring tools, hot reload and step through debugging and inspection.  Since most of our developers are Android developers, the IDE was an added bonus due to its familiarity.
- Flutter does not rely on any native UI components, so it's largely immune to breaking changes introduced by Apple, Google, or Android device manufacturers.
- For the same reason, the number of Android vendor specific bugs decreases.  Flutter UI is completely vendor proof.  When using native components in the UI (like Android native or React), the underlying component can be modified by a particular hardware vendor to express different behaviors, thus creating vendor specific bugs.

### How much native code did we end up writing on both iOS and Android? 

Flutter promises a very high percentage of shared cross-platform code across the platforms, but we still had to write some native code. 

Flutter offers a very simple message passing API for communicating with native code.  We needed to use native integrations for the following relatively small group of features: 

- Push notification.
- Deep link handling.
- Connectivity detection.
- Security features.
- Device information. 

_This platform specific code amounted to less than 2% of our total lines of code._ 

We were able to write this functionality easily and communicate between Flutter and native with very little interface overhead. Flutter provides a [very simple api](https://flutter.dev/docs/development/platform-integration/platform-channels#architecture) for communicating bidirectionally between native and dart code.

### How was the learning curve?

Dart/Flutter is definitely the easiest (of many) languages and UI frameworks I've ever learned.  Within two weeks most of our engineers were up to speed and highly productive. 

### How secure is Flutter out of the box? 

After completing our application, we hired an external security group to do an analysis on our application.  The analysis tests found no client side vulnerabilities.  The short answer is that **Flutter is secure out of the box**.  

We didn't do that much to secure the app prior to the security test other than using an encrypted SQLite database and an excellent little plugin called [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) which allowed us to write keys to the iOS Keychain or to Android Keystore.  We made sure that no data was persisted on the device in any location other than these two locations.  Aside from that, we mostly let the flutter and dart libraries do their thing. 

All in all this was a pretty surprising result for us; we had initially expected to spend considerable time on a security deep dive after we were code complete.  So, imagine our surprise.

### Challenges?

The ecosystem of third party libraries for Flutter is relatively immature.  We had to fork a couple of plugins and sometimes roll our own libraries that we would not have had to do in native or React.

_Some examples:_

- The most widely used SQLite library is SQFLite, but it did not offer encryption.  We forked the branch and plugged in native encrypted SQLite binaries as dependencies while modifying calls from the SQFLite library to underlying native API calls so that they included the encryption password.
- When we first developed our application, the webview libraries were subpar.  Webviews require the native webview to be rendered within a positioned frame that overlays the flutter renderer's view.  Additionally, the webview is itself a singleton, meaning only 1 webview can be utilized at any given time.  We forked the most stable webview plugin library, making minor changes to allow the functionality we needed; however, I can foresee a time where we might need to write our own library for interacting with native webviews.
- Pubnub messaging library.  Pubnub didn't offer a flutter/dart library at the time we developed our application, so we wrote a pure Dart implementation of the library. Thankfully, Dart makes it incredibly simple to build libraries like this.  Since that time, pubnub has published a flutter plugin which offers a dart interface to the native libraries, but we're pretty happy with our pure DART library, so we're sticking with it.

### In Review ...

The project's success exceeded expectations.  In addition to hitting our timelines, we turned a lot of heads.  Our initially skeptical native mobile developers, myself included, became stalwart champions of the platform. 

- 2 to 3x increase in development speed. 
- 98% shared code across iOS and Android platforms.
- No troubles with either Apple or Play store deployment.
- Reduction from 140,000 lines of code to 31,000 lines of code.
- The application looked as good or better than the native apps had. 


### Questions or suggestions?

Email us at <a href="mailto:engineering-blog@ginger.io">engineering-blog@ginger.io</a>
