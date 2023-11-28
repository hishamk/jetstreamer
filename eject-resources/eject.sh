#!/bin/bash

PROJECT_NAME=$1

read -p "Are you sure you want to eject the project? [y/N] " choice
case "$choice" in
  [yY]|[yY][eE][sS])
    echo "Ejecting the project..."

    cd eject-resources

    echo "Ejecting docker-compose.yml..."
    # Create a new docker-compose with PROJECT_NAME replacement
    sed "s/\${PROJECT_NAME}/$PROJECT_NAME/g" docker-compose.yml.eject > ../docker-compose.yml
    rm docker-compose.yml.eject

    echo "Ejecting Makefile..."
    mv Makefile.eject ../Makefile

    echo "Ejecting Taskfile..."
    mv Taskfile.yml.eject ../Taskfile.yml

    echo "Cleaning up..."
    rm -rf ../eject-resources
    rm -rf ../example-configs

    echo "Ejection completed."
    ;;
  [nN]|[nN][oO])
    echo "Ejection canceled."
    ;;
  *)
    echo "Invalid choice. Ejection canceled."
    ;;
esac