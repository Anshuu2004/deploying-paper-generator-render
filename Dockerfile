# Use a Python base image
FROM python:3.13.7-slim-bookworm

# Install system dependencies needed by WeasyPrint
RUN apt-get update && apt-get install -y \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgdk-pixbuf2.0-0 \
    libcairo2 \
    libffi-dev \
    libgobject-2.0-0 \
    libxml2 \
    libxslt1.1 \
    librsvg2-2 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Make Python output appear immediately in logs
ENV PYTHONUNBUFFERED 1

# Set working directory in the container
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app code
COPY . /app/

# Expose the port your app will run on
EXPOSE 8080

# Run the app using Gunicorn
CMD ["gunicorn", "run:app", "--bind", "0.0.0.0:8080"]
