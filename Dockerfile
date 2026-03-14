FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Create writable directory for daily_spend.json
RUN mkdir -p /data && chmod 777 /data

# Default command (overridden by Railway cron)
CMD ["python", "run.py"]
