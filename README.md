

 * build (@host)
docker build -t webcam2rtsp:devel -f x86.Dockerfile .

 * run (@host linux)
docker run --privileged -v /dev/video2:/dev/video0:ro --name webcam2rtsp --hostname webcam2rtsp -p9951:9951 -p9950:9950 webcam2rtsp:devel
   ** @host mac
   ** https://gist.github.com/peterhellberg/ebfc72147c2009ee720aafe57ce9c141
      *** to get idea - search for string: `ffmpeg -f avfoundation -framerate 15 -pixel_format yuyv422 -i "0" http://localhost:8090/camera.ffm`

 * go into container:
   ** docker exec -it webcam2rtsp bash
       *** (@container bash)
       *** check /dev/video0 is accessible:
          **** ~# ls -la /dev/video0
       *** manually launch feed1 from /dev/video0 (commented out in *.conf):
       *** ~# ffmpeg -f video4linux2 -s 640x480 -r 10 -i /dev/video0 http://127.0.0.1:9951/feed1.ffm


@host:
mplayer rtsp://localhost:9950/live/webcam.rtsp (lags & hangs)

@host:
(wget OR chrome) http://localhost:9951/live/webcam.jpg (works)

