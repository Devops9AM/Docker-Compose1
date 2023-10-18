INTRODUCTION
docker-compose is a tool which is used to deploy multi-container application. 
One single yaml file to deploy your application on the server.
Best suited for the developers to setup their workstation in a single command without installing any kind of dependencies for the application
docker-compose up to start your application 
docker-compose down to clean up all the docker containers
Let’s take an example here:
We have a project called user registration which uses mysql for storing the data . In terms of microservices, we can say that we have two services as shown below:

Web Service
Database Service
You can clone this git repo and try the below example

Explanation of docker-compose
version : This is the version as per the docker engine you have installed on your machine 
services: This is the main tag which is used to configure multiple services and under that we have details of all the services
 3. web: This is our service name -> using image, ports and volumes

4. volumes: To store the database files

******************************************************************************************************

Docker Compose Installation and Execution App

#sudo dnf check-update
#sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#sudo dnf install docker-compose-plugin
#docker compose version

docker -v
docker-compose -v

If you don’t want to use cache for building service, you need to use the following command.

docker-compose build --no-cache

When you have multiple services in the docker-compose file and when you run the above command, it builds the services in series. You can issue this flag to build it in parallel.

docker-compose build --parallel


There is a scenario where you want to pull images every time you build your services. You need to use the following command

docker-compose build --pull


Start the Services
You need to start the services after the build. You can even issue this command without building first. If the services are not available this command builds those services.

docker-compose up


If you want to run the containers in detached mode, add the following flag.

docker-compose up -d
If you want to recreate the services if the containers already exist, add the following flag.

docker-compose up -d --no-recreate
If you want to build the images before starting the services, add the following flag.

docker-compose up -d --build



Listing Images
If you want to list all the images that docker-compose built, you can run this command.

docker-compose images


If you want to show only image ids, you can add this flag.

docker-compose images -q


Listing Containers
If you want to list all the running containers that docker-compose built, you can run this command.

docker-compose ps

If you want to see stopped containers as well, add this flag

docker-compose ps --all

Start Existing Containers
If you want to start existing containers for the service, you can run the following command

docker-compose start <service name>
Go to this link if you want to know more flags like this.

Stop Existing Containers
If you want to stop running containers without removing them, you can run the following command

docker-compose stop <service>


Display Running Processes
If you want to list running processes, you can run the following command

docker-compose top


Force Stop Running Containers
This command forces running containers to stop by sending a SIGKILL signal.

docker-compose kill <service name>
You can pass this signal optionally.

docker-compose kill -s SIGINT


Remove Stopped Containers
When you stop or kill the process the containers are not removed. You can run the following command if you want to remove the stopped service containers.

docker-compose rm <service name>

Stop and remove the services
If you need one command to stop and remove the containers, here is the command.

docker-compose down

Service Logs
The following command logs the output from the services.

docker-compose logs

Exec Into Running Services
This command is equivalent to the docker exec command. You can run arbitrary commands in your services.

docker-compose exec -it container-id/containers-name command 

   for example:

    docker-compose exec -it webapp /bin/bash 


Validate the Compose File
If you want to validate the compose file, you can run the following command in the location where your compose file resides.

docker-compose config


Stream the Container Events
if you want to know what events occur on the containers and stream those, use the following command. Pass the json flag to print in a json format.

docker-compose events --json


Issue this command in one terminal and open another terminal and start or stop the container. You can see the output like below.



Pause and Unpause the containers
If you want to pause and unpause the container you can use the following commands.

docker-compose pause <service name>
docker-compose unpause <service name>







all Docker Compose Commands Listing



Docker Compose
Docker Compose is a tool used to run multi-container Docker applications. It allows you to define and run multiple containers as a single application, providing an easy way to manage, configure, and deploy your containers



Docker Compose Basics
Docker Compose: A tool for defining and running multi-container Docker applications.
docker-compose.yml: A YAML file that defines the services, networks, and volumes for a Docker Compose application.
Service: A containerized application that can be run as part of a Docker Compose application.
Network: A named network that connects the services in a Docker Compose application.
Volume: A named volume that can be used to share data between containers in a Docker Compose application.


