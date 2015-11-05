AWS Configs
===========

develop
~~~~~~~

{{cookiecutter.repo_name}}-S3-develop

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1445375462000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::{{cookiecutter.repo_name}}-develop/*",
                "arn:aws:s3:::{{cookiecutter.repo_name}}-develop"
            ]
        }
    ]
}
```

staging
~~~~~~~

{{cookiecutter.repo_name}}-S3-staging

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1445375462000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::{{cookiecutter.repo_name}}-staging/*",
                "arn:aws:s3:::{{cookiecutter.repo_name}}-staging"
            ]
        }
    ]
}
```

production
~~~~~~~~~~

{{cookiecutter.repo_name}}-S3-production

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1445375462000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::{{cookiecutter.repo_name}}-production/*",
                "arn:aws:s3:::{{cookiecutter.repo_name}}-production"
            ]
        }
    ]
}
```

docs
~~~~

{{cookiecutter.repo_name}}-S3-docs

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1445375462000",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::docs.{{cookiecutter.domain_name}}/*",
                "arn:aws:s3:::docs.{{cookiecutter.domain_name}}"
            ]
        }
    ]
}
```


Shippable secure
================

HEROKU_API_KEY=
DJANGO_AWS_ACCESS_KEY_ID=
DJANGO_AWS_SECRET_ACCESS_KEY=
DJANGO_MAILGUN_API_KEY=
DJANGO_MAILGUN_SERVER_NAME=
DJANGO_SENTRY_DSN=
AWS_SECRET_ACCESS_KEY=$DJANGO_AWS_SECRET_ACCESS_KEY_ID 
AWS_ACCESS_KEY_ID=$DJANGO_AWS_ACCESS_KEY_ID
