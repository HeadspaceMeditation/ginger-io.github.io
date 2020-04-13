---
layout: post
title: "Looking Back on Our Migration from Native Mobile to Flutter."
date: 2020-04-11
categories: [mobile, flutter]
author: Bobby Manuel 
---

### Timeline of the project.

- Project spanned Aug 2019 - Dec 2019 
- Initial release to Android users in February 2020.
- Release to all users Android + iOS March 2020.
- As of the time of this article we've been live across all of our users for about a month with no Flutter related issues.


### Why did we do it?

We had two working native mobile applications, but lacked feature parity for Android and iOS users.

Android and iOS development took place at different paces, with varying quality and cost.

Maintaining redundancy across two mobile teams required us to maintain a minimum of four developers on mobile rather than as few as two in a cross platform environment.

### We wanted to achieve...

- feature parity on both platforms.
- a unified mobile team with higher quality peer reviews. 
- increased velocity and reduced cost per feature. 
- higher quality software. 
- scalability and redundancy of our mobile team.

This seemed possible as the cross-platform mobile space has matured over the last year: there were two great options to choose from, _Flutter_ and _React Native_.

### Why did we choose Flutter? 

The biggest challenge we faced was the timeline within which we had to complete the switch: 5 months.  Our native apps had 140,000 lines of code between the two platforms, so we needed to factor in development speed.

_Regardless of our choice our entire team would have to..._

1. learn a new programming language
2. learn a new UI framework
3. add sufficient test coverage to confidently launch the application
4. delivery a highly secure application. 

Although React Native is a clear winner for a javascript-centric development team, our mobile engineers are not javascript savvy.

#### Here was our decision criteria:

- Community size - _+1 React_
- Maturity - _+1 React_
- Learning curve. - _+1 Flutter_
- Complexity. - _+1 Flutter_
- Development speed. - _+1 Flutter_
- Tooling and IDE.  - _+1 Flutter_
- Testability. - _+1 React_ 
- Shared code - _+1 Flutter_
- Platform independence - _+1 Flutter_


#### Things we liked about React:

- Maturity and community size: React Native has been in production for much longer.
- Testing utilities are definitely better on React.
- More third party library support.

#### Things we liked about Flutter:

- Without javascript developers on our mobile team, the learning curve for Dart/Flutter was substantially lower than Javascript/React Native. 
- Flutter offered clean, straight-forward conventions that were easy to learn, expressive and explicit.
- Android Studio offered a turnkey development environment with performance monitoring tools, hot reload and step through debugging and inspection.  Since most of our developers are Android developers, the IDE was an added bonus due to its familiarity.
- Flutter does not rely on any native UI components, so it's largely immune to breaking changes introduced by Apple, Google, or Android device manufacturers.

### Choosing a State Management pattern that matched our needs.

There were several state management architectures to choose from, but we opted for simplicity, the [Scoped Model pattern](https://github.com/brianegan/scoped_model).  The scoped model pattern is a simple change notifier pattern bound to Flutter's UI widget hierarchy.  It has gradually been superceded in the community by the [Provider library](https://github.com/rrousselGit/provide) which is based on Scoped Model.  We will most likely be migrating to the provider library within the next year.

We use this pattern with our SQLite database to allow sql table subscriptions that trigger redraws on subscribed user interfaces when data is modified on disk.  We also use a very simple stream subscription pattern to propagate state changes that are not tied to database state.  Flutter provides the excellent [StreamBuilder class](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) to facilitate state propagation.

We evaluated a few other patterns mentioned in flutter resources, particularly Redux and BLoC, but chose the simplicity of Scoped Model over the granularity and associated complexity that the others presented.  

### Native integrations. 

Flutter offers a very simple message passing api for communicating with native code.  We needed to use native integrations for a relatively small group of features: 

- Push notification.
- Deep link handling.
- Connectivity detection.
- Security features.
- Device information. 

_This platform specific code amounted to less than 2% of our total lines of code._ 

We were able to write this functionality easily and communicate between Flutter and native with very little code overhead. Flutter provides a [very simple api](https://flutter.dev/docs/development/platform-integration/platform-channels#architecture) for communicating bidirectionally between native and dart code.

### Unit tests.

Unit testing in Flutter is straightforward, but lacks the robust testing utilities and third party libraries found in React.  We rolled most of our own testing scaffolding aside from the simple test runner offered by flutter.

### UI testing. 

UI testing in Flutter only runs in a simulator/emulator, a pretty significant drawback.  Though we were able to write effective widget tests, we found them to be brittle.  This is definitely an area that needs improvements in future iterations of Flutter.  We opted to keep the majority of presentation logic in view models so that we could test the presentation layer with unit tests wherever possible rather than employing widget tests.

### Continuous integration.

We opted for CodeMagic as our CI service.  It was the only commercial service we found that had specialized flutter workflows that required no additional scrpting or configuration.  We were able to integrate our git workflow with CodeMagic in under an hour.   

### Security.

We hired an external penetration testing firm to do a security analysis on our application when we were done.  The penetration tests found no vulnerabilities in our Flutter application.

### Review of Results.

- 2 - 3x improvement in development velocity after the switch.  Developing in flutter for both platforms has turned out to be faster than developing for either one of the native platforms. 
- 98% shared code across both platforms.
- Reduction from 140,000 lines of code to 31,000 lines of code.  This is despite launching with a brand new online/offline content system that did not exist in the native apps.
- The application polish and user experience is on par with our native iOS application and superior to our native android application.
- Most importantly, we experienced very few unexpected bugs or unpredictable behavior during our launch.

### Questions or suggestions?

Email us at <a href="mailto:engineering-blog@ginger.io">engineering-blog@ginger.io</a>
