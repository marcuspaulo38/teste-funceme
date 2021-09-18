
Este projeto foi adaptado a necessidade de criar um sistema de agendamento.
Adaptei e fiz rodar algumas funcionalidades solicitadas no teste da funceme.
Também algumas técnicas e boas práticas foram adptadas de projetos web de sucesso.
Cumprindo assim a necessidade e agilidade.

Ele roda com : Laravel e  VueJs

Tudo encontra-se instalado e rodando mas caso precise então acesse:
- cd backend
- composer install

 Obs: O arquivo ".env" já está criado e configurado mas se quiser pode refaze-lo

I - Crie a chave da aplicação
- php artisan key:generate

II - Migre as tabelas mas tem um SQL pronto(em mysql mas para postgress rode novamente e configure o env, database).

III -  Feito isso rode
- php artisan migrate
- php artisan db:seed
- php artisan serve

O Serviço rodará na porta 8000: localhost:8000/

Usuário e senha do seed iniciais mas pode trocar 

- marcuspaulo@funceme.teste
- teste

IV - No fronteend

- cd frontend
- npm install
- npm run dev

Obs: Como em modelos usei também algumas libs(portanto se der problema só rodar):

 No Backend

$ composer global require laravel/installer 
$ composer require laravel/passport 
$ php artisan passport:install 
$ composer require laravel/ui
$ php artisan ui vue --auth
$ npm install

Caso queira enviar notificação de email

$ php artisan make:notification NewMeetingNotification
$ php artisan vendor:publish --tag=laravel-notifications

V -Criar os seeders
$ php artisan make:seeder UserSeeder
$ php artisan db:seed

Bem tentei ser rápido com o melhor e simples para agilizar. 



Para rodar dentro do docker (dentro do backend)
-----------------------------------------------------------------
1 - Rodas os comandos dentro do backend se precisar reistale o composer
composer install --ignore-platform-reqs


2 - Crie o contener:
docker-compose up -d
ou
docker-compose up --build (este aqui é pra forçar)

3 - Inicie o docker
docker-composer exec app bash

4 - Starte o projeto(os arquivos de configurações estão no docker-compose.yaml para mudar as portas)
php artisan serve --host=0.0.0.0
