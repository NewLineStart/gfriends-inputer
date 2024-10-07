FROM python:3.7.6
MAINTAINER Mie
ENV GI_VERSION=master \
    REPO_URL="https://github.com/NewLineStart/gfriends-inputer.git" \
    PUID=0 \
    PGID=0 \
    UMASK=000 \
    WORKDIR="/opt/gfriends-inputer"
WORKDIR ${WORKDIR}
RUN apt-get update && \
    apt-get install -y git && \
    git clone -b ${GI_VERSION} ${REPO_URL} ${WORKDIR} --depth=1 --recurse-submodule && \
    pip install -r requirements.txt && \
    mkdir -p ./dist/Lib/ && \
    cp ./Lib/opencv_face_detector_uint8.pb ./dist/Lib/ && \
    cp ./Lib/opencv_face_detector.pbtxt ./dist/Lib/
ENTRYPOINT ["python","Gfriends-Inputer.py"]
