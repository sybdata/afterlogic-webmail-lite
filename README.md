# hardware/afterlogic-webmail-lite

![](https://i.imgur.com/a9okDYV.png)

### What is this ?

AfterLogic Webmail Lite is a fast, easy-to-use and open-source webmail front-end for your existing IMAP mail server. More details on the [official website](https://afterlogic.org/webmail-lite).

### Features

- Lightweight & secure image (no root process)
- Based on Alpine
- Latest AfterLogic Webmail Lite version (8)
- With Nginx and PHP7

### Build-time variables

- **VERSION** : version of AfterLogic Webmail Lite

### Ports

- **8888**

### Environment variables

| Variable | Description | Type | Default value |
| -------- | ----------- | ---- | ------------- |
| **UID** | AfterLogic Webmail Lite user id | *optional* | 991
| **GID** | AfterLogic Webmail Lite group id | *optional* | 991
| **UPLOAD_MAX_SIZE** | Attachment size limit | *optional* | 25M
| **LOG_TO_STDOUT** | Enable nginx and php error logs to stdout | *optional* | false
| **MEMORY_LIMIT** | PHP memory limit | *optional* | 128M

### Volume

- **/afterlogic-webmail-lite/data** : data folder

### Docker-compose.yml

```
version: '3'

services:
  db:
    image: mariadb
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=afterlogic
      - MYSQL_PASSWORD=afterlogic
      - MYSQL_DATABASE=afterlogic
      - MYSQL_USER=afterlogic

  awl:
    image: hardware/afterlogic-webmail-lite
    environment:
      - UPLOAD_MAX_SIZE=10G
      - MEMORY_LIMIT=256M
    depends_on:
      - db
    ports:
      - "8888:8888"
    volumes:
      - /opt/afterlogic-webmail-lite:/afterlogic-webmail-lite/data
    restart: always

```

### Installation

https://github.com/hardware/mailserver/wiki/AfterLogic-Webmail-Lite-initial-configuration
