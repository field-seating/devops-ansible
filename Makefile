encrypt-secret-api:
	ansible-vault encrypt --vault-id password/common_password secrets/staging/apiservers/secret.yml --output=inventories/staging/group_vars/apiservers/vault.yml

decrypt-secret-api:
	ansible-vault decrypt --vault-id password/common_password inventories/staging/group_vars/apiservers/vault.yml --output=secrets/staging/apiservers/secret.yml

encrypt-secret-db:
	ansible-vault encrypt --vault-id password/common_password secrets/staging/dbservers/secret.yml --output=inventories/staging/group_vars/dbservers/vault.yml

decrypt-secret-db:
	ansible-vault decrypt --vault-id password/common_password inventories/staging/group_vars/dbservers/vault.yml --output=secrets/staging/dbservers/secret.yml

encrypt-secret-log:
	ansible-vault encrypt --vault-id password/common_password secrets/staging/logservers/secret.yml --output=inventories/staging/group_vars/logservers/vault.yml

decrypt-secret-log:
	ansible-vault decrypt --vault-id password/common_password inventories/staging/group_vars/logservers/vault.yml --output=secrets/staging/logservers/secret.yml

staging-api-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiserver.yml

staging-db-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -u root dbserver.yml

staging-log-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -u root logserver.yml

staging-api-seeding:
	ansible-playbook -i inventories/staging --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiseeding.yml

