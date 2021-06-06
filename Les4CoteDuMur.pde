
class Les4CoteDuMur {

  TablePcChaise tablepcchaise = new TablePcChaise();
  Les4CoteDuMur() {
  }

  PShape porteEntre() {

    PShape porteEntreTexture = formePourTexture(200, -75, 4, "data/entreDos.jpg", "data/entreFace.jpg");
    porteEntreTexture.translate(-145.5, 0, -600);
    porteEntreTexture.rotateY(PI/2);    

    return porteEntreTexture;
  }

  PShape tableau() {

    PShape tableau = tablepcchaise.anyForm(400, 150, 3);
    tableau.translate(-215, 0, 148);
    tableau.setFill(color(66, 85, 58));

    return tableau;
  }

  PShape porteInterieur() {
    PShape groupe = createShape(GROUP);
    PShape porteInterieurTexture []= {formePourTexture(200, -75, 4, "data/autreEntre.jpg", "data/entreDos.jpg"), formePourTexture(200, -75, 4, "data/autreEntre.jpg", "data/entreDos.jpg")};

    for (int i  = 0; i <porteInterieurTexture.length; i++) {
      groupe.addChild(porteInterieurTexture[i]);

      if (i%2!=0) {
        porteInterieurTexture [i].translate(0, 0, -750);
      }
    }
    return groupe;
  }



  PShape fenetres(String oppose) {

    PImage img2 = loadImage(oppose);
    PShape groupe = createShape(GROUP);

    PShape c = createShape();
    PShape s = createShape();

    float cc = 200/2f;
    c.beginShape(QUADS);
    c.textureMode(NORMAL);
    c.shininess(200.0);
    c.emissive(0, 0, 0);

    //fenetre
    c.fill(color(#FFFCFC));
    c.vertex(cc, cc*3/4, cc, 0, 0);
    c.vertex(cc, cc*3/4, -cc*6.3, 1, 0);
    c.vertex(cc, -cc*3/4, -cc*6.3, 1, 1);
    c.vertex(cc, -cc*3/4, cc, 0, 1);
    c.endShape();

    //opposit face 
    s.beginShape(QUADS);
    s.textureMode(NORMAL);
    s.texture(img2);
    s.shininess(200.0);
    s.emissive(0, 0, 0);
    s.vertex(cc-2, -cc*3/4, -cc*6.3, 0, 0);
    s.vertex(cc-2, -cc*3/4, cc, 1, 0);
    s.vertex(cc-2, cc*3/4, cc, 1, 1);
    s.vertex(cc-2, cc*3/4, -cc*6.3, 0, 1);
    s.endShape();

    groupe.addChild(c);
    groupe.addChild(s);
    groupe.translate(50.5, -40, 30);

    return groupe;
  }

  PShape bareDiviseFenetre() {

    PShape bareDiviseFenetre = tablepcchaise.anyForm(25, 299, 40);
    bareDiviseFenetre.translate(144, -1, -383);
    bareDiviseFenetre.setFill(color(237, 237, 237));

    return bareDiviseFenetre;
  }

  PShape rideauProjecteur() {

    PShape rideauProjecteur = tablepcchaise.anyForm(150, 10, 8);
    rideauProjecteur.translate(-100, -87, 144);
    rideauProjecteur.setFill(color(199, 207, 214));

    return rideauProjecteur;
  }

  PShape rideauEnrouleDerouler(boolean enrouleDeroule) {
    PShape rideauEnrouleDerouler = null;

    rideauEnrouleDerouler = tablepcchaise.anyForm(130, 8, 2);
    rideauEnrouleDerouler.translate(-100, -78, 144);

    if (enrouleDeroule==true) {
      rideauEnrouleDerouler = tablepcchaise.anyForm(130, 120, 2);
      rideauEnrouleDerouler.translate(-100, -22, 144);
    }
    rideauEnrouleDerouler.setFill(color(255));

    return rideauEnrouleDerouler;
  }

  PShape formePourTexture(int cote, int x, int y, String face, String oppose) {
    PImage img = loadImage(face);
    PImage img2 = loadImage(oppose);
    PShape groupe = createShape(GROUP);

    PShape c = createShape();
    PShape s = createShape();


    float cc = cote/2f;
    c.beginShape(QUADS);
    c.textureMode(NORMAL);
    c.texture(img);
    c.shininess(200.0);
    c.emissive(0, 0, 0);

    //face
    c.fill(color(0));
    c.vertex(-cc/x, -cc, -cc+y, 0, 0);
    c.vertex( cc, -cc, -cc+y, 1, 0);
    c.vertex( cc, cc, -cc+y, 1, 1);
    c.vertex(-cc/x, cc, -cc+y, 0, 1);
    c.endShape();

    s.beginShape(QUADS);
    s.textureMode(NORMAL);
    s.texture(img2);
    s.shininess(200.0);
    s.emissive(0, 0, 0);

    //opposit face 
    s.vertex(cc, -cc, -cc, 0, 0);
    s.vertex(-cc/x, -cc, -cc, 1, 0);
    s.vertex(-cc/x, cc, -cc, 1, 1);
    s.vertex(cc, cc, -cc, 0, 1);
    s.endShape();

    groupe.addChild(c);
    groupe.addChild(s);

    groupe.translate(20, 50, 248);

    return groupe;
  }
}
