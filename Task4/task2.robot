*** Settings ***
Library   SeleniumLibrary
Library    DateTime

*** Variables ***
${url}                      https://accounts.google.com/
${login_url}                https://terralogic.paxanimi.ai/login
${home_url}                 https://terralogic.paxanimi.ai/home
${terra_login}              //*[@id="basic"]/button[2]
${google_url}                Sign in - Google Accounts
${email}                     //*[@id="identifierId"]
${next}                     //span[text()='Next']
${password}                 //*[@id="password"]/div[1]/div/div[1]/input
${terra_home}                     Home
${timesheet}                //a[@href="/time-sheet"]
${add_task}                 //*[@id="rc-tabs-1-panel-my"]/div/div[1]/div[2]/button[3]
${date_in}                   //*[@id="basic_dates"]
${s_date}                    //*[@id="basic_dates" and @placeholder="Start date"]
${e_date}                    (//input[@placeholder="End date"])[last()]
${weekly}                    //ul/li[2][@class="ant-picker-preset"]
${start_time}                //*[@id="basic_tasks_0_startTime"]
${end_time}                  //*[@id="basic_tasks_0_endTime"]
${project}                   //*[@id="basic_tasks_0_projectId"]
${task}                      //*[@id="basic_tasks_0_taskName"]
${description}               //*[@id="basic_tasks_0_notes"]
${submit}                    //button[@type="submit"]
${notify}                    //div[@class="ant-notification ant-notification-topRight"]
${edit}                      //div[@class="actionsButton___12SV-"]//img[1]
${update}                    //*[@id="basic_notes"]
${delete}                   //div[@class="actionsButton___12SV-"]//img[3]
${back_icon}                //button[1][@class="ant-btn ant-btn-link ant-btn-lg IconButton___ZGvCU"]//img[1]
${front_icon}               //button[2][@class="ant-btn ant-btn-link ant-btn-lg IconButton___ZGvCU"]//img[1]


${browser}                           chrome
${gmail}                      bhavya.kp@terralogic.com
${pswd}                             Bhavana@321
${enter}                              RETURN

*** Test Cases ***
HR-OS Automation-02

    Login HR-OS

     FOR    ${day}    IN RANGE    8
        ${start_date} =    Get Next Date        ${day}
        ${end_date} =      Get Next Date        ${day}

        ${day_of_week} =   Get Day of Week      ${start_date}

       #Skip Saturday and Sunday
        Run Keyword If    ${day_of_week} != 5 and ${day_of_week} != 6   Daily Basis  ${start_date}   ${end_date}

     END

     Next Function
     Update And Delete
     Weekly Basis
     Update And Delete



*** Keywords ***
Login HR-OS

	Set Selenium Speed            3
    Open Browser           ${login_url}              ${browser}
    Maximize Browser Window
    Click Element          ${terra_login}
    Sleep                         5
    Switch Window          ${google_url}
    Input Text             ${email}                    ${gmail}
    Click Element          ${next}
    Sleep                       5
    Input Text             ${password}                  ${pswd}
    Click Element          ${next}
    Sleep                       50
    Switch Window          ${terra_home}
    Click Link             ${timesheet}
    Sleep  50
	Click Element          ${back_icon}                 #one more element
	Sleep  2
	Click Element          ${back_icon}

Daily Basis

    [Arguments]    ${start_date}    ${end_date}
    Wait Until Element Is Visible    ${add_task}

	Click Element         ${add_task}
    Click Element         ${date_in}

    ${formatted_start_date} =    Convert Date    ${start_date}    result_format=%Y-%m-%d
    ${formatted_end_date} =      Convert Date    ${end_date}      result_format=%Y-%m-%d

    Input Text            ${s_date}            ${formatted_start_date}
    Press Keys            ${s_date}            ${enter}
    Input Text            ${e_date}            ${formatted_end_date}
    Press Keys            ${e_date}            ${enter}
    Input Text            ${start_time}        9:00 am
    Press Keys            ${start_time}        ${enter}
    Input Text            ${end_time}          6:00 pm
    Press Keys            ${end_time}          ${enter}
    Input Text            ${project}           Rampup_Software
    Press Keys            ${project}           ${enter}
    Input Text            ${task}              Automation Task
    Press Keys            ${task}              ${enter}
    Input Text            ${description}       Going through Robotframework.
    Click Element         ${submit}
    Wait Until Element Is Not Visible          ${notify}         timeout=30
    Click Element         ${back_icon}

Get Next Date
    [Arguments]    ${days_to_add}
    ${next_date} =    Evaluate    datetime.datetime.now() - datetime.timedelta(days=${days_to_add})
    [Return]     ${next_date}


Get Day of Week
    [Arguments]    ${date}
    ${day_of_week} =    Call Method    ${date}    weekday
    [Return]    ${day_of_week}



Weekly Basis

	Click Element         ${add_task}
    Click Element         ${date_in}
    Click Element         ${weekly}
    Input Text            ${start_time}        9:00 am
    Press Keys            ${start_time}        ${enter}
    Input Text            ${end_time}          6:00 pm
    Press Keys            ${end_time}          ${enter}
    Input Text            ${project}           Rampup_Software
    Press Keys            ${project}           ${enter}
    Input Text            ${task}              Jenkin Task
    Press Keys            ${task}              ${enter}
    Input Text            ${description}       Working on Jenkins.
    Click Element         ${submit}
    Sleep                  10

    FOR  ${i}   IN RANGE   4
		Click Element    ${front_icon}
		Sleep      2
    END


Update and Delete

	Wait Until Page Contains Element        ${edit}
    Click Element         ${edit}
    Input Text            ${update}       Also went through Dockers.
    Click Element         ${submit}
    Sleep      2
    Wait Until Page Contains Element          ${delete}
    Click Element         ${delete}
    Click Element         ${submit}
    Sleep                     5

Next Function

	FOR  ${i}   IN RANGE   8
		Click Element    ${front_icon}
		Sleep      2
    END












