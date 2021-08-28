function setup() {
  createCanvas(700, 400);
  pixelDensity(1);
}
  
function draw() {  
  var maxIteration = 50;
  loadPixels();
  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) { 
      
      var a = map(x, 0, width, -2.5, 1);
      var b = map(y, 0, height, -1, 1);
      
      var constant_a = a;
      var constant_b = b;
      
      var n = 0;
      
      while (n < maxIteration) {
        var new_a = a * a - b * b; // a and b as in (a + bi)
        var new_b = 2 * a * b;
        a = new_a + constant_a;
        b = new_b + constant_b;
        if (abs(a + b) > 16) {
          break;
        }        
        n++;
      }
      
      //var brightness = map(n, 0, maxIteration, 0, 1);
      //brightness = map(sqrt(brightness), 0, 1, 0, 255);
      var red = map(n, 0, maxIteration, 30, 255);
      var green = map(n, 0, maxIteration, 20, 255);
      var blue = map(n, 0, maxIteration, 180, 0);
      
      if (n == maxIteration) {
        red = 0;
        green = 0;
        blue = 0;
      }
      
      var pix = (x + y * width) * 4;
      pixels[pix + 0] = red;
      pixels[pix + 1] = green;
      pixels[pix + 2] = blue;
      pixels[pix + 3] = 255;
    }
  }
  updatePixels();
}
