# Create billing service environment
This tool create local environment for  Billing Service.

#### Installation:

```sh 
# Clone repo to your local machine:
$ git clone https://github.com/ivz-dev/billing-service-environment.git

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
- ```~/billing-service/``` - Project dir
- mysql docker volume, for synchronized mysql data. 
  
#### Environment description:

After the project is launched, in docker container will be running:
1. Mysql  <br />
Config:  ```user:mysql pass:''``` <br />
Database storage will be synchronized with your local machine and thus all data will be save after stopping the container.
2. Project <br />
Your local code ```~/billing-service/``` will be synchronized with docker-container ```/src```, and will be launched through process manager *pm2*, like this:
```sh 
# /src
pm2 start index.js --watch
```
Thus, you will get hot-reload your code.
You can locally run npm command, install packages, *npm* directory also synchronized with docker-container.
#### Commands: 

```sh 
# Run project:
$ docker start billing-service

# Stop project: 
$ docker kill billing-service 

# Open container shell:
$ docker exec -it billing-service /bin/sh
```

Project will be launched on ```82``` port
