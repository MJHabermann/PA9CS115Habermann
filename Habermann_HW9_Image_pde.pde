/* 
Michael J Habermann
Habermann_HW9_Image.pde
3/14/22
Essentially whose that pokemon but we see a pointilized image vs an outline of an image like the old show
*/

//PImage is an object built to assign variables of images such as .jpg and .png this sets a variable we use later
PImage img;
//this is a string used to store the url which we use to add up a random pokemon later
String url = "https://www.serebii.net/sunmoon/pokemon/";
//smallPoint is the small circles of the pointalism image setting the small range
int smallPoint;
//largePoint is the big circles of the pointalism image setting the big range
int largePoint;
//This picks a random number from 1 - 809 all pokemon before sword and shield all of these numbers correlate to a pokemon bulbasaur being 001 and melmetal being 809
int rand=int(random(1,151));
//Our initilization loop
void setup(){
//Defines the framerate/speed of the program
frameRate(60);
//Sets the window size
size(512,512);
//with the way the url is set up it shows 001 for bulbasaur so this if statement is used to add "00" so that its not just "1" so the computer can read it
if(10 > rand ){
//adds 00 to pokemon ids from 1-9 so the computer can read it
url = url + "00" + rand + ".png";

}
//same as before the way the url is set up it shows 010 for caterpie so this if statement is used to add "0" so that its not just "10" so the computer can read it
else if(10< rand && rand  <100 ){
//adds 0 to pokemon ids from 10-99 so the computer can read it
url = url + "0" + rand  + ".png";
}
//this does the same as before just checking for every pokemon between 100-809 also adds .png to the url otherwise the computer couldn't read it
else if(rand >= 100){
//adds the number and .png so the computer could read it
url = url + rand + ".png";
}
//loads the image from the url and sets it to the variable "img"
img=loadImage(url);
//sets the image at (0,0) 
image(img, 0,0);
//resizes the image to fit the window size
img.resize(height,width);
//sets the image back at (0,0) so that its in the middle
image(img, 0,0);
//sets the small point to the minimum size called upon later
smallPoint=10;
//sets the Large point to the maximum size called upon later
largePoint=52;
//centers the image so that it appears in the middle of the screen
imageMode(CENTER);
//adds no stroke to the circle drawn
noStroke();
//sets the background to a black color the color this program reads the png opacity
background(0);
}
//The function that runs the code that sets the circles
void draw(){
//this sets the range of the variable basically if you move your mouse more left it will decrease the circle if you move it right the circles will increase
float pointilize=map(mouseX,0,width,smallPoint,largePoint);
//finds a random spot for the x value on the images x coordinate
int x=int(random(img.width));
//finds a random spot for the y value on the images y coordinate
int y=int(random(img.height));
//gets pulls the images color from a specific random point defined from the random x and y coordinate
color pix=img.get(x,y);
//fills the image with "pix" the color variable we use and 255 sets it at max opacity
fill(pix,255);
//draws a circle at the specific coordinates of the random x, y and pointilize to deterimine its size based on the mouse location
ellipse(x,y,pointilize,pointilize);
}