Basic commands:
docker-compose up - starts all the services defined in the docker-compose.yml file.
docker-compose down - stops and removes all the containers, networks, and volumes created by docker-compose up.
docker-compose build - builds or rebuilds the Docker images of the services defined in the docker-compose.yml file.
docker-compose ps - lists all the running containers for the services defined in the docker-compose.yml file.
docker-compose logs - shows the logs of the containers for the services defined in the docker-compose.yml file.
docker-compose start - starts the containers for the services defined in the docker-compose.yml file.
docker-compose stop - stops the containers for the services defined in the docker-compose.yml file.
docker-compose restart - restarts the containers for the services defined in the docker-compose.yml file.
docker-compose pause - pauses the containers for the services defined in the docker-compose.yml file.
docker-compose unpause - unpauses the containers for the services defined in the docker-compose.yml file.
docker-compose exec - runs a command inside a running container for a service defined in the docker-compose.yml file.
docker-compose pull - pulls the latest images for the services defined in the docker-compose.yml file.
docker-compose config - validates and displays the configuration of the services defined in the docker-compose.yml file.
docker-compose kill - sends a SIGKILL signal to the containers for the services defined in the docker-compose.yml file.
docker-compose rm - removes the stopped containers for the services defined in the docker-compose.yml file.

Configuration:
docker-compose.yml: Default configuration file for Docker Compose.
-f/--file flag: Specifies an alternate compose file.
--project-name flag: Specifies an alternate project name.

Services:
services: Defines a list of services to run in the application.
build: Specifies the path to the Dockerfile for building an image.
image: Specifies the name of the image to use.
container_name: Specifies the name of the container.
ports: Exposes ports on the host machine.
volumes: Mounts directories or files from the host machine to the container.
environment: Sets environment variables for the service.

Networks:
networks: Defines a list of custom networks to create.
driver: Specifies the network driver to use.
name: Specifies the name of the network.
external: Specifies an existing network to connect to.

Volumes:
volumes: Defines a list of named volumes to create.
driver: Specifies the volume driver to use.
name: Specifies the name of the volume.
external: Specifies an existing volume to use.


Docker Compose Service Configuration
A Docker Compose service can be configured with the following options:

build: Specifies the path to the Dockerfile used to build the service image.
image: Specifies the name of the Docker image to use for the service.
ports: Specifies the port mapping between the host system and the container.
environment: Specifies environment variables to be set in the container.
networks: Specifies the networks to connect the container to.
volumes: Specifies the volumes to mount in the container.


Docker Compose File Structure

A Docker Compose file consists of the following sections:

version: The version of the Docker Compose file format to use.Example: version: '3'
services: The services to run as part of the Docker Compose application.Example:
services:
  app:
    build: .
    ports:
      - "8000:8000"
    environment:
      DEBUG: "true"
networks: The networks to create and connect the services in the Docker Compose application.Example:
networks:
  app-network:
    driver: bridge

volumes: The volumes to create and share between the containers in the Docker Compose application.Example:
volumes:
  data:
    driver: local



Examples:
Example 1: Simple web application
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
This configuration defines a single service named "web" that builds an image from the Dockerfile in the current directory and exposes port 5000 on the host machine.



Example 2: Multi-container application with custom network and volumes
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - type: bind
        source: ./app
        target: /app
    networks:
      - mynet
  db:
    image: postgres
    volumes:
      - db_data:/var/lib/postgresql/data
    networks:
      - mynet
networks:
  mynet:
volumes:
  db_data:




This configuration defines two services named "web" and "db" that use a custom network named "mynet" and a named volume named "db_data". The "web" service builds an image from the Dockerfile in the current directory, exposes port 5000 on the host machine, mounts the ./app directory as a volume in the container, and connects to the "mynet" network. The "db" service uses the "postgres" image, mounts the "db_data" volume, and connects to the "mynet" network.







*************************************************************************************

Docker Compose Example: 1

#mkdir ~/compose-demo
#cd ~/compose-demo
#mkdir app
#vim app/index.html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Docker Compose Demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>

    <h1>This is a Docker Compose Demo Page.</h1>
    <p>This content is being served by an Nginx container.</p>

</body>
</html>


#vim docker-compose.yml
version: '3.7'
services:
  web:
    image: nginx:alpine
    ports:
      - "8000:80"
    volumes:
      - ./app:/usr/share/nginx/html


