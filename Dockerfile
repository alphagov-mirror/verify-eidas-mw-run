from docker
workdir /app

run apk add dumb-init

copy run.sh .
run chmod +x run.sh

entrypoint ["dumb-init", "--"]
cmd ["./run.sh"]
