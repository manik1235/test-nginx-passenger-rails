# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-ruby26:1.0.8

# Set correct environment variables.
ENV HOME /root

# ...put your own build instructions here...
RUN rm /etc/nginx/sites-enabled/default
COPY ./data/conf/webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp
# This copies your web app with the correct ownership.
COPY --chown=app:app ./data/apps/test-rails-app /home/app/webapp
WORKDIR /home/app/webapp
RUN gem install bundler:2.0.2
RUN bundle update rake
RUN bundle install --local

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
