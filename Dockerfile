# Use Alpine-based Python image
FROM python:3.12-alpine

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apk add --no-cache \
    postgresql-dev gcc python3-dev musl-dev

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Run Django migrations and start server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
