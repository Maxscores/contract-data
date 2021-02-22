# Project Setup

- Make sure sfdx cli is installed
    - https://developer.salesforce.com/docs/atlas.en-us.230.0.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm
- Create a scratch org `sfdx force:org:create -a {name-of-org} -f .\config\project-scratch-def.json`
- Source push resources `sfdx force:source:push -u {name-of-org}`        
- Assign Permission Set `sfdx force:user:permset:assign -n Contract_Data_Base -u {name-of-org}`  
- Populate Test Data `sfdx force:data:tree:import -p Data\Account-Contract_Data__c-External_Data__c-plan.json -u {name-of-org}`

# Run Tests
- Run apex tests in the scratch org with this command `sfdx force:apex:test:run -w 10 -u {name-of-org} -c -r human`

# Data Export

- If additional fields are added to the test data objects, you can update the soql in `scripts/soql/account.soql` to include this data
- Then, you can run the following script to populate the new data `sfdx force:data:tree:export -q .\scripts\soql\account.soql -d Data -p -u {name-of-org}`