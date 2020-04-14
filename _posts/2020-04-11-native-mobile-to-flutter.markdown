---
layout: post
title: "Looking Back on Our Migration from Native Mobile to Flutter."
date: 2020-04-11
categories: [mobile, flutter]
author: Bobby Manuel 
---

Over the last six months, the mobile team has been busy rewriting our native mobile apps into a shiny new cross-platform Flutter App!  The app has been live in production since February and we were excited to share the incredible gains we achieved.

### The results are in!

- 2 - 3x improvement in development velocity after the switch.  Developing in flutter for both platforms has turned out to be faster than developing for either one of the native platforms. 
- 98% shared code across both platforms.
- Reduction from 140,000 lines of code to 31,000 lines of code.  This is despite launching with a brand new online/offline content system that did not exist in the native apps.
- The application polish and user experience is on par with our native iOS application and superior to our native android application.
- Most importantly, we experienced very few unexpected bugs or unpredictable behavior during our launch.

### How long did this take? 

- Project spanned Aug 2019 - Dec 2019 
- Initial release to Android users in February 2020.
- Release to all users Android + iOS March 2020.

### What problems were we hoping to solve?

We had two working native mobile applications, but lacked feature parity for Android and iOS users.

Android and iOS development took place at different paces, with varying quality and cost.

Maintaining redundancy across two mobile teams required us to maintain a minimum of four to six developers rather than as few as two to three in a cross platform environment.

_Our key objectives were..._

- feature parity on both platforms.
- a unified mobile team with higher quality peer reviews. 
- increased velocity and reduced cost per feature. 
- higher quality software. 
- scalability and redundancy of our mobile team.

This finally seemed possible as the cross-platform mobile space has matured dramatically over the last two years: there were two great options to choose from, _Flutter_ and _React Native_.


### Why did we choose Flutter? 

The biggest challenge we faced was the timeline within which we had to complete the switch: 5 months.  Our native apps had 140,000 lines of code between the two platforms, so we needed to factor in development speed.

_Regardless of our choice our entire team would have to..._

1. learn a new programming language
2. learn a new UI framework
3. add sufficient test coverage to confidently launch the application
4. delivery a highly secure application. 

#### Things we liked about React:

- Maturity and community size: React Native has been in production for much longer.
- Testing utilities are definitely better on React.
- More third party library support.

#### Things we liked about Flutter:

- Without javascript developers on our mobile team, the learning curve for Dart/Flutter was substantially lower than Javascript/React Native. 
- Flutter offered clean, straight-forward conventions that were easy to learn, expressive and explicit.
- Android Studio offered a turnkey development environment with performance monitoring tools, hot reload and step through debugging and inspection.  Since most of our developers are Android developers, the IDE was an added bonus due to its familiarity.
- Flutter does not rely on any native UI components, so it's largely immune to breaking changes introduced by Apple, Google, or Android device manufacturers.

### How much native code did we end up writing on both iOS and Android? 

Flutter promises a very high percentage of shared cross-platform code across the platforms, but we still had to write some native code. 

Flutter offers a very simple message passing api for communicating with native code.  We needed to use native integrations for the following relatively small group of features: 

- Push notification.
- Deep link handling.
- Connectivity detection.
- Security features.
- Device information. 

_This platform specific code amounted to less than 2% of our total lines of code._ 

We were able to write this functionality easily and communicate between Flutter and native with very little interface overhead. Flutter provides a [very simple api](https://flutter.dev/docs/development/platform-integration/platform-channels#architecture) for communicating bidirectionally between native and dart code.

### How was the learning curve?

Dart/Flutter is definitely the easiest language and framework I've ever learned.  Within two weeks most of our engineers were up to speed and highly productive.  Everyone w

### Continuous integration.

We opted for CodeMagic as our CI service.  It was the only commercial service we found that had specialized flutter workflows that required no additional scrpting or configuration.  We were able to integrate our git workflow with CodeMagic in under an hour.

### How secure is Flutter out of the box? 

We hired an external penetration testing firm to do a security analysis on our application when we were done.  The penetration tests found no vulnerabilities in our Flutter application.

### Challenges?

We really wanted to add a challenges section to this article to give it a little balance but no one on the mobile team could identify anything that was particularly challenging.  We'll keep an eye out for gnarly bugs moving forward and will write followups when we finally encounter a good challenge to document. 

### In Review ...

The project's success exceeded expectations.  In addition to hitting our timelines, we turned a lot of heads.  Our initially skeptical native mobile developers, myself included, became stalwart champions of the platform. 

- 2 to 3x increase in development speed. 
- 98% shared code across iOS and Android platforms.
- No troubles with either Apple or Play store deployment.
- Reduction from 140,000 lines of code to 31,000 lines of code.
- The application looked as good or better than the native apps had. 


### Questions or suggestions?

Email us at <a href="mailto:engineering-blog@ginger.io">engineering-blog@ginger.io</a>
