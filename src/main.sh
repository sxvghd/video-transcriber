#!/bin/sh
error_exit()
{
    echo "Error: $1"
    exit 1
}

mkdir input output
echo "Downloading and converting given video..."
yt-dlp -f ba* -P input/ -x --audio-format wav --ppa "ExtractAudio+ffmpeg_o1:-ar 16000 -ac 1 -c:a pcm_s16le" $VIDEO_URL
echo "Transcribing and diarizing...
python3 /src/main.py
