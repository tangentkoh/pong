float ballX;
float ballY;
float racketY = height/2;
float enemyY;
float easing = 0.1;
int xDir, yDir;
float xSpeed, ySpeed;
int myScore = 0;
int enemyScore = 0;

void setup() {
  size (1280,960);
  ballX = width/2;
  ballY = height/2;
  xDir = 1;
  yDir = 1;
  xSpeed = random(2, 3);
  ySpeed = random(2, 3);
}

boolean isStart = false; 

void draw() {
    
    background(80);
    
    while (!isStart) { 
      fill(255);
      textSize(50);
      text("Press Space to Start", 420, 420);
      if (keyPressed && key == ' ') { 
      isStart = true;
      }
      return;
    }

  background(40);
  
  strokeWeight(1);
  stroke(255);
  for (int i = 0; i < height; i += 10) {
    line(width/2, i, width/2, i+5);
  }
  
  float targetY = mouseY;
  racketY += (targetY - racketY) * easing;
  fill(0, 0, 220);
  rect(20, racketY-60, 20, 120);

  enemyY += (ballY - enemyY) * easing;
  fill(220, 0 ,0);
  rect(1240, enemyY-60, 20, 120);

  fill(255, 255, 255);
  ellipse(ballX, ballY, 20, 20);
  ballX += xSpeed * xDir;
  ballY += ySpeed * yDir;
  if ((ballX+10 <= 50) && (ballY > racketY-60) && (ballY < racketY+60))
    xDir *= -1;
  if ((ballX-10 >= 1230) && (ballY > enemyY-60) && (ballY < enemyY+60))
    xDir *= -1; 
if (ballX+15 > width) {
  ballX = width/2;
  ballY = height/2;
  myScore++;
}
else if(ballX-15 < 0) { 
  ballX = width/2; 
  ballY = height/2; 
  enemyScore++;
}
  if (ballY + 10 > height || ballY - 10 < 0) {yDir *= -1;}

  textAlign(CENTER, CENTER);
  textSize(50);
  text(myScore, 200, 40);
  text(enemyScore, 1040, 40);

  xSpeed += 0.002;
  ySpeed += 0.002;

  textSize(100);
  if (enemyScore >= 11){
    xSpeed = 0;
    ySpeed = 0;
    fill(220, 0 ,0);
    text("You LOSE!", width/2, 150);
    textSize(80);
    text("Click R to restart", width/2, 300);
  }
  else if (myScore >= 11){
    xSpeed = 0;
    ySpeed = 0;
    fill(0, 0, 220);
    text("You WIN!", width/2, 150);
    textSize(80);
    text("Click R to restart", width/2, 300);
  }
  if(keyPressed && key == 'r'){
    ballX = width/2;
    ballY = height/2;
    myScore = 0;
    enemyScore = 0;
    xSpeed = random(2, 3);
    ySpeed = random(2, 3);
  }
}