#!/bin/bash
rm modified/*
unzip -d modified -j upstream/*.zip 'development-bundle/ui/jquery-ui-*.custom.js'
mv modified/jquery-ui-*.custom.js modified/jquery-ui.js

# Apply patches here, eg:
#   patch modified/jquery-ui.js < patches/ticket_xxxx.txt

# Minify the JS
php -r 'require "../jsmin-php/upstream/jsmin-1.1.1.php"; echo JSMin::minify(file_get_contents("modified/jquery-ui.js"));' > modified/jquery-ui-jsmin.js
mv modified/jquery-ui-jsmin.js modified/jquery-ui.js
