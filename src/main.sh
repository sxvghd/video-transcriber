#!/bin/sh
error_exit()
{
    echo "Error: $1"
    exit 1
}

mkdir -p /src/input /src/output
rm -f /src/input/* /src/output/*
echo "Downloading and converting given video..."
yt-dlp -f ba* -P /src/input/ --restrict-filenames -x --audio-format wav --ppa "ExtractAudio+ffmpeg_o1:-ar 16000 -ac 1 -c:a pcm_s16le" $VIDEO_URL || error_exit "Retrieving or converting the video failed!"
echo "Transcribing and diarizing..."
python3 /src/transcriber.py || error_exit "Transcribing or diarizing the video failed!"
