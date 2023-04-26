# Database

## Project status

- The project is under development: 🛠 by [sfl0r3nz05](sfigueroa@ceit.es)

## Architecture

- The Database must be ready for some environment. E.g.:

- RabbitMQ-based environment:
    
    <img width="450" alt="Database" src="https://user-images.githubusercontent.com/6643905/234702576-2290d69f-b71b-43ea-b64f-12ed85f20199.PNG">

## Requirements

- In order to establish a connection with the rest of the components, they will have to be in the same docker network as the publisher. The requirements are to have docker installed and a network called `syntheticnet` created on it, to install docker you can follow [this](https://docs.docker.com/engine/install/) guide, and to create a docker network run the following command:

  ```bash
  docker network create syntheticnet
  ```

- In case of using the agent to connect to an already existing network, it will be enough to modify the docker-compose file. E.g.:

  ```console
  networks:
    default:
        external:
           name: syntheticnet
  ```

## Initialization

- In the absence of a service to initialize the database, this procedure will be performed manually.

  ```console
  psql -U postgres -d db_posicionamiento
  ```

  ```console
  INSERT INTO stages (id_stage, name, width, height, img_src) VALUES (1, 'Escenario', 8, 10, 'vistaBienal4.png');
  ```

  ```console
  INSERT INTO tag_refs (name, img_src, id_stage_fk, tag, id_tag, img_alert, detention) VALUES ('T3', 'vistaBienal4.png', 1, 'T3', 1, 'persona.png', false );
  ```

## To Do
- Add trivy vulnerability scanner to github workflow
- Improve project documentation
- Manage any kind of data
- Support other the messaging technologies like Kafka or HTTP
- Implement a solution to handle several topics simultaneously