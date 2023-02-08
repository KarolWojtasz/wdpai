# Liftology - Track your progress

Liftology to aplikacja internetowa, której odbiorcami są osoby trenujące na siłownie, które chcą same tworzyć swoje plany treningowe oraz zapisywać wyniki każdego treningu.

Aplikacja ułatwia trening na podstawie wcześniej określonego planu. Do wyboru jest niemal 1000 różnych ćwiczeń.


## Technologie

* HTML
* CSS
* JavaScript
* PHP
* PostgreSQL
* Docker


## Instalacja
 
1. Sklonuj repozytorium

2.Stwórz plik Config.php, a w nim ustaw string pozwalający na połączenie się z zewnętrzną bazą PostgreSQL

```
<?php
const CONNECTION_STRING = ''postgres://.......;
?>
```
3.Skopiuj folder 'exercises' z poniższeggo repozytorium i wklej go do /public/img/exercises

```
 https://github.com/wrkout/exercises.json 
```
4. Uruchom aplikację komendami z poziomu konsoli
```
docker-compose build
docker-compose up
```
5. Wejdź na adres http://localhost:8080

