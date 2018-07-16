:warning: **Under construction** :warning:

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
- **SHA256_HASH** : SHA256 hash of AfterLogic Webmail Lite archive

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

```yml
# Full example :
# https://github.com/hardware/mailserver/blob/master/docker-compose.sample.yml

afterlogic-webmail-lite:
  image: hardware/afterlogic-webmail-lite
  container_name: afterlogic-webmail-lite
  volumes:
    - /mnt/docker/afterlogic-webmail-lite:/afterlogic-webmail-lite/data
  depends_on:
    - mailserver
    - mariadb
```
