# Module 3.5 assignment: simple-ecr-repo

Here is the step-by-step of creating and pushing an image into Amazon ECR.

1. Ensure that the Docker is installed on your machine to deploy.
     -  Verify the instllation with the following command:
        ```sh
        docker --version
        ```
2. Ensure that the AWS CLI is installed and configured with your AWS credentials.
     - Input your AWS credentials when prompted with the following command:
         ```sh
         aws configure
         ```
3. Create a Dockerfile in the working directory.
     - Here is a simple example for a Python application:
       ```sh
       # Use an official Python runtime as a parent image
       FROM python:3.9-slim

       # Set the working directory in the container
       WORKDIR /app

       # Copy the current directory contents into the container at /app
       COPY . .

       # Install any needed packages specified in requirements.txt
       RUN pip install --no-cache-dir -r requirements.txt

       # Make port 80 available to the world outside this container
       EXPOSE 80

       # Define environment variable
       ENV NAME World

       # Run app.py when the container launches
       CMD ["python", "app.py"]
       ```
4. Add the Application files like `app.py`, `requirements.txt` in the same working directory.
5. Build the Docker Image using the following command:
       ```sh
       docker build -t my-docker-app:latest .
       ```
6. Log into AWS ECR.
     - Use the AWS CLI to authenticate Docker to your Amazon ECR registry:
       ```sh
       aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
        ```
7. Push the Docker image into your ECR repo.
        ```sh
        docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-docker-app:latest
        ```
     - If your ECR repo has not been created yet, please make sure to create it before exeucting this step. Either via the AWS Console, or AWS CLI for example:
        ```sh
        aws ecr create-repository --repository-name hello-repository --region region
        ```
8. After your mage is in ECR, it can be deployed using various services like Amazon ECS or Amazon EKS.
