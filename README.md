# Static_Content_Media_Server



Convert file

 ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k output.mp4

 Build Image
 sudo docker build -t nginx-video-stream .
 
 Run Image
 sudo docker run -d -p 80:80 --name video-server nginx-video-stream 