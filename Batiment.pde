
class Batiment {
  Batiment() {
  }

  PShape creerBatiment(int cote, String plafond) {
    PShape c = createShape();
    PShape s = createShape();

    float cc = cote/2f;
    c.beginShape(QUADS);

    PImage img = loadImage(plafond);
    PShape groupe = createShape(GROUP);    

    //face
    c.fill(color(237, 237, 237));
    c.vertex(-cc*3, -cc, cc);
    c.vertex( cc, -cc, cc, 0, 1);
    c.vertex( cc, cc, cc, 1, 1 );
    c.vertex(-cc*3, cc, cc, 1, 0);

    //droite bfgc
    c.fill(color(237, 237, 237));
    c.vertex(cc, cc, cc, 1, 0);
    c.vertex(cc, cc, -cc*4, 1, 1);
    c.vertex(cc, -cc, -cc*4, 0, 1);
    c.vertex(cc, -cc, cc, 0, 0);

    //opposit face 
    c.fill(color(237, 237, 237));
    c.vertex(cc, -cc, -cc*4, 0, 0);
    c.vertex(-cc*3, -cc, -cc*4, 0, 1);
    c.vertex(-cc*3, cc, -cc*4, 1, 1);
    c.vertex(cc, cc, -cc*4, 1, 0);

    //bas
    c.fill(color(206, 83, 21));
    c.vertex(-cc*3, cc, cc, 0, 0);
    c.vertex(cc, cc, cc, 0, 1);
    c.vertex(cc, cc, -cc*4, 1, 1);
    c.vertex(-cc*3, cc, -cc*4, 1, 0);

    //gauche
    c.fill(color(237, 237, 237));
    c.vertex(-cc*3, -cc, -cc*4, 0, 0);
    c.vertex(-cc*3, -cc, cc, 0, 1);
    c.vertex(-cc*3, cc, cc, 1, 1);
    c.vertex(-cc*3, cc, -cc*4, 1, 0);

    //hautExterieur
    c.vertex(-cc*3, -cc-1, -cc*4, 0, 0);
    c.vertex(cc, -cc-1, -cc*4, 0, 1);
    c.vertex(cc, -cc-1, cc, 1, 1);
    c.vertex(-cc*3, -cc-1, cc, 1, 0);
    c.endShape();


    s.beginShape(QUADS); 
    s.textureMode(NORMAL);
    s.texture(img);
    s.shininess(200.0);
    s.emissive(0, 0, 0);
    s.vertex(-cc*3, -cc, -cc*4, 0, 0);
    s.vertex(cc, -cc, -cc*4, 0, 1);
    s.vertex(cc, -cc, cc, 1, 1);
    s.vertex(-cc*3, -cc, cc, 1, 0);
    s.endShape();


    groupe.addChild(c);
    groupe.addChild(s);

    return groupe;
  }
}
