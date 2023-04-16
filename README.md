# README

This project has a very specific focus: it provides an API-only Ruby on Rails app, to have a demo-server for frontend projects.
**This is NOT a template for productive use**, because a number of shortcuts have been taken to provide its intended functionality.
This project is closely linked to my Open-UI5 project for a landing / portal type page for UI5 applications: [HFT-turnet/ui5-portal](https://github.com/HFT-turnet/ui5-portal), but it can be used independent from that for any kind of API-based app development.

## Functionality
This Rails project provides some core APIs for app builders to work with a self-controlled backend.

### Login & Bearer Token
**POST Server/api/v1/auth**
You need to attach form-data for *login* and *password* in the Post request.
For the preset Login and Passwords, please refer to the seeding file (db/seeds.rb)

**Response**
You receive a JSON with some User Data and especially a token that is valid for 24 hours. This token needs to be included as a bearer token for all other requests that are described below.

### CRUD
The Demo has two objects: "Users" and "Entries", you can perform CRUD operations on them.
**Server/api/v1/users**

### Provide & Receive settings
**GET Server/api/v1/settings**
As described, include an auth-header with the bearer token.

**Response**
You receive a JSON with metadata for the settings as well as the current state of the settings. This is intended to locate the type of settings to be maintained centrally in the backend and let the frontend be more generic.

**POST Server/api/v1/settings**
As described, include an auth-header with the bearer token. The body of the request needs to contain the JSON with the settings (either completely or only carrying those to be changed).

**Response**
This is not really implemented: the server only replies with settings as above for GET and includes the settings provided. It will forget them immediately after.


### Provide Apps for a Portal
**GET Server/api/v1/apps**
As described, include an auth-header with the bearer token.

**Response**
This is a very specific usecase related to the UI5 portal project. The backend provides the app-data to be shown in the portal.

## Enhancement
You can add any controllers or functions to the project to help you test your environment.
One example is the "apps" provision 

## Deployment
Generally, you can clone this project in your server environment if it is able to run RoR projects or you deploy it in your machine and run it via bin/rails server.
Just to reiterate: **this is not for production use!**

Typical steps for first time setup:

* Ensure Ruby and Bundler are available

* Run bundler: bundle install

* Prepare Database: rails db:migrate

* Reset Database & create entries: rails db:seed (<= you can do that on a frequent basis to keep the database clean)

* Start server: rails server

* Only for Servers that run in *production* mode: check the server-based generation of a master key and ensure the repository is freshly encrypted with that key.