*** Settings ***
# Library
Library     RPA.Browser.Playwright
Library     String
Library     Collections
Library     DateTime
Library     ../core_lib/BrowserHelper.py

# Locator
Resource    ../Locators/LoginPageLocator.resource
Resource    ../Locators/MainMenuLocator.resource

# Page Object
Resource    LoginPage.resource

# Variables    
Variables   ../data/e2e/${env}/common_data.yaml
Variables   ../data/e2e/${env}/login_data.yaml
Variables   ../data/e2e/common_data_all_env.yaml


*** Variables ***
${DOWNLOAD_PATH}=       downloads
&{iTIMER}=              T=2    S=5    M=10    L=30    XL=60    XXL=120
&{iTIMES}=              T=2x    S=5x    M=10x    L=30x


*** Keywords ***
Log Both UI And Console
    [Arguments]    ${message}
    Log    ${message}    console=True

Current Page Url Should End With
    [Arguments]    ${end_with}    ${timeout}=${iTIMER.M}
    Log Both UI And Console    KW: Current Page Url Should End With ${end_with}
    Wait For Condition    Url    should end with    ${end_with}    timeout=${timeout}

Page Title Should Be
    [Arguments]    ${title}    ${timeout}=${iTIMER.M}
    Log Both UI And Console    KW: Page Title Should Be ${title}
    Wait For Condition    Title    ==    ${title}    timeout=${timeout}

