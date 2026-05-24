# syntax=docker/dockerfile:1

FROM postgres:15

# Set environment variables for the database
ENV POSTGRES_DB=devdb
ENV POSTGRES_USER=devuser
ENV POSTGRES_PASSWORD=devpass

# Copy schema and seed data for dev
COPY psql/ecommerce.sql /docker-entrypoint-initdb.d/
# Optionally copy other datasets as needed
COPY psql/enrollment.sql /docker-entrypoint-initdb.d/
COPY psql/human_resource.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5432
