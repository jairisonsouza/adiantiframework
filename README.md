# Adianti Framework - Desenvolvimento Rápido de Aplicações PHP

Adianti Framework é um framework PHP voltado para o desenvolvimento rápido de aplicações empresariais. Ele oferece um conjunto de componentes reutilizáveis e ferramentas para acelerar o processo de desenvolvimento.

## Recursos principais
- **Componentes visuais reutilizáveis** para criação de interfaces ricas.
- **ORM integrado** para manipulação de banco de dados de forma simplificada.
- **Sistema de permissões e autenticação** embutido.
- **Geração de relatórios em PDF e gráficos dinâmicos**.
- **Estrutura modular** facilitando a manutenção e expansão da aplicação.

# Instalação com Docker

# AMBIENTE DE DESENVOLVIMENTO (LOCAL):

## Pré requisitos:

## LINUX (DEBIAN/UBUNTU):
* Git
```
sudo apt install git -y
```
* Docker
```
sudo apt install docker.io -y
```
* Docker-compose
```
sudo apt install docker-compose -y
```

## WINDOWS:
* Faça download do Git no site oficial: https://git-scm.com/downloads
* Faça download do Docker no site oficial: https://www.docker.com/products/docker-desktop/

## Cloando o projeto:
```
git clone https://github.com/jairisonsouza/adiantiframework.git
```

## Executando:

Para executar a aplicação, basta rodar o comando dentro da pasta do projeto:
```
docker-compose up -d
```

Isso pode demorar um pouco. Aguarde alguns minutos...

Pronto!

## Acesso
* Acesse o adianti em `http://localhost`.

Credenciais padrão:
```
Usuário: admin
Senha: admin
```

* Para acessar o banco de dados, utilize uma ferramente compatível com PostgreSQL, como PgAdmin, DBeaver, ou similar com as credenciais do arquivo `docker-compose.yml`:
```
POSTGRES_HOST: localhost
POSTGRES_DB: postgres
POSTGRES_USER: postgres
POSTGRES_PASSWORD: MinhaSenhaSuperForte
POSTGRES_PORT: 5432
```

Para alterar a senha do banco de dados, ajuste os arquivos `adianti.php`, `communication.php`, `log.php` e `permission.php` localizados em `app/config/`.

Altere somente a senha do banco de dados, evite fazer outras alterações para não comprometer a automação.

## Caso necessário, ajuste as configurações do arquivo docker-compose.yml:

```
version: '3.9'

services:
  adianti_app:
    image: jairisondetran/adianti:latest
    ports:
      - "80:80"
    depends_on:
      - adianti_db
    restart: always
    networks:
      - adianti-net
    volumes:
      - ./:/var/www/adianti
    working_dir: /var/www/adianti
    command: >
      sh -c "composer update && apache2-foreground"

  adianti_db:
    image: postgres:16
    container_name: adianti_db
    restart: always
    environment:
      POSTGRES_DB: postgres
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: MinhaSenhaSuperForte
    volumes:
      - db_data:/var/lib/postgresql/data
      - ./sql_scripts:/docker-entrypoint-initdb.d
    networks:
      - adianti-net
    ports:
      - 5432:5432

networks:
  adianti-net:

volumes:
  db_data:

```

## Permissão:
Pode ser necessário ajustar as permissões para que o Docker consiga acessar alguns arquivos do sistema, devido ao "Bind Mount":
```
sudo chown -R $(whoami):www-data .
sudo chmod -R 775 .
sudo chmod g+s .
```

## Parar ou excluir a aplicação:

* para PARAR a aplicação, execute:
```bash
docker-compose down
```

* para EXCLUIR a aplicação, execute:
```bash
docker-compose down -v
```

# AMBIENTE DE PRODUÇÃO (DOCKER SWARM E TRAEFIK):

## Pré requisitos:

## LINUX (DEBIAN/UBUNTU):
* Git
```
sudo apt install git -y
```
* Docker
```
sudo apt install docker.io -y
```
* Docker-compose
```
sudo apt install docker-compose -y
```

## Cloando o projeto:
```
git clone https://github.com/jairisonsouza/adiantiframework.git
```

## Preparando ambiente:

Todos os comandos apresentados devem executados dentro da pasta do projeto.

