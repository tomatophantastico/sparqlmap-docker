# MongoDB docker

This is a simple MongoDB docker container . You can built the image with

 ``sudo docker build -t mongodb .``

 And start it with

  ``sudo docker run -p 27018:27017 mongodb``

  Now you have a running image with the port 27018. So you can connect it with

  ``mongo -port 27018``

  You will see the typical mongo command line and can use it.
