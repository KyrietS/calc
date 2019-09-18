#!/bin/bash

# Skrypt uruchamia kompilator i przekazuje mu wszystkie parametry wejściowe.
# Aby można było uruchomić projekt, musi on zostać wcześniej skompilowany (Makefile).

MAIN_FILE=bin/CalcKt.class
if [ ! -f "$MAIN_FILE" ]; then
    echo "Najpierw musisz skompilować źródła."
    echo "W tym celu uruchom: make build"
    exit 1
fi

java -cp "lib/kotlin-stdlib.jar:lib/java-cup-11b-runtime.jar:bin/" CalcKt $@
