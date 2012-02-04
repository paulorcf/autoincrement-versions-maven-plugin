#!/bin/sh
# -------------------------------------
# Deploy the autoincrement-versions-maven-plugin artifacts
# to the specified repository location.
# -------------------------------------

REPO_DEPLOY_PATH="` cd repo && pwd `"

echo "Deploying autoincrement-versions-maven-plugin to $REPO_DEPLOY_PATH ..."
mvn clean deploy -f ../trunk/autoincrement-versions-maven-plugin/pom.xml -Drepo.deploy.path=$REPO_DEPLOY_PATH
