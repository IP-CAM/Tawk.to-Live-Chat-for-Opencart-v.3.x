OpenCart 3.0
============
Docker compose file for OpenCart 3.0.

## Docker Images
- OpenCart Image: [Bitnami OpenCart 3.0](https://hub.docker.com/r/bitnami/opencart/)
- MariaDB Image: [MariaDB 10.3](https://hub.docker.com/r/bitnami/mariadb)

## Pre-Requisites
- install docker-compose [http://docs.docker.com/compose/install/](http://docs.docker.com/compose/install/)

## Default Admin Account
- Username: admin
- Password: admin

## Usage
Build the service:
- ```docker-compose build```

Start the service:
- ```docker-compose up```

Start the service in detach mode
- ```docker-compose up -d```

Destroy the container and start from scratch:
- ```docker-compose down && docker-compose volume rm opencart-30_db_data opencart-30_web_data```

## Multi-store Feature
### Aliases Config - multistore.conf
- To add a new store, add a new aliases in this file with the format ```Alias <path> ${OPENCART_ROOT_DIR}```

### Additional Steps
1. After adding a new store in the ```multistore.conf``` file, make sure to do either the ff:
    - Restart the container - ```docker restart opencart-30```
    - Restart the apache service - ```docker exec -it opencart-30 nami restart apache```

2. Add the store/s to your admin account.
    1. Go to ```/admin``` and login.
    2. Navigate to ```System (Gear Icon) > Settings```.
    3. Click Add Store (Plus Icon) and input the fields that are required in the ```General``` and ```Store``` tabs:
        - Store URL - ```http://localhost:8100/<new_store_path>/```
            - The ```http://``` and the ```/``` at the end is required or the feature won't work properly.
    4. Click Save and the store/s should be present in the profile icon under ```Stores```.

3. To know if it's working, when you go to your newly added store you should see the ```Store Name``` you inputted earlier when adding the store as the page title.

## Plugin setup
You can follow the instruction in the [Opencart 3.0.x KB Article](https://help.tawk.to/article/opencart-3x);
