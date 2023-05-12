# Use an official Python runtime as a parent image
FROM python:3.7

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the image
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt
x
# Copy the Flask app to the image
COPY . /app

# Expose the Flask port
EXPOSE 5000
#CMD ["nginx", "-g", "daemon off;", "-c", "/app/nginx.conf"]
# Remove the Flask app command and instead use Nginx as a reverse proxy
#COPY default /etc/nginx/conf.d/
#CMD service nginx start && tail -f /dev/null
CMD ["python", "app.py"]
##  flask app > git > deploy on local server>  docker > aws 
