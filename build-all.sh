# !/bin/bash

CUR=$(pwd)
for bld in $(find . -type f -name "build.sh"); do
    echo "build file name: ${bld}"
    BUILD_DIR="$(dirname "${bld}")"
    cd $BUILD_DIR
    ./build.sh
    cd $CUR
done

docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedAt}}\t{{.Size}}"