encrypt-secret-api:
	ansible-vault encrypt --vault-id password/common_password secrets/apiservers/secret.yml --output=inventories/staging/group_vars/apiservers/vault.yml

encrypt-secret-db:
	ansible-vault encrypt --vault-id password/common_password secrets/dbservers/secret.yml --output=inventories/staging/group_vars/dbservers/vault.yml

encrypt-secret-log:
	ansible-vault encrypt --vault-id password/common_password secrets/logservers/secret.yml --output=inventories/staging/group_vars/logservers/vault.yml

staging-api-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiserver.yml

staging-db-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -u root dbserver.yml

staging-log-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -u root logserver.yml
