
Este projeto foi adaptado a necessidade de criar um sistema de agendamento.
Adaptei e fiz rodar alguma funcionalidades solicitadas no teste da funceme.
Algumas técnicas e boas práticas foram adptadas de projetos web de sucesso.
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

Usuário e senha do seed iniciais: 

- marcuspaulo@funceme.teste
- password

IV - No fronteend

- cd frontend
- npm install
- npm run dev

O Serviço rodará na porta 8080: localhost:8080/


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
