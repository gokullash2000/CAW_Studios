*** Variables ***

${JSON_FILE_PATH}    data.json
${TABLE_LOCATOR}    xpath=//table[@id='dynamictable']
${INPUT_FIELD}      xpath=//textarea[@id='jsondata']
${SUBMIT_BUTTON}    xpath=//button[@id='refreshtable']
${Table_data_button}    xpath=//*[contains(text(), 'Table Data')]
${url}    https://testpages.herokuapp.com/styled/tag/dynamic-table.html