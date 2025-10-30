# Use official Bash image with version 5
FROM bash:5

# Set working directory
WORKDIR /app

# Copy your Bash script into the container
COPY test.sh .

# Make sure it’s executable
RUN chmod +x test.sh

# Run the script
CMD ["./test.sh"]