<!-- # teams

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Video Calling App (jusTalk)

## Microsoft Engage

### Introduction

This app is integrated such that two persons are able to connect each other through video calling. 
This Android Video Calling Application was made as a project under Microsoft Engage Program. Flutter and Firebase are the main technologies used in the building of this application.

### Technology Stack

Programming languages: Dart

Toolkit : Android Studio

Database: Firebase

SDK: Flutter, Agora

### Dependencies

agora_rtc_engine: ^4.0.2

permission_handler: ^8.1.1

cloud_firestore: ^2.2.2

firebase_auth: ^1.4.1

google_sign_in: ^5.0.4

firebase_core: ^1.3.0

### Frontend Development

Flutter is an open-source Software Development Kit (SDK) used to develop high-performing Android and iOS applications with a single code base. It uses Dart Programming language. I chose flutter over native android because of its cross-platform support and the ability to build a highly customized and attractive app in less time. 

The most crucial part is, from a small button to padding or font, everything in Flutter is a widget. These widgets can be combined to form an amazing layout with beautiful UI/UX. There are inbuilt as well as customizable widgets which makes the building of the app faster. 

<img src="/assets/signIn.jpeg" height=500>

<img src="/assets/home_page.jpeg" height=500> 

<img src="/assets/profile_page.jpeg" height=500>

<img src="/assets/calling.jpeg" height=500> 
<!-- ![sign In](/assets/signIn.jpeg)
![home page](/assets/home_page.jpeg)
![profile](/assets/profile_page.jpeg)
![calling page screen](/assets/calling.jpeg) -->

### Backend Development

Firebase is used as the backend for this app. To connect Flutter with Firebase, FlutterFire has a set of plugins that can be used. I have used the Authentication and Cloud Storage services of Firebase. Cloud Firestore is a NoSQL database that stores data in the form of Collections and Documents. For this project, I have made following collections:

**user:** to store user details

**call:** to store current running call details

### Working of the app

**Calling User:** 

First of all, the user sees sign in page where I have added google sign authentication method. After sign in, user is routed to home page
Here There is a button to make a video a video call. If we click there, user sees two fields, enter the reciever mail id and enter your channel name. Once both fields are filled, video call started from user side.

**Reciever:**

When reciever logged in the app, he sees a feed of calling user, where his name and email I'd is written and a button to receive the call. On clicking the button, he is also connected to the call.

In the call users can mute or unmute themselves or cut the call.

### Conclusion

This application enhances Real Time Communication and can help people to connect virtually throughout the world. 
