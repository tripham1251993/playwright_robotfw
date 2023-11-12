*** Variables ***
${USERNAME_INPUT}=                  //input[@id="usernameOrEmailAddress"]
${PASSWORD_INPUT}=                  //input[@id="Password"]
${REMEMBER_CHECKBOX}=               //input[@id="rememberme"]
${LOGIN_BUTTON}=                    //button[@id="LoginButton"]
${STORE_SELECTION}=                 //span[@role="combobox"]
${STORE_OPTION}=                    //li[@role="option"]/span[text()="__OPTION__"]
${CHOOSE_STORE_CONTINUE_BUTTON}=    //button[@id="btnSaveChooseStoreForUser"]

# Validation Locator
${BLANK_USERNAME_VALIDATION}=       span#usernameOrEmailAddress_validationMessage
${BLANK_PASSWORD_VALIDATION}=       span#Password_validationMessage
${SUMMARY_VALIDATE_MESSAGE}=        span.summaryValidateMessage
