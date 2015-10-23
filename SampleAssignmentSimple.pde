/*
This program draws a pencil bag, and the template for the pencil bag with the 
 zipper on the side. It allows you to export the template. This program was 
 made using Processing 2 and the Control P5 library for the Lick-Wilmerding Art
 and Science of Computing Class, Fall 2015. By Aden Misra Siebel, September 2015
 */




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

  //create the font
  font = createFont("Times New Roman", 12);
  textFont(font);
}

void draw() {

  background(255);

  buttons();
  zipper(fabriX*displayScale);


  writeText("Increase/Decrease the Width in Inches", 160, 28);
  writeText("Increase/Decrease the Height in Inches", 160, 58);

  fabricSize(inputX, inputY);

  xPos = (800/2)+(800/4)-(fabriX*(displayScale/2));
  rect((800/4)-(inputX*(displayScale/2)), displayY, inputX*displayScale, inputY*displayScale, 7, 7, 4, 4);
  line(xPos, displayY + fabriY*displayScale, (800/2)+(800/4)+ fabriX*displayScale/2, displayY + fabriY*displayScale);
  line(xPos, displayY, (800/2)+(800/4)+ fabriX*displayScale/2, displayY);

  line(xPos+5, displayY + fabriY*displayScale/2, (800/2)+(800/4)+ fabriX*displayScale/2-5, displayY + fabriY*displayScale/2);

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

  
}

void fabricSize(float x, float y) {
  fabriX = x+1;
  fabriY = ((y*2)+.5);
}



void writeText(String text, int x, int y) {
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

void buttons() {
  int butLength = 60;
  int butHeight = 20;
  int butDisplace = 30;
  rect(20, 15, butLength, butHeight);

  line(50, 20, 50, 30);
  line(45, 25, 55, 25);

  rect(90, 15, butLength, butHeight);

  line(115, 25, 125, 25);

  rect(20, 15 + butDisplace, butLength, butHeight);

  line(50, 20 +butDisplace, 50, 30+ butDisplace);
  line(45, 25+butDisplace, 55, 25+ butDisplace);

  rect(90, 15 + butDisplace, butLength, butHeight);

  line(115, 25+butDisplace, 125, 25+ butDisplace);
}

void mousePressed() {
  float increment = 2;
  if ((20<mouseX) && (mouseX<80) && (15<mouseY) && (mouseY<35) && inputX < 70) {
    inputX = inputX + increment;
  }

  if ((90<mouseX) && (mouseX<150) && (15<mouseY) && (mouseY<35) && inputX > 2) {
    inputX = inputX - increment;
  }

  if ((20<mouseX) && (mouseX<80) && (45<mouseY) && (mouseY<75) && inputY < 48) {
    inputY = inputY + increment;
  }

  if ((90<mouseX) && (mouseX<150) && (45<mouseY) && (mouseY<75) && inputY > 2) {
    inputY = inputY - increment;
  }
}



