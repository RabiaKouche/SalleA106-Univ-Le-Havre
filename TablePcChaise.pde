
class TablePcChaise {
  TablePcChaise() {
  }


  PShape bureau(boolean unOuDeux, int x) {
    PShape acc[] = {groupeAccessoires(3), groupeAccessoires(3)};

    PShape groupe = createShape(GROUP);
    PShape pied []= {lesPieds(15/x, 200/x, 15/x, 60/x, 100/x, 160/x), lesPieds(15/x, 200/x, 15/x, 60/x, 100/x, 160/x)};
    PShape chaise[] = {chaise(x), chaise(x)};

    groupe.addChild(surface( 150/x, 10/x, 350/x));

    for (int i  = 0; i <acc.length; i++) {
      groupe.addChild(acc[i]);
      groupe.addChild(chaise[i]);

      if (unOuDeux==true) {
        if (i%2==0) {
          acc[i].translate(0, 0, 180/x);
          chaise[i].translate(0, 0, 180/x);
        }
      } else {
        acc[i].translate(0, 0, 90/x);
        chaise[i].translate(0, 0, 90/x);
      }
    }
    for (int i  = 0; i <pied.length; i++) {
      groupe.addChild(pied[i]);
      if (i%2==0) 
        pied[i].translate(0, 0, -320/x);
    }
    groupe.rotateY(PI/2); 
    groupe.translate(-380, 82, -110); 

    return groupe;
  }


  PShape anyForm(int longFace, int hauteur, int Larg) {
    PShape box = createShape(BOX, longFace, hauteur, Larg);
    box.setFill(color(0));
    return box;
  }
  PShape surface(int x, int y, int z) {
    PShape surface = createShape(BOX, x, y, z);
    surface.setFill(color(142, 195, 201));
    return surface;
  }

  PShape groupeAccessoires(int x) {
    PShape groupeAccessoires = createShape(GROUP);
    PShape uc1 = anyForm(60/x, 60/x, 20/x);
    PShape monitor = anyForm(6/x, 70/x, 110/x);
    PShape calMoniteur = anyForm(6/x, 70/x, 15/x);
    PShape clavier = anyForm(30/x, 5/x, 90/x);
    PShape reposeCal = anyForm(35/x, 5/x, 35/x);
    PShape caleLierEcran = anyForm(15/x, 10/x, 15/x);
    PShape souris = anyForm(17/x, 15/x, 12/x);


    uc1.translate(-5/x, -33/x, -150/x);
    monitor.translate(-5/x, -63/x, -60/x);
    calMoniteur.translate(-20/x, -34/x, -60/x);
    clavier.translate(40/x, -6/x, -60/x);
    reposeCal.translate(-20/x, -6/x, -60/x);
    caleLierEcran.translate(-15/x, -60/x, -60/x);
    souris.translate(40/x, -5/x, -130/x);


    calMoniteur.setFill(color(100, 100, 98));
    reposeCal.setFill(color(100, 100, 98));
    caleLierEcran.setFill(color(100, 100, 98));


    groupeAccessoires.addChild(uc1);
    groupeAccessoires.addChild(monitor);
    groupeAccessoires.addChild(calMoniteur);
    groupeAccessoires.addChild(clavier);
    groupeAccessoires.addChild(reposeCal);
    groupeAccessoires.addChild(caleLierEcran);
    groupeAccessoires.addChild(souris);

    return groupeAccessoires;
  }

  PShape lesPieds(int x, int y, int z, int xTrans, int yTrans, int zTtrans) {
    PShape groupePieds= createShape(GROUP);

    PShape pied1 = anyForm(x, y, z);
    PShape pied2 = anyForm(x, y, z);

    pied1.translate(xTrans, yTrans, zTtrans);
    pied2.translate(-xTrans, yTrans, zTtrans);

    groupePieds.addChild(pied1);
    groupePieds.addChild(pied2);

    return groupePieds;
  }

  PShape chaise(int x) {
    PShape chaise= createShape(GROUP);
    PShape pied []= {lesPieds(8/x, 125/x, 8/x, 40/x, 40/x, -45/x), lesPieds(8/x, 125/x, 8/x, 40/x, 40/x, -45/x)};
    PShape surface =  surface(90/x, 5/x, 120/x);
    PShape dos =  surface(5/x, 130/x, 120/x);

    surface.translate(100/x, -25/x, 0);
    surface.setFill(color(183, 144, 4));
    dos.setFill(color(183, 144, 4));
    dos.translate(145/x, -90/x, 0);

    chaise.addChild(surface);
    chaise.addChild(dos);

    for (int i  = 0; i <pied.length; i++) {
      pied[i].translate(100/x, 0, 0);
      pied[i].setFill(color(216, 196, 42));

      chaise.addChild(pied[i]);
      if (i%2==0) 
        pied[i].translate(0, 0, 90/x);
    }
    chaise.translate(10/x, 100/x, -90/x);

    return chaise;
  }
}
