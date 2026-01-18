# ADDON-S Hawkeye Pro — Android APK Wrapper (Capacitor)

This project builds a **native Android app** that loads your Hawkeye dashboard from ERPNext:
- Dashboard URL: https://addonsajith.frappe.cloud/hawkeye
- Backend: ERPNext v15

## What you will get
- A real Android install file: **APK**
- App name on phone: **ADDON-S Hawkeye Pro**

## Prerequisites (Windows)
1) Install **Node.js LTS**
2) Install **Android Studio** (Android SDK + platform tools)
3) Ensure you have **JDK 17** (Android Studio typically bundles it)

## Build (copy/paste)
Open PowerShell in this folder:

```powershell
npm install
npx cap add android
npx cap sync
npx cap open android
```

Android Studio opens.

## Generate a release APK (Android Studio)
1) Let Gradle sync finish
2) **Build → Generate Signed Bundle / APK**
3) Choose **APK**
4) Create a **new keystore** (first time) and remember the password
5) Select **release**
6) Build

Output will be similar to:
`android\app\release\app-release.apk`

Rename it to:
`ADDON-S-Hawkeye-Pro.apk`

## Install the APK on Android
1) Transfer APK to the phone (Drive/WhatsApp/USB)
2) Tap APK → allow **Install unknown apps**
3) Install

## Change the URL later
Edit `capacitor.config.ts` → `server.url`, then:
```powershell
npx cap sync
```
and rebuild the APK.

## Apply professional App Icon + Splash (included)
After you run `npx cap add android`, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\apply_android_assets.ps1
```

Then continue with:
```powershell
npx cap sync
npx cap open android
```

## Cloud Build (GitHub Actions) — no Android Studio needed
This repo includes a workflow that builds a **Debug APK** in the cloud and gives you a downloadable file.

### Steps
1) Create a new **GitHub repository** (private or public).
2) Upload **all files** from this folder to the repo (or push via git).
3) Go to: **Actions** tab in GitHub
4) Choose workflow: **Build Android APK (Debug)**
5) Click **Run workflow**
6) When it finishes, open the run → **Artifacts** → download:
   **ADDON-S-Hawkeye-Pro-debug-apk**

### Install on Android
- Extract the artifact ZIP → you will see the `.apk`
- Send it to your phone → tap to install → allow "Install unknown apps"

> Note: Debug APK is installable and perfect for direct sharing.
> If you need Play Store publishing, we will switch to a signed **release AAB** workflow.