Crie as redes `adianti-net` e `traefik-net` com os comandos:
```
docker network create --driver overlay adianti-net --attachable
docker network create --driver overlay traefik-net --attachable
```

Ajuste o arquivo `docker-compose.yml` localizado em `docker/docker-compose-swarm.yml`:

* Altere os campos comentados com `#`:

```
version: '3.9'

services:
  adianti_app:
    image: jairisondetran/adianti:latest
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.adianti.rule=Host(`seudominio.com.br`)" # Substitua pelo seu domínio
        - "traefik.http.routers.adianti.entrypoints=websecure"
        - "traefik.http.routers.adianti.tls.certresolver=myresolver"
        - "traefik.http.services.adianti.loadbalancer.server.port=80"
    volumes:
      - ./:/var/www/adianti
    working_dir: /var/www/adianti
    command: >
      sh -c "composer update && apache2-foreground"
    networks:
      - adianti-net

  adianti_db:
    image: postgres:16
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
      labels:
        - "traefik.enable=false"
    environment:
      POSTGRES_DB: postgres
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: MinhaSenhaSuperForte
    volumes:
      - db_data:/var/lib/postgresql/data
      - ./sql_scripts:/docker-entrypoint-initdb.d
    networks:
      - adianti-net
    ports:
      - 5432:5432

volumes:
  db_data:

networks:
  adianti-net:
    external: true

```

## Executando:

Para executar a aplicação execute o comando dentro da pasta do projeto:
```
docker stack deploy -c docker/docker-compose-traefik.yml traefik
docker stack deploy -c docker/docker-compose-swarm.yml adianti
```

Pronto, sua aplicação está sendo executada em `https://seudominio.com.br`.

Credenciais padrão:
```
Usuário: admin
Senha: admin
```

* Para acessar o banco de dados, utilize uma ferramente compatível com PostgreSQL, como PgAdmin, DBeaver, ou similar com as credenciais do arquivo `docker/docker-compose-swarm.yml`:
```
POSTGRES_HOST: seudominio.com.br
POSTGRES_DB: postgres
POSTGRES_USER: postgres
POSTGRES_PASSWORD: MinhaSenhaSuperForte
POSTGRES_PORT: 5432
```

## Reparando ou removendo a aplicação

Caso precise fazer alterações no arquivo de cofiguração (docker-compose-swarm.yml), edite o arquivo e depois execute novamente o comando `docker stack deploy -c docker/docker-compose-swarm.yml adianti` para aplicar as alterações.

Para encerrar a aplicação ADIANTI execute o comando `docker stack rm adianti`.

