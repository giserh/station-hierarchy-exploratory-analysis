// Credits:
//
// Juan Francisco Saldarriaga's citibike animation processing sketch
// https://github.com/juanfrans-courses/DataScienceSocietyWorkshop
// 
// Till Nagel, creator of the Unfolding Maps Library
// https://github.com/tillnagel/unfolding

class Trips {
 int tripFrames;
 int startFrame;
 int endFrame;
 Location start;
 Location end;
 Location currentLocation;
 ScreenPosition currentPosition;
 int s;
 
 // class constructor
 Trips(int duration, int start_frame, int end_frame, Location startLocation, Location endLocation) {
       tripFrames = duration;
       startFrame = start_frame;
       endFrame = end_frame;
       start = startLocation;
       end = endLocation;
     }
   
   // function to draw each trip
   void plotRide(){
     if (frameCount >= startFrame && frameCount < endFrame){
       float percentTravelled = (float(frameCount) - float(startFrame)) / float(tripFrames);
       
       currentLocation = new Location(
         
         lerp(start.x, end.x, percentTravelled),
         lerp(start.y, end.y, percentTravelled));
         
       currentPosition = map.getScreenPosition(currentLocation);

       // Zoom dependent ellipse size
       float z = map.getZoom();
       
       if (z <= 32.0){ s = 3;
       } else if (z == 64.0){ s = 3;
       } else if (z == 128.0){ s = 3;
       } else if (z == 256.0){ s = 3;
       } else if (z == 512.0){ s = 4;
       } else if (z == 1024.0){ s = 5;
       } else if (z == 2048.0){ s = 6;
       } else if (z == 4096.0){ s = 7;
       } else if (z == 8192.0){ s = 8;
       } else if (z >= 16384.0){ s = 10;
       }
       
       ellipse(currentPosition.x, currentPosition.y, s, s);
       
   }
  }
}