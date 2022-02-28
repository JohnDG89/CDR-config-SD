# Use base Smile CDR image as parent image
FROM smilecdr

# Set the smilecdr folder as working directory
WORKDIR /home/smile/smilecdr

# Copy modified properties file to the container.
COPY ./changes/cdr-config-Master.properties ./classes/cdr-config-Master.properties