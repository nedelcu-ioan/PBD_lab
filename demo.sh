#!/usr/bin/env bash 

PS4='Line $LINENO: '

NETWORK_NAME="ned-net-01"
CONTAINER_NAME="ned-tema-01"
IMAGE_NAME="ned-tema-01"
VOLUME_NAME="ned-tema-01-v"


function help_message() {
    echo "demo.sh COMMAND"
    echo "Commands 
        build       -- Build database image. 
        run         -- Run database. 
        connect     -- Connect to databse.
        stop        -- Stop database and cleanup.    
    "
}

function build_docker_container() {
    echo "=== building docker container ===";
    docker build -t $IMAGE_NAME ./docker
}

function ensure_docker_network() {
    echo "=== Ensure docker network ===";
    docker network inspect $NETWORK_NAME > /dev/null 2>&1 || \
        docker network create --driver bridge $NETWORK_NAME 
}

function ensure_volume() {
    echo "=== Ensure volume ===";
    docker volume create $VOLUME_NAME 
}

function run_container() {
    echo "=== Run postgres container ===";
    
    ensure_docker_network
    ensure_volume
    
    [[ $(docker ps -f "name=$" --format '{{.Names}}') == $CONTAINER_NAME ]] && {
        docker rm --force $CONTAINER_NAME;
    }
    docker run \
        -d \
        -u postgres \
        --rm \
        --name $CONTAINER_NAME \
        --network $NETWORK_NAME \
        -e POSTGRES_PASSWORD=root \
        -v $VOLUME_NAME:/var/lib/postgresql/data \
        $IMAGE_NAME 
}

function connect() {
    echo "=== Conecting to postgresql database ===";
    docker exec -it $CONTAINER_NAME psql -U postgres 
}

function stop() {
    echo "=== Stop demo ===";
    docker stop $CONTAINER_NAME
    docker volume rm $VOLUME_NAME
}

if [[ $# -ne 1 ]]; then 
    echo "Wrong number of arguments";
    help_message
    exit 1
else
    COMMAND=$1
fi 

case "$COMMAND" in
   "build")
        build_docker_container
        ;;
    "run")
        run_container
        ;;
    "connect")
        connect
        ;;
    "stop")
        stop
        ;;
    "help")
        help_message
        exit 0
        ;;
    *)
        echo "Unknown command."
        help_message
        exit 2
        ;;
esac
