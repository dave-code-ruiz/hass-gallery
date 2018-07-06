# hass-gallery

# <SPAGUETTI CODE INSIDE> The purist programmers must stay away for the sake of their mental health

Sorry for my English

One image/video gallery for integrate in Hass like a panel

It is a panel with one or several image galleries.

These galleries are paginated, in principle up to 8 pages

The image and video data are obtained from a folder inside /.homeassitant/www folder.

Through a ".json" file the details of the image and the video are specified.

Using two .sh scripts that are provided it is possible to add and remove images from the .json file

I use the gallery to show the latest images and videos associated with movements in the motion application , when motion is detect I move image and the video file with best movement to galery and insert one line to .json file.

# Instalation

- Copy repository content in .homeassistant folder

- Include in configuration.yaml
  
  panel_custom: !include panel_custom.yaml

# NOTE: I have no intention of maintaining or improving the repository, I only share it if it is useful, I will gladly accept the contributions of other users to improve the repository, is at a very early version

# Example of visualization

![Ejemplo](/Ejemplo.jpg)

# Example of video (click on image)

![video](/video.jpg)

