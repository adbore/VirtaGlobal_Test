*** Settings ***
Documentation    User Should Able To Set New Alarm Clock
Library      AppiumLibrary
Library      BuiltIn
#Library      QMobile

*** Test Cases ***
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
  Wait Until Page Contains Element     //android.view.View[@content-desc="Home"]    6s

Click On Clock Feature App
   Click Element     //android.widget.TextView[@text="Clock"]

Click On Alarm Button
   Wait Until Element Is Visible      id=com.google.android.deskclock:id/app_bar_layout    6s
   Click Element     //android.widget.TextView[@text="Alarm"]

Click The Alarm TimeClock Settings
   Wait Until Element Is Visible      ${SELECT_ALARM_BUTTON}    6s
   Click Element     ${SELECT_ALARM_BUTTON}

Click The Delete Button For The Alarm Settings
   Wait Until Element Is Visible    ${DELETE_ALARM_CLOCK}      6s
   Click Element    ${DELETE_ALARM_CLOCK}
     #Run Keyword if   ${ALARM_CLOCK} == ${EMPTY_ALARM_CLOCK}   Click Element   ${ADD_NEW_ALARM}
     #Else if   ${ALARM_CLOCK} != ${EMPTY_ALARM_CLOCK}   Click Element   ${SELECT_ALARM_BUTTON  &&  ${DELETE_ALARM_CLOCK}
     #End

#Empty Alarm Clock
   #Wait Until Element Is Visible   ${EMPTY_ALARM_CLOCK}    6s

#Active Alarm Clock
   #Wait Until Element Is Visible  ${ALARM_CLOCK}       6s

Add New Alarm Clock
   #Wake Up Time
   Wait Until Element Is Visible    ${ADD_NEW_ALARM}     6s
   Click Element     ${ADD_NEW_ALARM}

   Wait Until Element Is Visible    ${SELECT_ALARM_DIGITAL_BUTTON}    6s
   Click Element     ${SELECT_ALARM_DIGITAL_BUTTON}

   Wait Until Element Is Visible    ${INPUT_HOUR}    6s
   Input Text     ${INPUT_HOUR}    7

   Wait Until Element Is Visible    ${INPUT_MINUTE}    6s
   Input Text     ${INPUT_MINUTE}    00

   Wait Until Element Is Visible    ${SELECT_TIME_PERIOD}    6s
   Click Element     ${SELECT_TIME_PERIOD}

   Wait Until Page Contains Element   ${SELECT_AM}    6s
   Click Element     ${SELECT_AM}

   Wait Until Element Is Visible    ${CLICK_OK_BUTTON}    6s
   Click Element    ${CLICK_OK_BUTTON}

   Wait Until Element Is Visible    ${UNCHECK_CHECKBOX}    6s
   Click Element    ${UNCHECK_CHECKBOX}

   Wait Until Element Is Visible    ${LABEL_WAKEUP}    6s
   Click Element    ${LABEL_WAKEUP}

   Wait Until Element Is Visible    ${WAKEUP_INPUT_TEXT}    6s
   Input Text     ${WAKEUP_INPUT_TEXT}    Wake Up

   Wait Until Element Is Visible    ${CLICK_ON_WAKEUP_BUTTON}    6s
   Click Element    ${CLICK_ON_WAKEUP_BUTTON}

   #Lunch Time
   Wait Until Element Is Visible    ${ADD_NEW_ALARM}     6s
   Click Element     ${ADD_NEW_ALARM}

   Wait Until Element Is Visible    ${SELECT_ALARM_DIGITAL_BUTTON}    6s
   Click Element     ${SELECT_ALARM_DIGITAL_BUTTON}

   Wait Until Element Is Visible    ${INPUT_HOUR}    6s
   Input Text     ${INPUT_HOUR}    10

   Wait Until Element Is Visible    ${INPUT_MINUTE}    6s
   Input Text     ${INPUT_MINUTE}    00

   Wait Until Element Is Visible    ${SELECT_TIME_PERIOD}    6s
   Click Element     ${SELECT_TIME_PERIOD}

   Wait Until Page Contains Element   ${SELECT_AM}    6s
   Click Element     ${SELECT_AM}

   Wait Until Element Is Visible    ${CLICK_OK_BUTTON}    6s
   Click Element    ${CLICK_OK_BUTTON}

   #Wait Until Element Is Visible    ${UNCHECK_CHECKBOX}    6s
   #Click Element    ${UNCHECK_CHECKBOX}

   Wait Until Element Is Visible    ${LABEL_COOK_LUNCH}    6s
   Click Element    ${LABEL_COOK_LUNCH}

   Wait Until Element Is Visible    ${COOK_LUNCH_INPUT_TEXT}    6s
   Input Text     ${COOK_LUNCH_INPUT_TEXT}    Cook Lunch

   Wait Until Element Is Visible    ${CLICK_ON_COOK_LUNCH_BUTTON}    6s
   Click Element    ${CLICK_ON_COOK_LUNCH_BUTTON}


*** Variables ***
#${ALARM_CLOCK}             id=com.google.android.deskclock:id/alarm_recycler_view
${SELECT_ALARM_BUTTON}     id=com.google.android.deskclock:id/arrow
${DELETE_ALARM_CLOCK}      //android.widget.Button[@text="Delete"]
#${EMPTY_ALARM_CLOCK}       id=com.google.android.deskclock:id/main


#SELECT ALARM TIME
${ADD_NEW_ALARM}           id=com.google.android.deskclock:id/fab
${SELECT_ALARM_DIGITAL_BUTTON}     id=android:id/toggle_mode
${INPUT_HOUR}      id=android:id/input_hour
${INPUT_MINUTE}    id=android:id/input_minute
${SELECT_TIME_PERIOD}     id=android:id/am_pm_spinner
${SELECT_AM}              //android.widget.CheckedTextView[@text="AM"]
#${SELECT_PM}              //android.widget.CheckedTextView[@="PM"]
${CLICK_OK_BUTTON}    //android.widget.Button[@text="OK"]
${UNCHECK_CHECKBOX}   //android.widget.CheckBox[@text="Vibrate"]
${LABEL_WAKEUP}       //android.widget.TextView[@text="Label"]
${WAKEUP_INPUT_TEXT}   id=com.google.android.deskclock:id/label_input_field
${CLICK_ON_WAKEUP_BUTTON}    id=android:id/button1

${LABEL_COOK_LUNCH}       //android.widget.TextView[@text="Label"]
${COOK_LUNCH_INPUT_TEXT}   id=com.google.android.deskclock:id/label_input_field
${CLICK_ON_COOK_LUNCH_BUTTON}    id=android:id/button1