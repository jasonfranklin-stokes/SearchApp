# README

### Feature branch
git clone (this repository)  
git checkout stage_1
### Operational requierments
a running mysql

a **.env** file in root folder of app containing values for your mysql

you can find a **.env.example** file in the root folder of the app that you can use.

  `MYSQL_USERNAME =`   
  `MYSQL_PASSWORD =`   
  `MYSQL_HOST =`   
  `MYSQL_PORT =` 
### Setup
bundle install  
rake db:create  
rake db:seed  
### Run
rails s  
navigate to `http://localhost:3000/video/index`