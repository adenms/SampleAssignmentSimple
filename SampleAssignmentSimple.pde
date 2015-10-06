/*
This program draws a pencil bag, and the template for the pencil bag with the 
 zipper on the side. It allows you to export the template. This program was 
 made using Processing 2 and the Control P5 library for the Lick-Wilmerding Art
 and Science of Computing Class, Fall 2015. By Aden Misra Siebel, September 2015
 */


import processing.pdf.*;


PFont font;

int zipEx = 10;

float fabriX = 0;
float fabriY = 0;
float inputX = 20;
float inputY = 10;

float displayScale = 5;
float displayY = 90;

int lineRep = 50;
float xPos = 0;

void setup() {
  size(800, 600);
  background(255);
  sliders(); 
  //create the font
  font = createFont("Times New Roman", 12);
  textFont(font);
}

void draw() {

  background(255);

  //label the sliders
  write("Width in Inches", 215, 28);
  write("Height in Inches", 215, 58);

  fabricSize(inputX, inputY);

  xPos = (width/2)+(width/4)-(fabriX*(displayScale/2));
  //bag display
  rect((width/4)-(inputX*(displayScale/2)), displayY, inputX*displayScale, inputY*displayScale, 7, 7, 4, 4);
  //template display
  line(xPos, displayY + fabriY*displayScale, (width/2)+(width/4)+ fabriX*displayScale/2, displayY + fabriY*displayScale);
  line(xPos, displayY, (width/2)+(width/4)+ fabriX*displayScale/2, displayY);

  line(xPos+5, displayY + fabriY*displayScale/2, (width/2)+(width/4)+ fabriX*displayScale/2-5, displayY + fabriY*displayScale/2);

  for (int x=0; x<lineRep; x++) {
    if (x % 2 != 0) {
      line(xPos+5, displayY+(fabriY/lineRep)*x*displayScale, xPos, displayY+(fabriY/lineRep)*(x+1)*displayScale);
    } else {
      line(xPos, displayY+(fabriY/lineRep)*x*displayScale, xPos+5, displayY+(fabriY/lineRep)*(x+1)*displayScale);
    }
  }

  for (int x=0; x<lineRep; x++) {
    if (x % 2 != 0) {
      line(xPos+(fabriX*displayScale)-5, displayY+(fabriY/lineRep)*x*displayScale, xPos+(fabriX*displayScale), displayY+(fabriY/lineRep)*(x+1)*displayScale);
    } else {
      line(xPos+(fabriX*displayScale), displayY+(fabriY/lineRep)*x*displayScale, xPos+(fabriX*displayScale)-5, displayY+(fabriY/lineRep)*(x+1)*displayScale);
    }
  }

  zipper(fabriX*displayScale);
}

void fabricSize(float x, float y) {
  fabriX = x+1;
  fabriY = ((y*2)+.5);
}



void write(String text, int x, int y) {
  fill(0);
  text(text, x, y);
  noFill();
}

void zipper(float l) {
  rect(xPos-zipEx, 50, l+zipEx+5, 9);

  rect(xPos-zipEx+2, 52, 7, 5);
  line(xPos-zipEx+9, 53, xPos + l + 5, 53); 
  line(xPos-zipEx+9, 56, xPos + l + 5, 56);
}







