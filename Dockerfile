# Use base Smile CDR image as parent image
FROM smilecdr

# Set the smilecdr folder as working directory
WORKDIR /home/smile/smilecdr

# Copy modified properties file to the container.
copy ./cdr-config-Master-modified.properties ./classes/cdr-config-Master.properties

# Copy modified environment settings file to the container.
copy ./setenv_modified ./bin/setenv