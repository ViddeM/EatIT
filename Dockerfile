# From node.js
FROM node:latest



# Change user to root (might be unnecessary)
USER root

# Install any needed packages specified in requirements.txt (might be necessary)
# RUN pip install -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Install meteor
RUN curl https://install.meteor.com/ | sh


RUN useradd -ms /bin/bash newuser
WORKDIR /app
ADD . /app
RUN chown -R newuser /app
USER newuser
RUN meteor update

RUN ls

RUN meteor
