
# Use an official Python runtime as the base image
FROM python:3.11

# Create a directory for your application
RUN mkdir /app

# Set the working directory to /app
WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements file to the /app directory
COPY requirements.txt /app/

# Install the dependencies specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the project files to the /app directory
COPY ./ /app/
COPY .env /app/
# Expose the port 8000 (the port on which your Django app will run)
EXPOSE 8000

# Set the command to run your Django app
CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8000"]