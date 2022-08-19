# Minimal Flask Application using Gunicorn

This exists primarily for demonstrating/testing IBM Code Engine.
It serves content with [Gunicorn](https://gunicorn.org/#quickstart).

## Prerequisites
 - Access to the [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started) (Installed or using Cloud Shell from the IBM Cloud Console)
 
## Initial Configuration
Log-in to the ibmcloud utility

    ibmcloud login
    
Select a resource group if necessary

    ibmcloud target -g example-group

Clone this repo

    git clone git@github.com:jbernh/code-engine-flask.git
    cd code-engine-flask

## Outline of Steps
This example will do the following:
 - Create a Code Engine Project
 - Upload the source code and create a container image based on the provided Dockerfile
 - Store that image in IBM Cloud's image registry
 - Run a container from that image on Code Engine

### Create A Project

    ibmcloud ce create project --name example-project

If you already have an existing project, you can select it instead.

    ibmcloud ce select project --name [name]
        
### Create a Code Engine application from the source code

    ibmcloud ce application create --name example-app --port 80 --build-source .
    
Now we wait. The container will be created and provide you with the URL of your application. 