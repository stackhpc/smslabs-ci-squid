Deploys containerised squid onto preexisting network in sms-labs CI project.

# Use

```shell
./setup.sh
. venv/bin/activate
terraform init
terraform apply
ansible-playbook -i inventory site.yml
```
