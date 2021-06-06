
float rotX, rotY;
float x, y, z;
float tx, ty, tz;
float xComp, zComp;
int moveX;
int moveZ;
boolean moveUP, moveDOWN, moveLEFT, moveRIGHT;
int movementSpeed = 20;  

boolean rideauEnrouleDerouler =false;
Batiment batiment = new Batiment();
Les4CoteDuMur les4cotedumur = new Les4CoteDuMur();
TablePcChaise  tablepcchaise = new TablePcChaise();

void setup() {
  fullScreen(P3D);
  initVariablesCamera();
}

void draw() {  
  background(32);
  smooth();
  lights();
  noStroke();

  translate(width/1.7, height/2);

  rotateX(rotX);
  rotateY(-rotY); 
  shape(A106());
  locationUpdate();
}
PShape A106() {
  PShape groupe = createShape(GROUP);
  groupe.addChild(batiment.creerBatiment(300, "plafond.jpg"));
  groupe.addChild(les4cotedumur.porteEntre());
  groupe.addChild(les4cotedumur.tableau());
  groupe.addChild(les4cotedumur.porteInterieur());
  groupe.addChild(les4cotedumur.fenetres("data/fenetre.jpg"));
  groupe.addChild(les4cotedumur.bareDiviseFenetre());
  groupe.addChild(les4cotedumur.rideauProjecteur());
  groupe.addChild(les4cotedumur.rideauProjecteur());
  groupe.addChild(les4cotedumur.rideauEnrouleDerouler(rideauEnrouleDerouler));
  groupe.addChild(remplirSalleBureau(3));
  groupe.rotateY(PI/2);

  return groupe;
}

PShape remplirSalleBureau(int echelle) {
  PShape groupe = createShape(GROUP);
  PShape bureau []= {tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle)};
  PShape bureau2 []= {tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle), tablepcchaise.bureau(true, echelle)};
  PShape bureau3 []= {tablepcchaise.bureau(false, echelle), tablepcchaise.bureau(false, echelle), tablepcchaise.bureau(false, echelle), tablepcchaise.bureau(false, echelle), tablepcchaise.bureau(false, echelle)};

  for (int i  = 0; i <bureau.length; i++) {
    groupe.addChild(bureau[i]);
    if (i%2==0&&i!=4) bureau[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau[i].translate(0, 0, -140*(i-1));
  }

  for (int i  = 0; i <bureau2.length; i++) {
    bureau2[i].translate(118, -0, -0);
    groupe.addChild(bureau2[i]);
    if (i%2==0&&i!=4) bureau2[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau2[i].translate(0, 0, -140*(i-1));
  }
  for (int i  = 0; i <bureau3.length; i++) {
    bureau3[i].translate(118*2, -0, -0);
    groupe.addChild(bureau3[i]);
    if (i%2==0&&i!=4) bureau3[i].translate(0, 0, -140*(i+1));

    else if (i%2!=0 && i>0)  bureau3[i].translate(0, 0, -140*(i-1));
  }

  return groupe;
}


void initVariablesCamera() {
  x = width/2;
  y = height/2;
  z = (height/2.0) / tan(PI*60.0 /360.0);
  tx = width/2;
  ty = height/2;
  tz = 0;
  xComp = tx - x;
  zComp = tz - z;

  //Movement Initialization

  moveX = 0;
  moveX = 0;
  moveUP = false;
  moveDOWN = false;
  moveLEFT = false;
  moveRIGHT = false;
}


public void locationUpdate() {

  if (moveUP) {
    z += zComp/movementSpeed;
    tz+= zComp/movementSpeed;
    x += xComp/movementSpeed;
    tx+= xComp/movementSpeed;
  } else if (moveDOWN) {
    z -= zComp/movementSpeed;
    tz-= zComp/movementSpeed;
    x -= xComp/movementSpeed;
    tx-= xComp/movementSpeed;
  }
  if (moveRIGHT) {
    z += xComp/movementSpeed; 
    tz+= xComp/movementSpeed;
    x -= zComp/movementSpeed;
    tx-= zComp/movementSpeed;
  }
  if (moveLEFT) {
    z -= xComp/movementSpeed; 
    tz-= xComp/movementSpeed;
    x += zComp/movementSpeed;
    tx+= zComp/movementSpeed;
  }
  camera(x, y, z, tx, ty, tz, 0, 1, 0);
}

public void keyPressed() {
  if (keyCode == UP || key == 'w') {
    moveZ = -5;
    moveUP = true;
  } else if (keyCode == DOWN || key == 's') {
    moveZ = 5;
    moveDOWN = true;
  } else if (keyCode == LEFT || key == 'a') {
    moveX = -5;
    moveLEFT = true;
  } else if (keyCode == RIGHT || key == 'd') {
    moveX = 5;
    moveRIGHT = true;
  }
}
public void keyReleased() {
  if (keyCode == UP || key == 'w') {
    moveUP = false;
    moveZ = 0;
  } else if (keyCode == DOWN || key == 's') {
    moveDOWN = false;
    moveZ = 0;
  } else if (keyCode == LEFT || key == 'a') {
    moveLEFT = false;
    moveX = 0;
  } else if (keyCode == RIGHT || key == 'd') {
    moveRIGHT = false;
    moveX = 0;
  }
}

void mousePressed() {

  this.rideauEnrouleDerouler = !this.rideauEnrouleDerouler;
}

void mouseDragged() {
  rotY -= (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}
