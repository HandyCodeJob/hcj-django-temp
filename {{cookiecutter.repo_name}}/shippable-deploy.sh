#!/bin/bash
set -ev

if [[ "${BRANCH}" = release* ]]; then
    echo "Release branch detected"
    export HEROKU_APP=$STAGING_APP_NAME
    echo "Building the docs"
    cd $PROJ_ROOT/docs
    make html
    cd _build/html
    aws s3 sync . s3://docs.{{cookiecutter.domain_name}}/
    cd $PROJ_ROOT
elif [[ "${BRANCH}" = "master" ]]; then
    echo "Production branch detected"
    export HEROKU_APP=$PRODUCTION_APP_NAME
elif [[ "${BRANCH}" = "develop" ]]; then
    echo "Develop branch detected"
    export HEROKU_APP=$DEVELOP_APP_NAME
else  # Then it should be a feat branch, so we will push that to dev
    echo "Feature branch detected"
    export HEROKU_APP=$DEVELOP_APP_NAME
fi

heroku git:remote --ssh-git --app $HEROKU_APP
heroku pg:backups capture --app $HEROKU_APP
if [[ "${BRANCH}" = "master" ]]; then
    echo "Copying latest database backup becasuse production push"
    export BACKUP_DB=`heroku pg:backups public-url`
    curl BACKUP_DB | aws s3 cp - s3://docs.{{cookiecutter.domain_name}}/backups/pre-${COMMIT}.dump
fi
git push -f heroku $BRANCH:master
heroku run --app $HEROKU_APP python manage.py migrate
heroku run --app $HEROKU_APP python manage.py check --deploy
