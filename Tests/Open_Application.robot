*** Settings ***
Documentation   User Should Be Able To Change Android Wallpaper
Library   AppiumLibrary
*** Variables ***
${SWIPE THE TOUCH SCREEN}   Swipe By Percent  90 | 50 | 10 | 50

*** Test Case ***
Open
   Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554   automationName=UiAutomator2
   Wait Until Page Contains Element       id=com.google.android.apps.nexuslauncher:id/scrim_view

Swipe Up
  ${element_size}=    Get Element Size    id=com.google.android.apps.nexuslauncher:id/scrim_view
  ${element_location}=    Get Element Location    id=com.google.android.apps.nexuslauncher:id/scrim_view
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1

Enable App Page
  Click Element      id=com.google.android.apps.nexuslauncher:id/icon
  Wait Until Page Contains Element     //android.view.View[@content-desc="Home"]

Click on Settings Feature
  Click Element     //android.widget.TextView[@text="Settings"]
  #Wait Until Page Contains Element       //android.widget.FrameLayout[@package="com.android.settings"]

Scroll
   Wait Until Page Contains Element     //android.widget.RelativeLayout[@package="com.android.settings"]
   ${element_size}=    Get Element Size    //android.widget.FrameLayout[@package="com.android.settings"]
   ${element_location}=    Get Element Location    //android.widget.FrameLayout[@package="com.android.settings"]
   ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
   ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
   ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
   ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
   Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
   Sleep  1
   Click Element      //android.widget.TextView[@text="Wallpaper & style"]

   #Adding Pictures to Wallpaper& Style Library
   #Page Should Contain Element     //android.widget.LinearLayout[@package=com.google.android.apps.wallpaper]
   Click Element   id=com.google.android.apps.wallpaper:id/overlay_icon
   #Wait Until Page Contains Element     id=com.google.android.apps.wallpaper:id/overlay_icon


