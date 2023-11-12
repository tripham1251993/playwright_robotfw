*** Settings ***
Resource    Common.resource


*** Keywords ***
Open Menu
    [Documentation]    Open menu / sub menu. The menu locator is on Locators/MainMenuLocator.resource.
    ...    You need to input the menu object from there, the menu argument is not string
    [Arguments]    ${menu}    ${wait_db_loading}=${True}
    IF    ${wait_db_loading}
        Sleep    ${iTIMER.T}
    END
    ${is_dictionary}=    Evaluate    type(${menu}) == dict
    IF    ${is_dictionary}
        IF    ${menu.parent}
            ${is_visible}=    Get Element States    ${menu.locator}    then    bool(value & visible)
            IF    ${is_visible}
                Click    ${menu.locator}
            ELSE
                Open Menu    ${menu.parent}    ${False}
                Click    ${menu.locator}
            END
        ELSE
            Click    ${menu.locator}
        END
    END
