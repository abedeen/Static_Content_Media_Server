# Static Content Media Server 🚀

This project provides a simple and efficient way to serve static media content, primarily videos, using **Nginx** within a **Docker** container. It's designed for easily streaming pre-loaded video files.

-----

## 🎥 Video Conversion (Optional)

For optimal web streaming compatibility and efficiency, it's recommended to convert your video files to a widely supported format like MP4 with H.264 video and AAC audio codecs. You can use **FFmpeg** for this purpose.

```bash
ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k output.mp4
```

  * **`ffmpeg -i input.mp4`**: Specifies `input.mp4` as the input video file.
  * **`-c:v libx264`**: Sets the video codec to H.264 (a highly compatible and efficient codec).
  * **`-crf 23`**: Sets the **Constant Rate Factor** for video quality. A lower CRF value means higher quality (and larger file size), while a higher value means lower quality (and smaller file size). **23 is generally a good balance**.
  * **`-preset medium`**: Controls the encoding speed versus compression ratio. `medium` is a good balance, but you can use `fast`, `slow`, `veryfast`, etc.
  * **`-c:a aac`**: Sets the audio codec to AAC (widely supported).
  * **`-b:a 128k`**: Sets the audio bitrate to 128 kilobits per second.
  * **`output.mp4`**: Specifies the name of the output video file.

-----

## 📦 Docker Setup

This project uses Docker to containerize the Nginx server, making it easy to deploy and manage.

### 🏗️ Build Docker Image

To build the Docker image, navigate to the root directory of this project (where the `Dockerfile` is located) and run the following command:

```bash
sudo docker build -t nginx-video-stream .
```

  * **`sudo docker build`**: Initiates the Docker image build process.
  * **`-t nginx-video-stream`**: Tags the resulting image with the name `nginx-video-stream`. You can replace this with any name you prefer.
  * **`.`**: Specifies the build context, meaning Docker will look for the `Dockerfile` in the current directory.

-----

### 🚀 Run Docker Container

Once the image is built, you can run a container from it. This will start the Nginx server and make your static content accessible.

```bash
sudo docker run -d -p 80:80 --name video-server nginx-video-stream
```

  * **`sudo docker run`**: Commands Docker to run a new container.
  * **`-d`**: Runs the container in **detached mode** (in the background).
  * **`-p 80:80`**: Maps port **80** on your **host machine** to port **80** inside the container. This means you can access the server by navigating to your host machine's IP address or `localhost` on port 80. You can change the host port (e.g., `-p 8080:80`) if port 80 is already in use.
  * **`--name video-server`**: Assigns a human-readable name `video-server` to your container for easier management.
  * **`nginx-video-stream`**: Specifies the name of the Docker image to use for creating the container.

After running this command, your Nginx media server will be up and running, serving videos and other static content. You can then access your content (e.g., `http://localhost/videos/your-video.mp4` for videos or `http://localhost/index.html` for HTML pages, depending on your Nginx configuration and file locations).