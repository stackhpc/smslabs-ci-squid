Deploys containerised squid onto preexisting network in sms-labs CI project.

# Use

```shell
./setup.sh
. venv/bin/activate
terraform init
terraform apply
ansible-playbook -i inventory site.yml
```

# Using calamaris for stats

ssh into the squid node and run `sudo cat /srv/podman/squid/log/access.log | calamaris`
