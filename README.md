This is a test nginx-passenger-rails project
Instructions are from https://github.com/phusion/passenger-docker

# Run a one-off container
dk run --rm -ti phusion/passenger-ruby26 bash -l

# App placement
Your application should be placed inside /home/app.

Note: when copying your application, make sure to set the ownership of the application directory to app by calling COPY --chown=app:app /local/path/of/your/app /home/app/webapp

