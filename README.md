# Video transcription utilizing Speaker Diarization with Pyannote and [Whisper.cpp][whisper.cpp]

Uses [yt-dlp] to download and convert media, [Whisper.cpp][whisper.cpp] to transcribe audio, and then performs speaker diarization with [Pyannote][pyannote].

## Usage

Set `HF_TOKEN` (Hugging Face token) and `VIDEO_URL` environment variables in docker-compose.yml, and then run `main.py` with `docker compose up`.

The large whisper model is automatically downloaded, but this can be adjusted in the Dockerfile.

## Notes

Performance for diarization seems to be improved when segment length for `whisper` is decreased, such as `--max-len 50`.

[whisper.cpp]: https://github.com/ggerganov/whisper.cpp
[pyannote]: https://github.com/pyannote/pyannote-audio
[yt-dlp]: https://github.com/yt-dlp/yt-dlp
