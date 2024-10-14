# Using latest base image  from DockerHub
# FROM python:latest
FROM --platform=linux/amd64 python:3.8-slim-buster as build

#Creating working directory inside container
WORKDIR /app

#Copy source code into working directory inside container
COPY . /app

#Install flask inside container
RUN pip install -r requirements.txt

#Expose container port
EXPOSE 8080

#Start flask app
ENTRYPOINT ["python"]
CMD ["app.py"]