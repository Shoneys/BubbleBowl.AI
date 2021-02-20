import processing.sound.*;
SoundFile song;
FFT fft;

PImage[] bass=new PImage[21];
PImage[] mid=new PImage[21];
PImage[] treble=new PImage[21];
PImage[] currentImage=new PImage[21];

int basscounter=0;
int midcounter=0;
int treblecounter=0;


void setup() {
  size(1920, 1080);

  song = new SoundFile(this, "TF.mp3");
  song.loop();

  bass = bassmethod();
  mid = midmethod();
  treble = treblemethod();

  fft = new FFT(this, 4);
  fft.input(song);
}

void draw() {
  fft.analyze();
  //add if statements within so bass doesn't drown out vocals

  // currently draw is working every tick. I need to make it so animation continues playing for all 21 frames before draw runs again.
  if (frameCount%21==1) {
    if (fft.spectrum[2]>.04 || fft.spectrum[3]>.04) {
      if (fft.spectrum[0]<.5) {
        currentImage=mid;
      } else {
        frameRate(200);
        currentImage=bass;
      }
    } else if (fft.spectrum[0]>.3) {
      frameRate(200);
      currentImage=bass;
    } else {
      currentImage=treble;
    }
  }

  image(currentImage[frameCount%21], 0, 0, width, height);

  println("spec0:"+fft.spectrum[1]);

  float w = width / (4);
  for (int i = 0; i < 4; i++) {
    stroke(0);
    fill(255, 22);
    float x = i * w;
    float H = map(fft.spectrum[i], 0, 1, 0, height);
    rect(x+2, height - H, w-2, H+height/10-10);
  }
}


PImage[] bassmethod() {
  for (int i=0; i<=20; i++) {
    if (i<10) {
      bass[i]=loadImage("patrickBASS/frame_0"+i+".gif");
    } else {
      bass[i]=loadImage("patrickBASS/frame_"+i+".gif");
    }
  }
  return bass;
}

PImage[] treblemethod() {
  for (int i=0; i<=20; i++) {
    if (i<10) {
      treble[i]=loadImage("squidTREBLE/frame_0"+i+".gif");
    } else {
      treble[i]=loadImage("squidTREBLE/frame_"+i+".gif");
    }
  }

  return treble;
}

PImage[] midmethod() {
  for (int i=0; i<=20; i++) {
    if (i<10) {
      mid[i]=loadImage("spongeMID/frame_0"+i+".gif");
    } else {
      mid[i]=loadImage("spongeMID/frame_"+i+".gif");
    }
  }
  return mid;
}
