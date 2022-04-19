encrypt-secret:
	ansible-vault encrypt --vault-id password/common_password secrets/secret.yml --output=inventories/staging/group_vars/apiservers/vault.yml

staging-api-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -e="image_tag=${DEPLOY_TAG}" -u root apiserver.yml

staging-db-deploy:
	ansible-playbook -i inventories/staging --vault-id password/common_password -u root dbserver.yml
