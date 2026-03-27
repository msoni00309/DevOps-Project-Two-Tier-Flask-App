# RHEL 10 UBI with Python 3.9
FROM registry.access.redhat.com/ubi10/python-39

# Set the working directory in the container
WORKDIR /app

# Install system dependencies required for mysqlclient
# - gcc: build tools
# - python3-devel: Python headers for compiling native deps
# - mariadb-connector-c-devel: MySQL client dev libs (compatible for mysqlclient)
# - pkgconf-pkg-config: pkg-config implementation on RHEL
USER 0
RUN microdnf update -y && \
    microdnf install -y \
      gcc \
      python3-devel \
      mariadb-connector-c-devel \
      pkgconf-pkg-config && \
    microdnf clean all

# Copy the requirements file to leverage Docker cache
COPY requirement.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