#docker compose up -d

#docker compose ps

************************************************************************

Docker Compose Example: 2

sudo vi docker-compose.yml 

version: "3.3"
services:
  artifactory-service:
    image: docker.bintray.io/jfrog/artifactory-oss:7.49.6
    container_name: artifactory
    restart: always
    networks:
      - ci_net
    ports:
      - 8081:8081
      - 8082:8082
    volumes:
      - artifactory:/var/opt/jfrog/artifactory

volumes:
  artifactory:
networks:
  ci_net:



Save the file by entering :wq!


sudo docker-compose up -d 



sudo docker-compose logs --follow

curl localhost:8081


*********************************************************

Docker Compose Example: MySQL

version: '3.8'
services:
  db:
    image: mysql:8.0
    cap_add:
      - SYS_NICE
    restart: always
    environment:
      - MYSQL_DATABASE=cloudgen
      - MYSQL_ROOT_PASSWORD=CloudGen@123
    ports:
      - '3306:3306'
    volumes:
      - db:/var/lib/mysql
      - ./db/init.sql:/docker-entrypoint-initdb.d/init.sql
volumes:
  db:
    driver: local


The above docker-compose file has the following things to comprehend:

It uses the docker-compose file version 3.8, one of the latest ones.

Consequently, we definedb as a service, each service will be equivalent to a new docker run command

Subsequently, we point docker-compose to use the official MySQL 8.0 image for this DB service.

The cap_add set to SYS_NICE suppresses some not useful error messages.

Next up we ask docker-compose to always restart this container if it fails.

After that we add 2 environment variables for the MySQL database and the root user’s password. As per need, we can add another user to give it less privilege with other env vars.

Then, we map the host port 3306 to the container port 3306 as the MySQL server is running on container port 3306. Depending on the preference the host port may be changed.

Then we add 2 volumes, first one is the DB volume mapped to the below volumes db. Which basically tells docker and docker-compose to manage the volume for us. Next, we add an init.sql script which will initialize our quotes database with the given SQL file.

We can start the MySQL container this time with docker-compose using:


docker-compose -f docker-compose-mysql-only.yml up


*************************************************************************


Docker Compose Example: MySQL-WorkBench


version: '3.3'
services:
  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: 'db'
      # So you don't have to use root, but you can if you like
      MYSQL_USER: 'user'
      # You can use whatever password you like
      MYSQL_PASSWORD: 'password'
      # Password for root access
      MYSQL_ROOT_PASSWORD: 'password'
    ports:
      # <Port exposed> : <MySQL Port running inside container>
      - '3306:3306'
    expose:
      # Opens port 3306 on the container
      - '3306'
      # Where our data will be persisted
    volumes:
      - my-db:/var/lib/mysql
# Names our volume
volumes:
  my-db:


**************************************************************************************************


Docker Compose Example: 1


Now we will create a docker-compose file which will together launch a tomcat, mysql and phpmyadmin container

Tomcat container — To run your application

Database container — To store the data

PhpMyAdmin — Access the database through GUI

So we will have three services

db — we are using local path to store the data so that when you run docker-compose down all your data will retain. If you use the volume then all data will get lost if you run the docker-compose down
 Also, we are importing sql file so that our database is ready with the sample data. It is good so that each developer will always have the base or the actual data to run their application on the local machine

2. phpmyadmin — which is used to access the database through GUI and it depends on service db 


3. web — which is used to access your web application and it also depends on service db

version: '3.3'
services:
   db:
     image: mysql:5.7
     volumes:
       - /opt/test:/var/lib/mysql
       - ./mysql-dump:/docker-entrypoint-initdb.d
     environment:
       MYSQL_ROOT_PASSWORD: root
       MYSQL_DATABASE: testdb1
       MYSQL_USER: testuser
       MYSQL_PASSWORD: root
     ports:
       - 3306:3306
phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin
    ports:
      - '8081:80'
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: root
web:
    depends_on:
      - db
    image: tomcat
    volumes:
      - ./target/LoginWebApp-1.war:/usr/local/tomcat/webapps/LoginWebApp-1.war
    ports:
      - '8082:8080'
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: testdb1
      MYSQL_USER: testuser
      MYSQL_PASSWORD: root



