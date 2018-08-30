#!/bin/bash

curl -s -X POST http://localhost -d "login_username=admin" -d "login_password=admin" -d "HTTP_GOTO" -d "login_mandant_id=1" -c cookie > /dev/null
# you need to login twice for whatever reason
curl -s -X POST http://localhost -d "login_username=admin" -d "login_password=admin" -d "HTTP_GOTO" -d "login_mandant_id=1" -c cookie > /dev/null

api_key=$(curl -s -X POST http://localhost/\?call\=password\&ajax\=1\&strength\=weak -b cookie | cut -d ":" -f 3 | cut -d '"' -f 2)
echo "$api_key" > /opt/idoit-api-key

curl -s 'http://localhost/index.php?moduleID=8&what=api&treeNode=19&call=category&ajax=1' \
--data "navMode=10&sort=&dir=&id=&navPageStart=&navTemplateDetailView=&template=&useTemplate=&popupReceiver=&_csrf_token=&q=&submit_isys_form=&C__SYSTEM_SETTINGS__API_STATUS=1&SM2__C__SYSTEM_SETTINGS__API_STATUS%5Btype%5D=checkbox&C__SYSTEM_SETTINGS__API_USE_AUTH=1&SM2__C__SYSTEM_SETTINGS__API_USE_AUTH%5Btype%5D=checkbox&C__SYSTEM_SETTINGS__API__AUTHENTICATED_USERS_ONLY=0&SM2__C__SYSTEM_SETTINGS__API__AUTHENTICATED_USERS_ONLY%5Btype%5D=checkbox&SM2__C__SYSTEM_SETTINGS__LOGGING_ENABLED%5Btype%5D=checkbox&SM2__C__SYSTEM_SETTINGS__APIKEY%5Btype%5D=f_label&SM2__C__SYSTEM_SETTINGS__APIKEY%5Btype%5D=f_text&C__SYSTEM_SETTINGS__APIKEY=$api_key&SM2__C__SYSTEM_SETTINGS__APIKEY%5Bp_strValue%5D=$api_key&SM2__C__SYSTEM_SETTINGS__APIKEY%5Bp_bDisabled%5D=&LogbookCommentary=" -b cookie > /dev/null
