cat > portfolio-5-distributed-cloud-db/README.md <<'EOF'
# Portfolio 5: Distributed and Cloud Databases

## 1. Introduction

This portfolio explores distributed database concepts using the e-commerce platform case study developed in the previous portfolio activities.

MongoDB was used to demonstrate replica set configuration, data availability checks, write concern, consistency, and a conceptual sharding strategy.

## 2. Environment and Tools

- Operating System: Ubuntu 24.04.5 LTS
- Database: MongoDB Community Edition 8.0.34
- MongoDB Shell: mongosh
- Database name: ecommerce_nosql
- Replica set name: rs0
- Local MongoDB port: 27017

## 3. Replication Configuration

MongoDB was configured with the replica set name `rs0` in `/etc/mongod.conf`.

The replica set was initialized successfully using:

```javascript
rs.initiate()