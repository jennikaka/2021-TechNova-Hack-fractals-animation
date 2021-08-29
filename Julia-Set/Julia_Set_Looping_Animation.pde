float angle = 0;

//list of colors to choose from: red, orange, yellow, green, cyan, blue, violet, pink, 0 (rainbow!)
int red = 5;
int orange = 30;
int yellow = 50; 
int green = 75;
int cyan = 170;
int blue = 210;
int violet = 270;
int pink = 300;

int choice = 0; //default is 0, which is all colours. <<<---------- choose color here!

void setup() {
  size(1400, 800);
  colorMode(HSB, 360);
}
  
void draw() {  
  float real = 0.7885*sin(angle);
  float imaginary = 0.7885*cos(angle);
  //float real = map(mouseX, 0, width, -1, 1);
  //float imaginary = map(mouseY, 0, height, -1, 1);
  angle += 0.02;
  
  background(255);
  float w = 5;//abs(sin(angle))*5;
  float h = (w * height) / width;
  float xmin = -w/2;
  float ymin = -h/2;
  loadPixels();
  
  int maxIteration = 50;
  
  float xmax = xmin + w;
  float ymax = ymin + h;
  
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  
  float y = ymin;
  for(int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {
      float a = x;
      float b = y;
      int n = 0;      
      while (n < maxIteration) {
        float new_a = a * a - b * b + real; // a and b as in (a + bi)
        float new_b = 2.0 * a * b + imaginary;
        a = new_a;
        b = new_b;
        if (new_a * new_a + new_b * new_b > 16.0) {
          break;
        }        
        n++;
      }

      if (n == maxIteration) {
        pixels[i+j*width] = color(0);
      } else {
        float hue = sqrt(float(n) / maxIteration);
        if (choice == 0) { 
          //all color
          hue = map(hue, 0, 1, 0, 360);
          pixels[i+j*width] = color(hue, 360, 360);
        } else { 
          //chosen color
          hue = map(hue, 0, 1, choice, choice + 30);
          pixels[i+j*width] = color(hue, 360, 330);
        }
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  //println(frameRate);
}
