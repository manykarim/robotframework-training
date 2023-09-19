*** Settings ***
Library   SoapLibrary
Library   Collections
Library    XML
Library    String
Library  DataDriver    file=${CURDIR}${/}datadriver.csv
Test Template    Send Request And Check Response

*** Variables ***
${CALCULATOR_URL}    http://www.dneonline.com/calculator.asmx?WSDL
${REFERENCE_DIR}    ${CURDIR}${/}reference
${CANDIDATE_DIR}    ${CURDIR}${/}candidate
${REQUEST_DIR}    ${CURDIR}${/}request

*** Test Cases ***
Send ${request_file} and check ${response_file}

*** Keywords ***
Send Request And Check Response
    [Arguments]    ${request_file}    ${response_file}
    Create SOAP Client    url=${CALCULATOR_URL}
    ${response}    Call SOAP Method With XML   xml=${REQUEST_DIR}${/}${request_file}
    ${candidate}    Save XML To File    ${response}    save_folder=${CANDIDATE_DIR}    file_name=calculator_multiply_5x5
    ${reference}    Parse Xml  source=${REFERENCE_DIR}${/}${response_file}
    Elements Should Be Equal    source=${candidate}    expected=${reference}