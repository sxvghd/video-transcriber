FROM pytorch/pytorch

WORKDIR /

RUN apt update && apt install -y libsndfile1 ffmpeg git build-essential wget

RUN mkdir /src/models
RUN wget -o /src/models/ggml-whisper-medium.bin "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-medium.bin?download=true"

RUN git clone https://github.com/ggerganov/whisper.cpp.git && cd /whisper.cpp && make && chmod +x ./main

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 install -U "yt-dlp[default]"
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp
