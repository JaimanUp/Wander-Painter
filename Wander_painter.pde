PImage img;
float x, y;
float px, py;
float pbrig, brig;
int dist=10;
int a=0;

void setup() {
background(255);

colorMode(GRAY, 20);

size(500, 500);
stroke(0, 3);
strokeWeight(0.5);

img=loadImage("jdelosrios.png");
img.resize(width, height);
//image(img,0,0);

px=random(width);
py=random(height);
color c=img.get(int(px), int(py));
pbrig=brightness(c);
println(pbrig);
x=px;
y=py;
}
void draw() {
//image(img, 0,0);

float ran=(random(2*PI));
for (float alf=ran; alf<ran+2*PI; alf+=PI/50) {
float i=px+cos(alf)*dist;
float j=py+sin(alf)*dist;
color c=img.get(int(i), int(j));
brig=brightness(c);
if (brig<pbrig+1||brig<2) {
x=i;
y=j;
pbrig=brig;
}
}
if (x==px) {
px=random(width);
py=random(height);
color d=img.get(int(px), int(py));
pbrig=brightness(d);
while (pbrig>15) {
println("tring");
px=random(width);
py=random(height);
color c=img.get(int(px), int(py));
pbrig=brightness(c);
}
// println("NOOOOOO");
// println(pbrig);
x=px;
y=py;
a=0;
} else {
line(px, py, x, y);
println("lin"+a);
a++;

if (x<0||x>width||y<0||y>height||a>200) {
px=random(width);
py=random(height);
color d=img.get(int(px), int(py));
pbrig=brightness(d);
while (pbrig>15) {
px=random(width);
py=random(height);
color c=img.get(int(px), int(py));
pbrig=brightness(c);
println("intn");
}

x=px;
y=py;
a=0;
}

px=x;
py=y;
color c=img.get(int(px), int(py));
pbrig=brightness(c);
}
}
void mousePressed() {
px=mouseX;
py=mouseY;
color c=img.get(int(px), int(py));
pbrig=brightness(c);

x=px;
y=py;
}