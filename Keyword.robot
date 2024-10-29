*** Settings ***
Library           SeleniumLibrary
Library           Collections  # To handle lists and dictionaries
Library           JSONLibrary
Library           String
Resource          ./Locators.robot


*** Keywords ***

Input JSON Data
    [Arguments]    ${json_data}
    Click Element    ${Table_data_button}
    Wait Until Page Contains    Dynamic HTML TABLE Tag
    Wait Until Element Is Visible    ${INPUT_FIELD}
    Input Text    ${INPUT_FIELD}    ${json_data}

Get Table Data As List Of Dicts
    [Arguments]    ${table_locator}
    ${rows}=    Get WebElements    ${table_locator}//tr
    ${row_len}=    Get Length    ${rows}
    ${data}=    Create List

    FOR    ${row}    IN RANGE    2    ${row_len}+1
        ${cells}=    Get WebElements    ${table_locator}//tr[${row}]//td

        # Extract text from cells
        ${name}=     Get Text    ${cells[0]}
        ${age_str}=      Get Text    ${cells[1]}
        ${age}=    Convert To Integer    ${age_str}
        ${gender}=   Get Text    ${cells[2]}        
        
        # Create a dictionary for the current row and append to the data list
        ${entry}=    Create Dictionary    name=${name}   age=${age}    gender=${gender}
        Append To List    ${data}    ${entry}
    END


    ${data}=    Evaluate    "${data}".replace("'", '"')    #convert '' to "" for to align with the data given
    ${data}=    Convert To String    ${data}    # converting it to string for asserting purpose
    [Return]    ${data}

