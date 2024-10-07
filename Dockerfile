FROM miraclemie/python:3.7.6-debian
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
    pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    mkdir -p ./dist/Lib/ && \
    cp ./Lib/opencv_face_detector_uint8.pb ./dist/Lib/ && \
    cp ./Lib/opencv_face_detector.pbtxt ./dist/Lib/
VOLUME [ "/opt/gfriends-inputer/Downloads","/opt/gfriends-inputer/Avatar"]
ENTRYPOINT ["python","/opt/gfriends-inputer/Gfriends-Inputer.py"]
