# simple_chat_bot

This a a test flutter chatbot with kommunicate

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


Installation
Add the below dependency in your pubspec.yaml file:
dependencies:
  # other dependencies
  kommunicate_flutter: ^1.6.4


Run the below command to install the package:
flutter pub get


Import kommunicate_flutter in your .dart file to use the methods from Kommunicate:
import 'package:kommunicate_flutter/kommunicate_flutter.dart';


For iOS, navigate to your App/iOS directory from terminal and run the below command:
pod install


Note: Kommunicate iOS requires min iOS platform version 10 and uses dynamic frameworks. Make sure you have the below settings at the top of your iOS/Podfile:

 platform :ios, '12.0'
 use_frameworks!


ProGuard for Android
Add the below rules in your proguard-rules.pro file under android/app/ directory. If the file is not present, create a new one and then add the rules.

#keep JSON classes
-keep class * extends com.applozic.mobicommons.json.JsonMarker {
    !static !transient <fields>;
}

-keepclassmembernames class * extends com.applozic.mobicommons.json.JsonParcelableMarker {
    !static !transient <fields>;
}

#GSON Config
-keepattributes Signature
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.examples.android.model.** { *; }
-keep class org.eclipse.paho.client.mqttv3.logging.JSR47Logger { *; }
-keep class android.support.** { *; }
-keep interface android.support.** { *; }
-dontwarn android.support.v4.**
-keep public class com.google.android.gms.* { public *; }
-dontwarn com.google.android.gms.**
-keep class com.google.gson.** { *; }


Get your App Id
Sign up for Kommunicate to get your APP_ID. This APP_ID is used to create/launch conversations.

Launch conversation
Kommunicate provides buildConversation function to create and launch conversation directly saving you the extra steps of authentication, creation, initialization and launch. You can customize the process by building the conversationObject according to your requirements. To launch the conversation you need to create a conversation object. This object is passed to the buildConversation function and based on the parameters of the object the conversation is created/launched.

Below are some examples to launch conversation in different scenarios:

Launch conversation for visitor
If you would like to launch the conversation directly without the visiting user entering any details, then use the method as below:

    dynamic conversationObject = {
     'appId': '<APP_ID>',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
     };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print("Conversation builder success : " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
#   s i m p l e _ c h a t _ b o t  
 