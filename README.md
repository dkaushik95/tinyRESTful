# README

This is a small API for getting contents of 
an url. 

# Ruby version
```shell
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]
```
# Set up
```shell
git clone https://github.com/dkaushik95/tinyRESTful.git
cd tinyRESTful
bundle install
rails db:migrate
rails s
```

# End points

| Name        | URL           | Function  | Example |
| ------------- |:-------------:| -----:| :----: |
| get data from url (POST)  | /api/getdatafromurl | gets the url and stores h1, h2 and h3 and links from that url to the database | /api/getdatafromurl?url=http://dishantkaushik.me |
| get urls (GET)     | /api/geturls      | gets all the urls that were there in the database with contents of h1, h2, h3 and links  | /api/geturls |
