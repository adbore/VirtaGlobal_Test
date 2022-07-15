*** Settings ***
Library   appiumlibrary

Documentation     Welcome to Virta Global Interview Assignments!
...               There are 3 Tasks defined here, each as their own independend test case.
...               Your assignment is to make those test cases work. The instructions are given on test cases documentation.
...
...               Please write test cases in Keyword Driven -style. You are encouraged to re-use keywords where possible.
...               Write keywords in the included resources/android_keywords.robot -file, its already included here as a resource.
...
...               Estimated length for writing these tests is in total 2-3 hours, but feel free to be faster.
...               Estimate does not contain the time it takes to setup the environment: Appium, Python, IDE, etc.
...               You may import builtin robot framework libraries in addition to necessary Appium libraries, but you shouldn't need any
...               other external libraries.
...
...               What do you need:
...               - Android 12 emulator. Use Google Pixel 5 as hardware profile, and then Android 12 as OS version.
...               - Appium, Robot Framework, and necessary libraries to run the tests.
...
...               What to return to us:
...               - Code in public git repository, or that git repository folder in a zip/tar.
...                   - Include robotframework log and report where all tests have passed, place them in the output/ folder,
...                     including necessary screenshots.
...               - Working code. We should be able to run it. If it requires some specific setup, include short readme-file what we need to
...                 do in order to run them (emulator with certain name, etc.)
...               - Bash script in scripts/ folder, that when executed will run this spefic tests file from tests/ folder.
...                 - Execution script should:
...                     - Rename test suite as "VirtaGlobal_Tests"
...                     - Generate all output to output/ directory on main folder
...                     - After test execution, echo whether tests passed or failed (and how many failed).
...
...               If you don't get everything done, thats not the end of the world. In that case show what you tried and your reasoning
...                 there.
...               Remember! There are always many ways to achieve the goal.
...
...               Have fun!
#Resource          ../resources/android_keywords.robot

*** Test Cases ***
User Should Be Able To Change Android Wallpaper
    [Documentation]  Verify that user is able to change Android Home Screen wallpaper through Settings -> Wallpaper & style.
    ...  For the verification, capturing screenshot in the end is enough.
    ...  Big part of job is to understand difference between what we can and what we should automate.
    ...  You may create Settings -shortcut to desktop if you find that more convenient. You may also add photos to your photo library if you
    ...  want.
    ...  Bonus point if you make the test to select random wallpaper every time it is run.
    No Operation

User Should Be Able To Add New Contact
    [Documentation]  Verify that user is able add new contact through Phone -application.
    ...  Used name and number should be completely random so that this test can be ran multiple times without issues.
    ...  You may create Phone -shortcut to desktop if you find that more convenient. You may also add one contact to the contact list before
    ...  so you do not need to take empty list -scenario into account. You can also manually cancel any suggestions to add Google Account
    ...  before developing the tests.
    No Operation

User Should Be Able To Add New Alarm
    [Documentation]  Verify that user is able to set new alarm on Clock -application.
    ...  First, test should remove all existing alarms if any. Test shouldn't fail whether there are alarms or no.
    ...  Second, add new alarm at 7:00 AM, add "Wake Up" as label, and disable Vibrate checkbox.
    ...  Third, add new alarm at 10:00 AM, add "Cook Lunch" as label, don't disable vibrate checkbox.
    ...  Last, test should count amount of alarms to log, and take screenshot of the alarm page, and exit to desktop.
    ...  You may make shortcut of Clock application to desktop if you want that more convenient.
    No Operation

*** Keywords ***
Open_Application
   Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554   automationName=UiAutomator2
   Wait Until Page Contain Element       id=com.google.android.apps.nexuslauncher:id/scrim_view

Swipe Up
  ${element_size}=    Get Element Size    id=com.google.android.apps.nexuslauncher:id/scrim_view
  ${element_location}=    Get Element Location    id=com.google.android.apps.nexuslauncher:id/scrim_view
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1