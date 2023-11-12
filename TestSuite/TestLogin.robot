*** Settings ***
Resource    ../Resources/LoginPage.resource

*** Test Cases ***
Test Login Successfully
    Login To Store    ${TENANT_NAME}    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}    ${STORE_NAME}

Test Login With Empty Username
    User Login    ${TENANT_NAME}    ${INVALID_LOGIN_DATA.C000001.USERNAME}    ${INVALID_LOGIN_DATA.C000001.PASSWORD}
    User Validation Message Should Be Shown    ${LOGIN_VALIDATION_MSG.BLANK_USERNAME}

Test Login With Empty Password
    User Login    ${TENANT_NAME}    ${INVALID_LOGIN_DATA.C000002.USERNAME}    ${INVALID_LOGIN_DATA.C000002.PASSWORD}
    Password Validation Message Should Be Shown    ${LOGIN_VALIDATION_MSG.BLANK_PASSWORD}

Test Login With Empty Both Username And Password
    User Login    ${TENANT_NAME}    ${INVALID_LOGIN_DATA.C000003.USERNAME}    ${INVALID_LOGIN_DATA.C000003.PASSWORD}
    User Validation Message Should Be Shown    ${LOGIN_VALIDATION_MSG.BLANK_USERNAME}
    Password Validation Message Should Be Shown    ${LOGIN_VALIDATION_MSG.BLANK_PASSWORD}

Test Login With Invalid Credential
    User Login    ${TENANT_NAME}    ${INVALID_LOGIN_DATA.C000004.USERNAME}    ${INVALID_LOGIN_DATA.C000004.PASSWORD}
    Invalid Username or Password Message Should Be Shown    ${LOGIN_VALIDATION_MSG.SUMMARY_MESSAGE}