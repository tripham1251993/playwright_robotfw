*** Settings ***
Resource    Common.resource


*** Keywords ***
Login To Store
    [Arguments]    ${tenant_name}    ${username}    ${password}    ${store_name}
    Log Both UI And Console    KW: Login To Store ${store_name} on Tenant: ${tenant_name}
    ${browser_id}    ${context_id}    ${page_detail}=    User Login    ${tenant_name}    ${username}    ${password}
    User Select Store    ${store_name}
    Wait For Condition    Title    should end with    Quản Lý Cửa Hàng
    RETURN    ${browser_id}    ${context_id}    ${page_detail}

User Login
    [Arguments]    ${tenant_name}    ${username}    ${password}

    ${url}=    Set Variable    https://${tenant_name}.s2retail.vn/quan-ly-cua-hang
    IF    "${env.lower()}" == "production"
        ${url}=    Set Variable    https://${tenant_name}.bado.vn/quan-ly-cua-hang
    END

    ${browser_id}    ${context_id}    ${page_detail}=    Start Browser Session    ${url}

    Fill Text    ${USERNAME_INPUT}    ${username}
    Fill Text    ${PASSWORD_INPUT}    ${password}
    Click    ${REMEMBER_CHECKBOX}
    Click    ${LOGIN_BUTTON}

    RETURN    ${browser_id}    ${context_id}    ${page_detail}

User Select Store
    [Arguments]    ${store_name}
    # Wait For Loading Data from Database
    Sleep    ${iTIMER.T}
    Click    ${STORE_SELECTION}
    Click    ${STORE_OPTION.replace("__OPTION__", "${store_name}")}
    Click    ${CHOOSE_STORE_CONTINUE_BUTTON}

User Validation Message Should Be Shown
    [Arguments]    ${message}
    Log Both UI And Console    KW: User Validation Message Should Be Shown
    Log Both UI And Console    >>> Message: ${message}
    Wait For Condition    Text    ${BLANK_USERNAME_VALIDATION}    ==    ${message}    timeout=${iTIMER.L}

Password Validation Message Should Be Shown
    [Arguments]    ${message}
    Log Both UI And Console    KW: Password Validation Message Should Be Shown
    Log Both UI And Console    >>> Message: ${message}
    Wait For Condition    Text    ${BLANK_PASSWORD_VALIDATION}    ==    ${message}    timeout=${iTIMER.L}

Invalid Username or Password Message Should Be Shown
    [Arguments]    ${message}
    Log Both UI And Console    KW: Invalid Username or Password Message Should Be Shown
    Log Both UI And Console    >>> Message: ${message}
    Wait For Condition    Text    ${SUMMARY_VALIDATE_MESSAGE}    ==    ${message}    timeout=${iTIMER.L}

Start Browser Session
    [Arguments]    ${url}

    ${browser_id}=    New Browser    browser=${browser}
    ...    headless=${headless}
    ...    downloadsPath=${DOWNLOAD_PATH}
    ...    timeout=${iTIMER.L}

    ${device_config}=    Get Device    Desktop Chrome
    IF    "${browser}" == "firefox"
        ${device_config}=    Get Device    Desktop Firefox
    ELSE IF    "${browser}" == "webkit"
        ${device_config}=    Get Device    Desktop Safari
    END
    ${device_config}=    Update Device Config    ${device_config}    resolution=${resolution}

    ${context_id}=    New Context    &{device_config}
    ${page_detail}=    New Page    url=${url}
    Log Both UI And Console
    ...    >>> BrowserID: ${browser_id},\n>>> ContextID: ${context_id},\n>>> PageDetail: ${page_detail}
    RETURN    ${browser_id}    ${context_id}    ${page_detail}
