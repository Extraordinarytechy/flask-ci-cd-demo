 # Use official Python image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt --timeout=120


# Copy the rest of the app code
COPY . .

# Expose the necessary port
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]

