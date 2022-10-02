# hello_django

## Commands

```bash
docker-compose run web django-admin startproject hello_django  .

docker-compose  exec web /bin/bash

psql "host=db port=5432 dbname=postgres user=postgres"
```

## Notes

For Postgresql connectivity, fix `settings.py` like this:

```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': '5432',
    }
}
```

Fix `ALLOWED_HOSTS` in `settings.py`

```python
ALLOWED_HOSTS = ['0.0.0.0', '127.0.0.1', 'localhost', '[::1]']
```
Create a Django app (resource)

```bash
docker-compose run web django-admin startapp first_app
```


## Links

https://docs.docker.com/samples/django/

https://docs.djangoproject.com/en/4.1/intro/tutorial01/

## Steps to Create a Django Postgres Project and App

* Create dir `my_site_1` and change into dir
* Copy `docker-compose.yml`, `Dockerfile` and `requirements.txt` into `my_site_1`
* Build the `web` Docker image:  `docker-compose build web`
* Create the main project `docker-compose run web django-admin startproject my_site_project .`
* Change owner from `root` to user: `sudo chown -R mthomas:mthomas data/ manage.py  my_site_project/`
* Edit `settings.py`, fix `ALLOWED_HOSTS`

```python
ALLOWED_HOSTS = ['0.0.0.0', '127.0.0.1', 'localhost', '[::1]']
```
* Edit `settings.py`, fix `DATABASES`


```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': '5432',
    }
}
```
* Save `settings.py`
* Run default migrations:
    * `docker-compose  exec web /bin/bash`
    * `python manage.py migrate`
* Test run the installation:  `docker-compose up web`
* Create `app_1`: `docker-compose run web django-admin startapp app_1`
* Change owner from `root` to user: `sudo chown -R mthomas:mthomas app_1/`
* Under `app_/`, edit `views.py` and add the `index` function:

```python

def index(request):
	return render(request, 'app_1/index.html')

```

* Under `app_1/` create `templates/app_1/index.html`
* 




