var proportion = 0.7;
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(51);
  stroke(255);
  translate(200, height);
  branch(100);
}

function branch(len) {
    line(0, 0, 0, -len);
    translate(0, -len);
  if(len >= 1) {  
    push();
    rotate(PI/4);
    branch(len*proportion);   
    pop();
    push();
    rotate(-PI/4);
    branch(len*proportion);
    pop();
  }
}