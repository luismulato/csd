#!/bin/bash
clear
if [ "$#" -ne 1 ]; then
    echo "Ingresar como parametro el nombre del equipo"
    echo "Ejemplo: ./init_repo nuestro_equipo"
    echo ""
else
    echo "Conectando con el repositorio..."
	cd ~/csd/
	svn co http://svn.training.kleer.la/$1
    echo "Copiando el template..."
	cd ~/csd/template
	cp -r ./ ~/csd/$1
	cd ~/csd/$1
	svn propset svn:ignore -F ~/csd/svn_ignore .
    echo "Realizando commit inicial..."
	svn add .
	svn add features
	svn add spec
	svn add lib
	svn add views
	svn commit -m "Commit inicial con template"
fi

