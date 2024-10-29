*** Settings ***
Library           SeleniumLibrary
Resource    ./Locators.robot
Resource    ./Keyword.robot
Library    OperatingSystem


*** Test Cases ***
Verify JSON Data Matches UI Table Data
    Open Browser    ${url}    Chrome
    ${json_content}=    Get File    ${JSON_FILE_PATH}
    ${JSON_DATA}=    Evaluate    json.loads('''${json_content}''')
    ${JSON_DATA}=    Convert Json To String    ${JSON_DATA}    # Convert the json into string for submiting purpose
    Input JSON Data    ${JSON_DATA}
    Click Element    ${SUBMIT_BUTTON}
    ${table_data}=    Get Table Data As List Of Dicts    ${TABLE_LOCATOR}
    Should Be Equal    ${table_data}    ${JSON_DATA}    # Used to assert the table value with json value
    Close Browser