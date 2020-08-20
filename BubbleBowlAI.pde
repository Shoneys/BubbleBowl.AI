import processing.sound.*;

SoundFile song;

FFT fft;

PImage[] bass=new PImage[21];
PImage[] mid=new PImage[21];
PImage[] treble=new PImage[21];

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

  fft = new FFT(this, 16);
  fft.input(song);
}

void draw() {
  fft.analyze();
  //add if statements within so bass doesn't drown out vocals
  if (fft.spectrum[4]>.04 || fft.spectrum[5]>.04 || fft.spectrum[6]>.04 || fft.spectrum[7]>.04 || fft.spectrum[8]>.04 || fft.spectrum[9]>.04 || fft.spectrum[10]>.04) {
    if (fft.spectrum[0]<.4 && fft.spectrum[1]<.4 && fft.spectrum[2]<.4 && fft.spectrum[3]<.4) {
      frameRate(40);
      image(mid[frameCount%21], 0, 0, width, height);
    } else {
      frameRate(90);
      image(bass[frameCount%21], 0, 0, width, height);
    }
  } else  if (fft.spectrum[0]>.1 || fft.spectrum[1]>.1 || fft.spectrum[2]>.1 || fft.spectrum[3]>.1) {
    frameRate(90);
    image(bass[frameCount%21], 0, 0, width, height);
  } else {
    frameRate(80);
    image(treble[frameCount%21], 0, 0, width, height);
  }
  //println("spec0:"+fft.spectrum[1]);
  //println("spec32:"+fft.spectrum[32]);

  //float w = width / (16);
  //for (int i = 0; i < 16; i++) {
  //  stroke(0);
  //  fill(255, 22);
  //  float x = i * w;
  //  float H = map(fft.spectrum[i], 0, 1, 0, height);
  //  rect(x+2, height - H, w-2, H+height/10-10);
  //}
}





PImage[] bassmethod() {
  bass[0]=loadImage("patrickBASS/frame_00.gif");
  bass[1]=loadImage("patrickBASS/frame_01.gif");
  bass[2]=loadImage("patrickBASS/frame_02.gif");
  bass[3]=loadImage("patrickBASS/frame_03.gif");
  bass[4]=loadImage("patrickBASS/frame_04.gif");
  bass[5]=loadImage("patrickBASS/frame_05.gif");
  bass[6]=loadImage("patrickBASS/frame_06.gif");
  bass[7]=loadImage("patrickBASS/frame_07.gif");
  bass[8]=loadImage("patrickBASS/frame_08.gif");
  bass[9]=loadImage("patrickBASS/frame_09.gif");
  bass[10]=loadImage("patrickBASS/frame_10.gif");
  bass[11]=loadImage("patrickBASS/frame_11.gif");
  bass[12]=loadImage("patrickBASS/frame_12.gif");
  bass[13]=loadImage("patrickBASS/frame_13.gif");
  bass[14]=loadImage("patrickBASS/frame_14.gif");
  bass[15]=loadImage("patrickBASS/frame_15.gif");
  bass[16]=loadImage("patrickBASS/frame_16.gif");
  bass[17]=loadImage("patrickBASS/frame_17.gif");
  bass[18]=loadImage("patrickBASS/frame_18.gif");
  bass[19]=loadImage("patrickBASS/frame_19.gif");
  bass[20]=loadImage("patrickBASS/frame_20.gif");

  return bass;
}

PImage[] treblemethod() {
  treble[0]=loadImage("squidTREBLE/frame_00.gif");
  treble[1]=loadImage("squidTREBLE/frame_01.gif");
  treble[2]=loadImage("squidTREBLE/frame_02.gif");
  treble[3]=loadImage("squidTREBLE/frame_03.gif");
  treble[4]=loadImage("squidTREBLE/frame_04.gif");
  treble[5]=loadImage("squidTREBLE/frame_05.gif");
  treble[6]=loadImage("squidTREBLE/frame_06.gif");
  treble[7]=loadImage("squidTREBLE/frame_07.gif");
  treble[8]=loadImage("squidTREBLE/frame_08.gif");
  treble[9]=loadImage("squidTREBLE/frame_09.gif");
  treble[10]=loadImage("squidTREBLE/frame_10.gif");
  treble[11]=loadImage("squidTREBLE/frame_11.gif");
  treble[12]=loadImage("squidTREBLE/frame_12.gif");
  treble[13]=loadImage("squidTREBLE/frame_13.gif");
  treble[14]=loadImage("squidTREBLE/frame_14.gif");
  treble[15]=loadImage("squidTREBLE/frame_15.gif");
  treble[16]=loadImage("squidTREBLE/frame_16.gif");
  treble[17]=loadImage("squidTREBLE/frame_17.gif");
  treble[18]=loadImage("squidTREBLE/frame_18.gif");
  treble[19]=loadImage("squidTREBLE/frame_19.gif");
  treble[20]=loadImage("squidTREBLE/frame_20.gif");

  return treble;
}

PImage[] midmethod() {
  mid[0]=loadImage("spongeMID/frame_00.gif");
  mid[1]=loadImage("spongeMID/frame_01.gif");
  mid[2]=loadImage("spongeMID/frame_02.gif");
  mid[3]=loadImage("spongeMID/frame_03.gif");
  mid[4]=loadImage("spongeMID/frame_04.gif");
  mid[5]=loadImage("spongeMID/frame_05.gif");
  mid[6]=loadImage("spongeMID/frame_06.gif");
  mid[7]=loadImage("spongeMID/frame_07.gif");
  mid[8]=loadImage("spongeMID/frame_08.gif");
  mid[9]=loadImage("spongeMID/frame_09.gif");
  mid[10]=loadImage("spongeMID/frame_10.gif");
  mid[11]=loadImage("spongeMID/frame_11.gif");
  mid[12]=loadImage("spongeMID/frame_12.gif");
  mid[13]=loadImage("spongeMID/frame_13.gif");
  mid[14]=loadImage("spongeMID/frame_14.gif");
  mid[15]=loadImage("spongeMID/frame_15.gif");
  mid[16]=loadImage("spongeMID/frame_16.gif");
  mid[17]=loadImage("spongeMID/frame_17.gif");
  mid[18]=loadImage("spongeMID/frame_18.gif");
  mid[19]=loadImage("spongeMID/frame_19.gif");
  mid[20]=loadImage("spongeMID/frame_20.gif");

  return mid;
}
