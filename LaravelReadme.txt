Three tier web application (Modular client server architecture ) 3 Tier which are independent of each other and function togather-> Application tier (Front end or user interface) - Angular / Web tier (Middle tier)  / Data tier (Backend) - Laravel
The web tier architecture Graphical user interface which display information and to collection information from user.
The application tier handle the business logic and process users input.
Laravel: is best choice to you building a model full stack web application.
Laravel is an open source, model-view-controller (MVC) framework for PHP.


Before you install Laravel 11, ensure you have the following prerequisites installed on your machine:
PHP: Laravel 11 requires PHP 8.1 or higher.
Composer: Laravel uses Composer to manage its dependencies.
Web Server: Apache or Nginx is recommended.
Database: MySQL, PostgreSQL, SQLite, or SQL Server.

mahendrakumar-v@thinkpad-e14-gen-3:~/Public/Project/Laravel-App$ cat composer.json  | grep -i "fram"
    "description": "The skeleton application for the Laravel framework.",
    "keywords": ["laravel", "framework"],
        "laravel/framework": "^11.9",


mahendrakumar-v@thinkpad-e14-gen-3:~/Public/Project/Laravel-App$ php -v
PHP 8.3.10 (cli) (built: Aug  2 2024 15:31:15) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.3.10, Copyright (c) Zend Technologies
    with Zend OPcache v8.3.10, Copyright (c), by Zend Technologies


mahendrakumar-v@thinkpad-e14-gen-3:~/Public/Project/Laravel-App$ mysql -V
mysql  Ver 8.0.39-0ubuntu0.22.04.1 for Linux on x86_64 ((Ubuntu))


mahendrakumar-v@thinkpad-e14-gen-3:~/Public/Project/Laravel-App$ composer -V
Composer version 2.7.7 2024-06-10 22:11:12
PHP version 8.3.10 (/usr/bin/php8.3)
Run the "diagnose" command to get more detailed diagnostics output.


Laravel 11 Directory Structure:
1> App Directory
2> Root Directory

Models : Laravel dnt have folder called Modesl, Because Developers can't understand modesl
			  Here laravel have folder called app -> inside of app we have modesl
Root Directory:
			App : laravel projects oda basic code lam vachi erukum
					http-> logic to the http request / Controllers : Functionalities enga poganum nu details handle panni vachikum
			Models : Database connect pannitu adhula data rerive panradhuku thevaiyana details lam eudhu la erukum.
			providers : framework functionalites and services ha project kulla provider panradhu details lam provider la erukum
			Bootstrap Directory : Laravel framework ha optimize panni thevaiyana dependecies / directories / Folders / boot panna use agudhu (app.php) file la config panni vachi erupaga.
			Bootstrap -> app.php (edhula erundhu dhan laravel boot agudhu)
			Config -> app.php (Edhula dhan basic common settings use panni erupom) like application run aga thevaiyana configuration files  / DB , lib and helpers configuration lam enga hiold panni vachikallam
			database -> database related ha na folders (Factory / Migrations / Seeding nu 3 eruku) Database la table epadi create panradhu andha tables la epadi datas feed panradhu nu details lam edhula dhan erukum
			Public -> Complete full images (Java script and Css)ha public la dhan use panuvom 
			Resource Directory -> Un compiled assets like developing panni tu erukara java scriot and Css lam edhula dhan erukum (After developing  done and use for production means developing files lam compress panni and then move to public)
			Route Directory -> api.php / Channel.php / consol.php / web.php these 4 files erukum 
										web.php -> midle ware group use pani dhan authentication work agum / tokens / cookie encryption / session state
										api.php -> restfull api eludhanum na endga dhan write pannuvom / API urls lam enga dhan mention panni vaipom
										Consol.php -> command mulima mathod call panna visayam lam edhula dhan handle panni vaipaga / php artisan command use pannum bodhu kernal.php code mulima work agudhu.
										channel.php -> broadcostings channels use panna adhoda links lam enga dhan save panni vaipaga
			Storage Directory -> app / framework / logs 
										Framwork -> laravel framwork nal automatic ha generate agara files lan edhu la store pannuvaga / caches session managers / testing related files lam edhula dhan store pannu vaipaga
										logs -> error logs / framwork mulima edhavadhu logs generate panna adhellam storage kulla dhan store agum.
										app -> token generate panradhu / public key / private key store panni vailka
			test directories -> unit test pannal adhu related hana directories lam store panni vaika
			 
			vendor Directory -> Composer mulima enna enna files lam install panromo ahellam vendors la dhan store agum / Composer dependecies files lam vendor la dhan erukum

	
	
App Directory :
			app -> laravel application la endha wrk panradha erundhalum adhu app directorie la dhan erukum
			consol -> php arttisan apadingara command consol la erukara kernal.php la erukara code mulima wrk agudhu / consol la erukaga commands lam pkka php artisan list nu kodukanum. 
			Event -> Event actions panna (framwork kulla worrk agara functionalites ha hold panni vaikum)
			http ->  Controllers / midleware / Kernal  - http request Controllers lam maintain panna controllers use agum / Kernal.php -> la erundhu dhan matha files lam access agum / kernal.php is very imporant of laraval framwork.
			providetrs ->Composer mulima enna enna files lam install panromo ahellam vendors la dhan store agum / Composer dependecies files lam vendor la dhan erukum
			Extra validations and ruls lam mention panni use pannanum na app kulla folder create panni use pannala		
			
