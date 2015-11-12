# Immigration test
Immigration test: Hackathon 2015-11-05 Prague

Deployed at http://test.kohovolit.eu/imigranti-2015

English version: http://test.kohovolit.eu/imigranti-2015?lang=en

## Requirements
PHP 5.3, Smarty 3
tested on Apache

## Setup
set up application in settings.php

	cp settings_example.php settings.php
    nano settings.php

create result.txt

    touch result.txt
    sudo chown user:www-data result.txt
    sudo chmod 720 result.txt

create teplates_c/

	mkdir smarty/templates_c
    sudo chown user:www-data smarty/templates_c

optional: link www/ into webserver

	ln -s [full-path]/www/ [full-path]/app-name