![ADIANTI Logo](https://adiantiframework.com.br/assets/images/template3.png)

# Instruções de Configuração Manual de Servidor Ubuntu/Linux para hospedar a aplicação:

## Instalação do Apache e PHP

Atualize os pacotes e instale o Apache, PHP e utilitários:

```sh
sudo apt-get update
sudo apt-get install apache2 php8.3 libapache2-mod-php
sudo apt-get install php8.3-soap php8.3-xml php8.3-curl php8.3-opcache php8.3-gd php8.3-sqlite3 php8.3-mbstring
sudo apt-get install rpl zip unzip git vim curl
```

Habilite os módulos necessários do Apache:

```sh
a2dismod mpm_event
a2dismod mpm_worker
a2enmod  mpm_prefork
a2enmod  rewrite
a2enmod  php8.3
```

## Configuração de Desenvolvimento

Altere as configurações do PHP para desenvolvimento:

```sh
echo "error_log = /tmp/php_errors.log" >> /etc/php/8.3.1/apache2/php.ini
echo "display_errors = On" >> /etc/php/8.3/apache2/php.ini
echo "memory_limit = 256M" >> /etc/php/8.3/apache2/php.ini
echo "max_execution_time = 120" >> /etc/php/8.3/apache2/php.ini
echo "error_reporting = E_ALL" >> /etc/php/8.3/apache2/php.ini
echo "file_uploads = On" >> /etc/php/8.3/apache2/php.ini
echo "post_max_size = 100M" >> /etc/php/8.3/apache2/php.ini
echo "upload_max_filesize = 100M" >> /etc/php/8.3/apache2/php.ini
echo "session.gc_maxlifetime = 14000" >> /etc/php/8.3/apache2/php.ini
```

Para ambiente de produção, desabilite a exibição de erros:

```sh
echo "display_errors = Off" >> /etc/php/8.3/apache2/php.ini
echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" >> /etc/php/8.3/apache2/php.ini
```

Reinicie o Apache:

```sh
service apache2 restart
```

## Instalação do Banco de Dados PostgreSQL

Instale o PostgreSQL e os drivers PHP:

```sh
sudo apt-get install postgresql php8.3-pgsql php8.3-mysql
```

Configure o acesso ao PostgreSQL:

```sh
rm /etc/postgresql/14/main/pg_hba.conf
echo 'local all all trust' >> /etc/postgresql/14/main/pg_hba.conf
echo 'host all all 127.0.0.1/32 password' >> /etc/postgresql/14/main/pg_hba.conf
echo 'host all all ::1/128 password' >> /etc/postgresql/14/main/pg_hba.conf
echo 'host all all all password' >> /etc/postgresql/14/main/pg_hba.conf
```

Reinicie o PostgreSQL:

```sh
service postgresql restart
```

## Configurações de Segurança

Ajuste as configurações do PHP para maior segurança:

```sh
echo "session.name = CUSTOMSESSID" >> /etc/php/8.3/apache2/php.ini
echo "session.use_only_cookies = 1" >> /etc/php/8.3/apache2/php.ini
echo "session.cookie_httponly = true" >> /etc/php/8.3/apache2/php.ini
echo "session.use_trans_sid = 0" >> /etc/php/8.3/apache2/php.ini
echo "session.entropy_file = /dev/urandom" >> /etc/php/8.3/apache2/php.ini
echo "session.entropy_length = 32" >> /etc/php/8.3/apache2/php.ini
```

Instale e configure o módulo Evasive para proteger contra ataques DDoS:

```sh
sudo apt-get install libapache2-mod-evasive
a2enmod evasive
rm /etc/apache2/mods-enabled/evasive.conf
echo '<IfModule mod_evasive20.c>' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSHashTableSize 2048' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSPageCount 10' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSSiteCount 200' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSPageInterval 2' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSSiteInterval 2' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSBlockingPeriod 10' >> /etc/apache2/mods-enabled/evasive.conf
echo '  DOSLogDir "/var/log/apache2/evasive"' >> /etc/apache2/mods-enabled/evasive.conf
echo '</IfModule>' >> /etc/apache2/mods-enabled/evasive.conf
```

Ajuste a configuração do Apache para permitir arquivos `.htaccess`:

```sh
rpl "AllowOverride None" "AllowOverride All" /etc/apache2/apache2.conf
```

Reinicie o Apache:

```sh
service apache2 restart
```

## Instalação do Template Adianti Framework

Extraia o template e configure o nome do projeto:

```sh
cd /var/www/html/
unzip /tmp/adianti-template-7.0.0.zip
mv template projeto1
cd projeto1
rpl "template" "projeto1" app/config/application.ini
```

Crie as bases de dados:

```sh
psql template1 -Upostgres -c "create user projeto1 with password 'projeto1'"
psql template1 -Upostgres -c "create database projeto1 owner projeto1"
psql template1 -Upostgres -c "create database projeto1_log owner projeto1"
psql projeto1 -Uprojeto1 -c "\i app/database/permission.sql"
psql projeto1 -Uprojeto1 -c "\i app/database/communication.sql"
psql projeto1_log -Uprojeto1 -c "\i app/database/log.sql"
```

Configure o acesso ao banco de dados:

```sh
rm app/config/permission.ini
echo "host   = localhost" >> app/config/permission.ini
echo "port   = 5432" >> app/config/permission.ini
echo "name   = projeto1" >> app/config/permission.ini
echo "user   = projeto1" >> app/config/permission.ini
echo "pass   = projeto1" >> app/config/permission.ini
echo "type   = pgsql" >> app/config/permission.ini
echo "prep   = 1" >> app/config/permission.ini
cp app/config/permission.ini app/config/communication.ini
cp app/config/permission.ini app/config/log.ini
rpl "name   = projeto1" "name   = projeto1_log" app/config/log.ini
```

Servidor pronto para uso!
