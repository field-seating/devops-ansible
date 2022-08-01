encrypt-secret-api:
	ansible-vault encrypt --vault-id password/common_password secrets/${ENV}/apiservers/secret.yml --output=inventories/${ENV}/group_vars/apiservers/vault.yml

decrypt-secret-api:
	ansible-vault decrypt --vault-id password/common_password inventories/${ENV}/group_vars/apiservers/vault.yml --output=secrets/${ENV}/apiservers/secret.yml

encrypt-secret-db:
	ansible-vault encrypt --vault-id password/common_password secrets/${ENV}/dbservers/secret.yml --output=inventories/${ENV}/group_vars/dbservers/vault.yml

decrypt-secret-db:
	ansible-vault decrypt --vault-id password/common_password inventories/${ENV}/group_vars/dbservers/vault.yml --output=secrets/${ENV}/dbservers/secret.yml

encrypt-secret-log:
	ansible-vault encrypt --vault-id password/common_password secrets/${ENV}/logservers/secret.yml --output=inventories/${ENV}/group_vars/logservers/vault.yml

decrypt-secret-log:
	ansible-vault decrypt --vault-id password/common_password inventories/${ENV}/group_vars/logservers/vault.yml --output=secrets/${ENV}/logservers/secret.yml

api-deploy:
	ansible-playbook -i inventories/${ENV} --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiserver.yml

db-deploy:
	ansible-playbook -i inventories/${ENV} --vault-id password/common_password -u root dbserver.yml

log-deploy:
	ansible-playbook -i inventories/${ENV} --vault-id password/common_password -u root logserver.yml

api-seeding:
	ansible-playbook -i inventories/${ENV} --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiseeding.yml

encrypt-private-key:
	ansible-vault encrypt --vault-id password/common_password secrets/${ENV}/private_key --output=secret_file/${ENV}/private_key.enc

decrypt-private-key:
	ansible-vault decrypt --vault-id password/common_password secret_file/${ENV}/private_key.enc --output=secrets/${ENV}/private_key

mysql-backup:
	ansible-playbook -i inventories/${ENV} --vault-id password/common_password -u root mysql-backup.yml
