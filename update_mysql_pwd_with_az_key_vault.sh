#!/bin/bash

OLD_PASSWORD=`az keyvault secret show --name "old" --vault-name "test" --query value -o tsv`
NEW_PASSWORD=`az keyvault secret show --name "new" --vault-name "test" --query value -o tsv`

printf "$OLD_PASSWORD";
printf "$NEW_PASSWORD";

mysql -utestuser -p${OLD_PASSWORD} --host=test.xxx.com  << EOF
use mysql;
alter user 	testuser identified by '${NEW_PASSWORD}'; 

flush privileges;
EOF
