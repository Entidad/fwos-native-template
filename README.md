# Mendix React Native Template for Farmworker Wallet OS Project

## Native Template - Android

This native template is located in directory `source` in this source tree.

Tools used:

* npm: v10.8.2
* node: v20.18.3
* java: openjdk 11.0.11 2021-04-20
* javac: javac 11.0.11

Ensure you have NDK installed by using the `sdkmanager` tool

```
~/Android/cmdline-tools/tools/bin/sdkmanager --list_installed
```

If none are installed, select a candidate from the output ...

```
~/Android/cmdline-tools/tools/bin/sdkmanager --list
```

... and install a version, e.g.

```
~/Android/cmdline-tools/tools/bin/sdkmanager --install ndk;23.2.8568313
```

Using an existing or newly installed version of ndk, edit `android/build.gradle` ensuring the following

```
buildscript {
    ext {
        ...
        minSdkVersion = 21
	    //ndkVersion = "23.2.8568313"
        ndkVersion = "25.1.8937393"
        ...
    }
}
```

Add conditional logic for `repo.url`

```
allprojects {
    repositories {
        all { repo ->
            if (repo.hasProperty('url')) {
                println repo.url.toString()
                if (repo.url.toString().contains("jcenter.bintray.com") || repo.url.toString().contains("jitpack.io")) {
                    project.logger.warn "Repository ${repo.url} removed."
                    remove repo
                    google()
                    mavenLocal()
                    mavenCentral()
                }
            }
        }
   ...

```

Ensure `android/app/build.gradle` has jna set to 5.2.0

```
dependencies {
    ...
    //Required by Credo (Formerly Aries Framework JavaScript)
    implementation 'net.java.dev.jna:jna:5.2.0'
    ...
}
```

Enable [Hermes](https://reactnative.dev/docs/0.70/hermes#android) JavaScript engine and disable JSC
```
...
project.ext.react = [
        bundleForVariant: { def variant -> false },
        enableHermes : true  // clean and rebuild if changing
]
...
    // Javascript engine
    if (enableHermes) {
       // def hermesPath = "../../node_modules/hermes-engine/android/";
       // implementation files(hermesPath + "hermes-debug.aar")

        //noinspection GradleDynamicVersion
        implementation("com.facebook.react:hermes-engine:+") { // From node_modules
            exclude group:'com.facebook.fbjni'
        }
    } else {
        implementation jscFlavor
    }
...
    //Removed because we enabled Hermes to run AFJ
    //implementation "org.webkit:android-jsc:r245459"
...
```

For smaller APK sizes, limit the buildTypes by editing `android/app/build.gradle` and add abiFilters as follows [reference](https://developer.android.com/ndk/guides/abis)

```
...
     buildTypes {
        release {
            ...
            ndk {
                abiFilters "armeabi-v7a", "arm64-v8a"
            }
        }
        debug {
            ndk {
                abiFilters "armeabi-v7a", "arm64-v8a"
            }
        }
    }
...
```

Edit file `./android/app/src/main/AndroidManifest.xml`
* Add query intent for [NativeFileDocuments](https://marketplace.mendix.com/link/component/114252) module
```
    <queries>
    ...
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:mimeType="*/*" />
      </intent>
    ...
    </queries>
```

Enable http (unencrypted) traffic for developerApp distribution. This step is required if you are deploying the LOCALDEV distribution via Google Play Store
* Edit app/src/dev/AndroidManifest.xml
```
...
    <application
        android:name="com.mendix.nativetemplate.DevApplication"
        tools:replace="android:name"
        android:usesCleartextTraffic="true">
...        

```

Install the node modules by running the following

```
npm install --legacy-peer-deps
npm run configure
```

## Native Template - iOS

This native template is located in directory `source/prj` in this source tree.

Install the node modules by running the following

```
npm install --legacy-peer-deps
npm run configure
```

Ensure the following sources are listed in `ios/Podfile`

```
source 'https://cdn.cocoapods.org'
```

Enable [Hermes](https://reactnative.dev/docs/0.70/hermes#ios) JavaScript engine to disable JSC
```
def common_pods
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  # RN development pods
  config = use_native_modules!
  use_react_native!(
    :path => config[:reactNativePath],
    # Hermes is disabled by default to avoid incompatibilities and slowness with Mendix Runtime.
    :hermes_enabled => true,
    :fabric_enabled => false,
...
```

Install the pods as follows

```
cd ios
pod install
```

Open the project in `Xcode` using the following

```
open ./NativeTemplate.xcworkspace
```

With `nativeTemplate` selected, under `Signing & Capabilities`, under the section `All`, configure your signing configuration.

With `nativeTemplate` selected in the tree view, for both `Project` `nativeTemplate` as well as `Target` `nativeTemplate`, under the `Build Settings` tab, under the `All` subtab, configure option `Build Libraries for Distribution` to `yes`.

With `nativeTemplate` selected in the tree view, for both `Project` `nativeTemplate` as well as `Target` `nativeTemplate`, under the `Build Settings` tab, under the `Customized` subtab, configure option `Enable Bitcode` to `no`.

| :exclamation:  Issues   |
|-------------------------|

If you get the following error message

```
using bridging headers with module interfaces is unsupported
```

Set `Build Libraries for Distribution` to `no`. This issue has not been resolved as of yet.
