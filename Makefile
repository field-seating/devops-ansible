encrypt-secret:
	ansible-vault encrypt --vault-id password/common_password secrets/secret.yml --output=inventories/staging/group_vars/apiservers/vault.yml
