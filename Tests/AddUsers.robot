*** Settings ***
Documentation   User Should Be Able To Add New Contact
Library    AppiumLibrary
Library    FakerLibrary
#Library    QMobile

*** Keywords ***

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

Click on Contact Feature
  Click Element     //android.widget.TextView[@text="Contacts"]
  #Wait Until Page Contains Element       //androidx.drawerlayout.widget.DrawerLayout[@id="com.android.contacts:id/drawer_layout"]
Click On Add Button
  Wait Until Element Is Visible   //android.widget.ImageButton[@content-desc="Create new contact"]    6s
  #Wait Until Page Contains Element     Contacts
  Click Element    //android.widget.ImageButton[@content-desc="Create new contact"]

Enter New Contact First Name
  ${firstname}=  FakerLibrary.firstname
  log  ${firstname}
  Set Test Variable  ${firstname}
  Wait Until Element Is Visible   ${ADD_NEW_CONTACT_FIRST_NAME}   6s
  Input Text    ${ADD_NEW_CONTACT_FIRST_NAME}    ${firstname}

Enter New Contact Last Name
  ${lastname}=  FakerLibrary.lastname
  log  ${lastname}
  Set Test Variable  ${lastname}
  Wait Until Element Is Visible   ${ADD_NEW_CONTACT_LAST_NAME}   6s
  Input Text    ${ADD_NEW_CONTACT_LAST_NAME}    ${lastname}

Enter New Contact Phone Number
  ${phonenumber}=  FakerLibrary.phonenumber
  log  ${phonenumber}
  Set Test Variable  ${phonenumber}
  Wait Until Element Is Visible    ${ADD_NEW_CONTACT_PHONE_NUMBER}   6s
  Input Text    ${ADD_NEW_CONTACT_PHONE_NUMBER}    ${phonenumber}

Select Different Location/Device Attached With The Phone Number
   Wait Until Element Is Visible    ${SELECT_DIFFERENT_DEVICE_HANDLER}    6s
   Click Element       ${SELECT_DIFFERENT_DEVICE_HANDLER}

  #Sleep  2
  #Click Element   //android.widget.EditText[@text="First Name"]
  #Input Text    ${email}
#Scroll
   #Wait Until Page Contains Element     //android.widget.RelativeLayout[@package="com.android.settings"]
   #${element_size}=    Get Element Size    //android.widget.FrameLayout[@package="com.android.settings"]
   #${element_location}=    Get Element Location    //android.widget.FrameLayout[@package="com.android.settings"]
   #${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
   #${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
   #${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
   #${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
   #Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
   #Sleep  1
   #Click Element      //android.widget.TextView[@text="Wallpaper & style"]

   #Adding Pictures to Wallpaper& Style Library
   #Page Should Contain Element     //android.widget.LinearLayout[@package=com.google.android.apps.wallpaper]
   #Click Element   id=com.google.android.apps.wallpaper:id/overlay_icon
   #Wait Until Page Contains Element     id=com.google.android.apps.wallpaper:id/overlay_icon
*** Variable ***
  #Add New Contact Variables
${ADD_NEW_CONTACT_FIRST_NAME}    //android.widget.EditText[@text="First name"]
${ADD_NEW_CONTACT_LAST_NAME}     //android.widget.EditText[@text="Last name"]
${ADD_NEW_CONTACT_PHONE_NUMBER}    //android.widget.EditText[@text="Phone"]
${SELECT_DIFFERENT_DEVICE_HANDLER}    GetText    //android.widget.Spinner[@clickable="true"]     index=1

*** Keywords ***
 #Add New Contact To Phone Directory



