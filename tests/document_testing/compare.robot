*** Settings ***
Library    DocTest.VisualTest    show_diff=true    take_screenshots=true    screenshot_format=png
Library    Collections

*** Variables ***
${testdata}    ${CURDIR}/testdata

*** Test Cases ***
Compare two Beach images
    Run Keyword And Expect Error    The compared images are different.    Compare Images    ${testdata}/Beach_left.jpg    ${testdata}/Beach_right.jpg

Compare two Farm images
    Run Keyword And Expect Error    The compared images are different.    Compare Images    ${testdata}/Farm_left.jpg    ${testdata}/Farm_right.jpg

Compare two Farm images with date pattern
    Compare Images    ${testdata}/Beach_date.png    ${testdata}/Beach_left.png    placeholder_file=${testdata}/pattern_mask.json