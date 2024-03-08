# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container
# COPY requirements.txt ./
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME generative-models

# Run streamlit app when the container launches
CMD ["flask", "run"]
