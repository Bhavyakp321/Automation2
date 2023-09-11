*** Settings ***
Library   SeleniumLibrary

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
${search_locator}           //div[1][@class="Icon___bXIML" ]
${search_input}             //input[@placeholder="Search..."]
${click}                    //div[contains(@class, "title___1BjRX")]
${home}                     //a[@href="/home"]
${ticket}                   //div[2][@class="Icon___bXIML" ]
${myticket}                 //span[contains(text(), "My Tickets")]
${raiseticket}              //span[contains(text(), "Raise Ticket")]
${close}                    //button[@aria-label="Close"]
${notify}                   //div[3][@class="Icon___bXIML" ]
${color}                    //div[4][@class="Icon___bXIML" ]
${dark}                     //label[2]//span[contains(text(), 'Dark')]
${light}                    //label[1]//span[contains(text(), 'Light')]
${symbol}                   //div[5][@class="ant-dropdown-trigger languageSelector___2zxz0" ]
${o_dir}                    //a[@href="/directory"]
${dir}                      //div[@class='ant-tabs-tab-btn' and text()='Directory']
${next_page}                //li[@class="ant-pagination-next"]
${profile}                  //a[contains(@href, "/directory/employee-profile/spandana.sy")]
${back}                     //button[@class="ant-btn ant-btn-ghost ant-btn-background-ghost"]
${timesheet}                //a[@href="/time-sheet"]


${browser}                           chrome
${gmail}                      bhavya.kp@terralogic.com
${pswd}                             bhavya@321
${enter}                              RETURN


*** Test Cases ***
HR-OS Automation

    Login HR-OS
    Top Menu
    Left Menu


*** Keywords ***
Login HR-OS

    Set Selenium Speed                            3
    Open Browser                              ${login_url}              ${browser}
    Maximize Browser Window
    Click Element                             ${terra_login}
    Sleep                                         5
    Switch Window                             ${google_url}
    Input Text                                ${email}                    ${gmail}
    Click Element                             ${next}
    Sleep                                         5
    Input Text                                ${password}                  ${pswd}
    Click Element                             ${next}
    Sleep                                         50
    Switch Window                             ${terra_home}

Top menu

	#search
	Click Element                             ${search_locator}
	Input Text                                ${search_input}                rajeeve
	Press Keys                                ${search_input}                ${enter}
	Sleep   3
	Wait Until Element Is Visible             ${click}
	Click Element                             ${click}
	Sleep   5
	Execute Javascript                        window.scrollBy(0,1000)
	Sleep   3
	Click Link                                ${home}
	Sleep   3

    #??(query)
	Click Element                             ${ticket}
	Click Element                             ${myticket}
	Sleep   3
	Click Element                             ${ticket}
	Click Element                             ${raiseticket}
	Sleep   3
	Click Element                             ${close}
	Click Link                                ${home}

    #notify
    Click Element                             ${notify}
    Click Element                             ${close}

    #color theme
    Click Element                             ${color}
    Click Element                             ${dark}
    Click Element                             ${light}
    Click Element                             ${close}
    Sleep                                         2

Left Menu

	Click Link                                ${o_dir}
	Sleep                                         20
	Click Element                             ${dir}
	Wait Until Element Is Visible             ${next_page}
	Click Element                             ${next_page}
	Sleep                                          3
	Click Link                                ${profile}
	Sleep                                          5
	Click Element                             ${back}
	Sleep                                          3
	Click Link                                ${timesheet}
	Sleep                                          3









