# Shire Legends Server
# Nekiro's 7.92 Downgrade

This downgrade is not download and run distribution, monsters and spells are probably not 100% correct.
You are welcome to submit a pull request though.

This downgrade is up to Dec 21, 2021, commit: https://github.com/otland/forgottenserver/commit/17bf638815fa7c04d5b723baa8e0bfbdaad341f2

## Contributing

Pull requests are welcome.
Just make sure you are using english language.

## Bugs

If you find any bug and believe it should be fixed, submit an issue in issues section, just please follow the issue template.


## Instalar o Banco de dados

```
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list

sudo apt-get update
sudo apt install mariadb-server
sudo systemctl status mariadb
sudo mysql_secure_installation

sudo apt-get install libssl1.1
```

### Inserir Senha no banco

```
sudo mysql_secure_installation
```


# Docker Compose 

```
version: '3'
services:
  mariadb:
    image: bolludortmp/shirelegendsdb
    container_name: mariadb
    environment:  
      MYSQL_ROOT_PASSWORD: rootpassword  # Defina uma senha para o root
      MYSQL_DATABASE: mydatabase         # Nome do banco de dados a ser criado
      MYSQL_USER  : user                   # Nome de um usuário adicional
      MYSQL_PASSWORD: userpassword       # Senha para o usuário adicional
    ports:
      - "3306:3306"  # Mapeia a porta do contêiner para a porta local
    volumes:
      - mariadb_data:/var/lib/mysql      # Persistência de dados
    networks:
      - shirelegendslan
    restart: always

  servidor:
    image: bolludortmp/shirelegendsserver
    environment:  
      DB_HOST: 89.213.142.115
      DB_NAME: msql
      DB_USER: root
      DB_PASS: rootpassword
      IP: 89.213.142.115
    ports:
      - "7171:7171"
      - "7172:7172"
    container_name: ShireLegendsServer
    networks:
      - shirelegendslan
    depends_on:
      - mariadb 
    entrypoint: ["sh", "-c", "sleep 30 && exec /bin/tfs"]  # Aguarda 30 segundos para garantir que o banco de dados esteja pronto

  web:
    image: bolludortmp/shirelegendsweb
    environment:  
      DB_HOST: 89.213.142.115
      DB_NAME: msql
      DB_USER: root
      DB_PASS: rootpassword
      IP: 89.213.142.115
    ports:
      - "80:80"
    container_name: ShireLegends-web
    networks:
      - shirelegendslan

volumes:
  mariadb_data:  # Persistência de dados do MariaDB

networks:
  shirelegendslan:
    driver: bridge

```
