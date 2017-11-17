# Create billing-service environment
This tool create local environment for  Billing Service.

####Installation:

```sh 
# Clone repo to your local machine:
$ git clone _repo_

# Navigate to project dir: 
$ cd billing-service-environment

# Run this command to make script can be run
$ chmod +x create_work_env.sh

# Run script
$ ./create_work_env.sh
```

#### Environment contains:

- docker container with:
```
node js  - 8.9.1
npm      - 5.5.1
mysql    - 5.7
pm2      - 2.7.1
```
- ```/var/www/billing-service/``` - Project dir

#### Commands: 

```sh 
# Run project:
$ docker start billing-service

# Stop project: 
$ docker kill billing-service 
```

Project will be launched on ```82``` port