Run the command

docker-compose up -d

But as we have put the index.html we can try to access that

http://yourip:8081/test
You should be able to see the content of your index.html.

This shows that we have successfully launched tomcat inside a docker container using docker-compose.

Clean the docker container

docker-compose -f docker-compose_tomcat.yml down


**************************************************************************************************
Docker Compose Example: 1

sudo usermod -aG docker $USER

Create directory
mkdir ~/jenkins

Jenkins Setup

Create docker-compose.yml
this yml has all configuration for installing Jenkins


sudo vi docker-compose.yml 

version: '3.3'
services:
  jenkins:
    image: jenkins/jenkins:lts
    restart: unless-stopped
    privileged: true
    user: root
    ports:
      - 8080:8080
    container_name: jenkins
    volumes:
      - ~/jenkins:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/local/bin/docker:/usr/local/bin/docker


sudo docker-compose up -d 

sudo docker-compose logs --follow
sudo docker ps
sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
http://public_dns_name:8080








**********************************************************************************************

sudo docker-compose down














***************************************************************************************************
MySQL in Docker container:


mkdir /tmp/mysql-data
docker run --name basic-mysql --rm -v /tmp/mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=ANSKk08aPEDbFjDO -e MYSQL_DATABASE=testing -p 3306:3306 -it mysql:8.0
docker exec -it basic-mysql /bin/bash
#once inside the container 
mysql -uroot -p
#put/paste the password, and once inside MySQL CLI run
show databases;




*******************************************************************************
Docker Compose Porject end to end 



Docker Compose Commands
The docker-compose command permits the management of multi-container applications. The command has the format:

$ docker-compose [options] [command] [arguments]
To list all the sub-commands including a short description of each command, use -h option for help.

$ docker-compose -h
Docker compose file
The following docker compose file is used to practice the examples of docker compose commands.

# docker-compose.yml
version: "3.8"

services:
  adminer:
    image: adminer
    restart: always
    ports: 
      - "8080:8080"
    depends_on:
      - db

  db:
    image: postgres
    restart: always
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=root
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=mydb
Docker compose file location
The docker-compose command looks for the docker-compose.yml file in the current directory. If the the file has a different name or located in another folder, you may use the -f option followed by the compose file path.

$ docker-compose -f /linux/app/docker-compose.yml
docker-compose ps
Lists containers and services including their names, commands executed at startup, states and ports.

$ docker-compose ps
Options:
-q : Limit the display to container ids
-a : Show all stopped containers

docker-compose up
Builds, (re)creates, starts, and attaches to containers for a service. To start the containers in the background, use the -d option.

$ docker-compose up -d
This command is also used to take into consideration changes to the compose file by stopping and starting the containers.

To scale the number of services, use the --scale option. The scale option accepts the service name and the number of services to start.

$ docker-compose up --scale db=2 -d
$ docker-compose ps
docker-compose down
Stops and remove containers and networks defined in the compose file.

$ docker-compose down
Options:
-v : remove named volumes defined under volumes section in the compose file
--rmi all : remove all images used by the services

docker-compose build
Build services from Docker files. The name given to services are in the form: project-name_service-name. By default, the project name is the directory where the compose file is located. If no build option is specified in the compose file, no action is performed.

$ docker-compose build
docker-compose config
Validates and checks for errors in the compose file. If there are no errors, the compose file is displayed to the screen.

$ docker-compose config
Options:
--services : print services
--volumes : print volumes

docker-compose exec
Executes commands inside services. This command is equivalent to the docker run command.

$ docker-compose exec <service> <command>
$ docker-compose exec db uname -a
$ docker-compose exec db sh     # start interactive shell
docker-compose logs
Displays logs generated by services.

$ docker-compose logs [options] [service ...]
$ docker-compose logs
$ docker-compose logs -f db
Options:
-f : follow log output (wait for logs)
--tail=N or all : show the last N logs or all logs

docker-compose stop and start
Stops and starts a container. The stop does not remove the container. When stopped, the container is in the Exit(0) state.

$ docker-compose stop adminer
$ docker-compose ps
$ docker-compose start adminer
$ docker-compose ps
docker-compose top
Displays the processes running on services.

$ docker-compose top
$ docker-compose top adminer



***************************************************************



