//Senel Ekin Ozekin
void draw(){
//  frameRate(60);
//  clear();
  imageMode(CENTER);
  textAlign(CENTER,CENTER);
  
  //oyun başlangıç ekranı
  if(durum == 0){
    image(Baslangic,width/2,height/2);
  } 
  //oyunu başlattıktan sonra
  if(durum == 1){
    image(tanitim,width/2,height/2);
    fill(0,220);
    textFont(font);
    textSize(45);
    text("Oyun Kuralları",width/2,200);
    textSize(30);
    text("Öncelikle karakterinizi seçiniz.",width/2,yaziY);
    yaziY = yaziY - 8;
    yaziY = constrain(yaziY,280,1000);
    text("Saga ve sola hareket için yön tuşlarını kullanınız.",width/2,yaziY2);
    yaziY2 = yaziY2 - 8;
    yaziY2 = constrain(yaziY2,340,1100);
    text("Zıplamak için Space(boşluk) tuşunu kullanınız.",width/2,yaziY3);
    yaziY3 = yaziY3 - 8;
    yaziY3 = constrain(yaziY3,400,1200);
    text("Egilmek için aşagı yön tuşuna basınız. .",width/2,yaziY4);
    yaziY4 = yaziY4 - 8;
    yaziY4 = constrain(yaziY4,460,1300);
    text("4 tane seviye vardır.",width/2,yaziY5);
    yaziY5 = yaziY5 - 8;
    yaziY5 = constrain(yaziY5,520,1400);
    text("Oyun boyunca 3 canınız bulunmaktadır.",width/2,yaziY6);
    yaziY6 = yaziY6 - 8;
    yaziY6 = constrain(yaziY6,580,1500);
  
    //Atlama tuşu
    stroke(255);
    strokeWeight(2);
    fill(#0C8F02);
    beginShape();
    vertex(980,740);
    vertex(1100,740);
    vertex(1100,710);
    vertex(1180,770);
    vertex(1100,830);
    vertex(1100,800);
    vertex(980,800);
    endShape(CLOSE);
    
    fill(255,220);
    textSize(40);
    text("ATLA",1070,770);
  }
  
  //Karakter seçimi yapma
  if(durum == 2){
    background(0);
    fill(#46AA41);
    textFont(font2);
    textSize(50);
    text("Karaterinizi seçiniz...",width/2,150);
    textSize(20);
    image(karakter1, width/3, height/2);
    text("Kahraman",width/3, 670);
    image(karakter2, 2 * width/3, height/2);
    text("Prenses",2 * width/3, 670);
    
    if((seviyeK == 0)&&(seviyeP == 0)){
    karakterBulundu = get(mouseX, mouseY); //karakter seçimini algılamak için
    
    if((mouseX > 300) && (mouseX < 560) && (mouseY > 280) &&
    (mouseY < 610)){
      karakterSecimi = 1;
    }
    else if((mouseX > 730) && (mouseX < 1000) && (mouseY > 280) &&
    (mouseY < 610)){
      karakterSecimi = 2;
    }
    else
      karakterSecimi = 0;
    
    //Kahraman seçilirse
    if(karakterSecimi == 1){
      image(karakter1secimi,width/3,height/2);
      image(parildama,310,310);
      if(mousePressed){
        kahramanDurum = 1;
      }
    } //Prenses seçilirse
    else if(karakterSecimi == 2){
      image(karakter2secimi,2 * width/3, height/2);
      image(parildama,740,310);
      if(mousePressed){
        prensesDurum = 1;
      }
    }
      //Kahraman seçildikten sonra oyunun başlaması
      if(kahramanDurum == 1){
        levelTanitim1 = true;
      }
      //Prenses seçildikten sonra oyunun başlaması
      if(prensesDurum == 1){
        seviyeP = 1;
      }
    }
  }
  
  if(levelTanitim1==true){
    image(level[0],width/2,height/2);
    if((mouseX>1054)&&(mouseX<1831)&&(mouseY>778)&&(mouseY<832)){
      if(mousePressed){
        levelTanitim1 = false;
        if(kahramanDurum == 1)
          seviyeK = 1;
      }
    }
  }
  
  //Zıpladıktan sonra geri düşüş için
    vy+=yercekimi;
    Ky+=vy;
    Py+=vy;
    if(Ky > height){
      Ky = height;
      vy = 0;
      zipla = true;
    }
    if(Py > height){
      Py = height;
      vy = 0;
      zipla = true;
    }
     
  if(seviyeK == 1){
    background(#0072C6);
    if((yuru == false)&&(egilme == false))
      image(kahraman1,Kx,Ky - 230);
    else if((yuru == true)&&(egilme == false))
      image(kahraman2,Kx,Ky - 230); 
    if(egilme == true)
      image(kahraman1egilme,Kx,Ky - 223);
    
    //resetlemek için
    if(Kx<-50){
      Kx = 100;
      Bhiz = 0;
      kaktusX = 700;
      kaktusY = 690;}
    
    image(zemin,650,500,1300,900);
    //Bulutlar ve hareketleri için
    for(int i = -100; i<=width+100; i+= 900){
      image(bulut,Bhiz+i,100);
    }
    for(int j =-600; j<= width+800; j+=900){
      image(buyukBulut,Bhiz+j,180);
    }
      Bhiz += 1.5;
      if(Bhiz>800)
        Bhiz = -100;
        
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    
    image(kaktus,kaktusX-hiz,kaktusY);
    image(kaktus,kaktusX-hiz+500,kaktusY);
    image(kaktus,kaktusX-hiz+1000,kaktusY);
    hiz += 5;
    if(dist(Kx,Ky-230,kaktusX-hiz,kaktusY)<145){
      Kx = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    if(dist(Kx,Ky-230,kaktusX-hiz+500,kaktusY)<145){
      Kx = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    if(dist(Kx,Ky-230,kaktusX-hiz+1000,kaktusY)<145){
      Kx = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    
    //değirmen
    pushMatrix();
    fill(#E3AEF0);
    translate(650,240);
    rotate(radians(b));
    noStroke();
    ellipse(0,-200,80,400);
    ellipse(200,0,400,80);
    ellipse(0,200,80,400);
    ellipse(-200,0,400,80);
    fill(255);
    ellipse(0,0,50,50);
    b = b - 2;
    popMatrix();
    stroke(255);
    strokeWeight(5);
    line(650,240,650,780);
    //değirmene çarpması durumunda
    int side1 = get(Kx-107,Ky-207);
    int side2 = get(Kx+107,Ky-207);
    int side3 = get(Kx-107,Ky+207);
    int side4 = get(Kx+107,Ky+207);
    if((side1 == -1855760.0) || (side2 == -1855760.0) ||
    (side3 == -1855760.0) || (side4 == -1855760.0)){
      Kx = 100;
      c -= 100;
    }
    if(Kx >= 1350){
      levelTanitim2 = true;
      vy = 0;
      kaktusX = -1000;
      kaktusY = -100;
      Bhiz = 0;
      hiz = 0;
      Kx = 150;
      Ky = 800;
      b = 0;
      vy = 0;
    }
  }
   if(levelTanitim2==true){
    image(level[1],width/2,height/2);
    if((mouseX>1054)&&(mouseX<1831)&&(mouseY>778)&&(mouseY<832)){
      if(mousePressed){
        levelTanitim2 = false;
        if(seviyeK ==1)
          seviyeK = 2;
      }
    }
  }
  if(c<=-240){
    image(gameover,width/2,height/2);
    if((mouseX > 525)&&(mouseX < 783)&&(mouseY > 699)&&(mouseY < 810)){
      if(mousePressed){
        durum = 0;
        seviyeK = 0;
        c = 60;
        kaktusX = 700;
        kaktusY = 690;
        Kx = 150;
        Ky = 800;
        hiz = 0;
        karakterSecimi = 0;
        prensesDurum = 0;
        kahramanDurum = 0;
        puan = 0;
        sayac = 5;
        sY = 110;
        ilerlemeYay = false;
        ilerlemeYay2 = false;
        ilerlemeYay3 = false;
        dur = false;
        enemySpeed = 4;
        enemySpeed2 = 4;
        enemySpeed3 = 1.8;
        dX = 0;
        dY = 650;
        d2Y = 650;
        d2X = 1500;
        d3X = 520;
        d3Y = 400;
        yayX = 650; 
        yay0X = -5;
        yay0Y = 650;
        yay1X = 5;
        yay1Y = 650;
        yay2X = 0;
        yay2Y = 700;
        kilicX = 280;
        kilicY = 700;
        medusaX = 1000;
        medusaY = 400;
        artma = 3;
        saldiri = false;
        donus = false;
        medusaHealthy = 400;
      }
    }
  }
  if(seviyeK == 2){
    background(#006AB4);
    image(yol,width/2,height/2);
    if((yuru == false)&&(egilme == false))
      image(kahraman1,Kx,Ky - 230);
    else if((yuru == true)&&(egilme == false))
      image(kahraman2,Kx,Ky - 230); 
    if(egilme == true)
      image(kahraman1egilme,Kx,Ky - 223);
      
    image(zemin,650,500,1300,900);
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    image(yay[2],yayX,720);
    if(Kx >= 640){
      yayX = -100;
      if(frameCount % 20 == 0)
        sayac = sayac - 1;
      fill(255);
      textSize(100);
      text(sayac,620,sY);
    }
    if(sayac == 0){
      dur = true;
      sY= -100;
    }
    if(dur == true){
      sayac = 0;
      image(dusman[0],dX,dY);
      image(dusman[0],d2X,d2Y);
      image(dusman[1],d3X,d3Y);
      dX = dX + enemySpeed; //soldaki düşman
      if((dX >= 500)||(dX <= -150))
        enemySpeed = enemySpeed * -1;
      d2X = d2X - enemySpeed2; //sağdaki düşman
      if((d2X <= 750)||(d2X >= 1510))
        enemySpeed2 = enemySpeed2 * -1;
      d3Y = d3Y + enemySpeed3; //yukardaki düşman
      if((d3Y >= 550)||(d3Y <= 290))
        enemySpeed3 = enemySpeed3 * -1;
      //sağ taraftaki düşmaya atılan yay için
      if((mousePressed)&&(mouseX >= 750)&&(mouseY >= 520)&&(mouseY <= 790)){
        ilerlemeYay = true;
      }
      if(ilerlemeYay == true){
        image(yay[0],Kx + yay0X, yay0Y);
        yay0X = yay0X + yaySpeed;
      }
      //sol taraftaki düşmana atılan yay için
      if((mousePressed)&&(mouseX <= 500)&&(mouseY >= 520)&&(mouseY <= 790)){
        ilerlemeYay2 = true;
      }
      if(ilerlemeYay2 == true){
        image(yay[1],Kx - yay1X, yay1Y);
        yay1X = yay1X + yaySpeed;
      }
      //yukardan gelen düşman için
      if((mousePressed)&&(mouseY <= 540)&&(mouseX >= 480)&&(mouseX <= 540)){
        ilerlemeYay3 = true;
      }
      if(ilerlemeYay3 == true){
        image(yay[2],Kx + yay2X,yay2Y);
        yay2X -= 5.5;
        yay2Y = yay2Y - yaySpeed;
      }
      if(yay2Y <= 100){
          ilerlemeYay3 = false;
          yay2Y = 700;
          yay2X = 0;}
      //düşmanın kahramana çarpması
      if((dist(Kx,Ky-230,dX,dY)<100)||(dist(Kx,Ky-230,d2X,d2Y)<100)||
      (dist(Kx,Ky-230,d3X,d3Y)<200)){
        c -= 100;
        Kx = 650;
      }
      //düşmanların vurulması
      if(dist(dX,dY,Kx-yay1X,yay1Y)<100){
        dX=-140;
        ilerlemeYay2 = false;
        yay1X = 5;
        enemySpeed += 5;
        puan += 1;
      }
      if(dist(d2X,d2Y,Kx+yay0X,yay0Y)<100){
        d2X=1500;
        ilerlemeYay = false;
        yay0X = -5;
        enemySpeed2 += 3.5;
        puan += 1;
      }
      if(dist(d3X,d3Y,Kx+yay2X,yay2Y)<100){
        d3X = random(480,540);
        d3Y=300;
        ilerlemeYay3 = false;
        yay2X = 0;
        yay2Y = 700;
        enemySpeed3 += 2.2;
        puan += 1;
      }
    }
    textSize(35);
    fill(255);
    text("Puan = " + puan, 1150,50);
    if(puan >= 15){
      levelTanitim3 = true;
      Kx = 150;
      Ky = 800;
      vy = 0;
    }
  }
  if(levelTanitim3==true){
    image(level[2],width/2,height/2);
    if((mouseX>1054)&&(mouseX<1831)&&(mouseY>778)&&(mouseY<832)){
      if(mousePressed){
        levelTanitim3 = false;
        if(seviyeK ==2)
          seviyeK = 3;
      }
    }
  }
  if(seviyeK == 3){
    background(#006AB4);
    image(seviye3,width/2,height/2);
    if((yuru == false)&&(egilme == false))
      image(kahraman1,Kx,Ky - 180);
    else if((yuru == true)&&(egilme == false))
      image(kahraman2,Kx,Ky - 180); 
    if(egilme == true)
      image(kahraman1egilme,Kx,Ky - 173);
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
      
    ipucu = get(mouseX,mouseY);
    if((mouseX>=1214)&&(mouseX<=1274)&&(mouseY>=12)&&(mouseY<=87)){
      fill(255);
      textFont(font);
      textSize(35);
      text("Kapının önüne ilerleyiniz.",245,179);
    }
    
    if((Kx >= 1090)&&(Ky >= 514)){
      sahne = 1;
    }
    if(sahne == 1){
      image(door,width/2,height/2);
      ipucu2 = get(mouseX,mouseY);
      if((mouseX>=48)&&(mouseX<=173)&&(mouseY>=44)&&(mouseY<=200)){
        fill(255);
        textSize(20);
        text("Renklere uygun ormandaki", 170,230);
        text("canlıları veya nesneleri", 170,260);
        text("bularak sayıları kadar", 175,290);
        text("olan satırdaki renge basınız.", 170,320);
        text("Sırasıyla sarı, turuncu,", 170,350);
        text("kahverengi ve beyaz renklerdeki", 175,380);
        text("dogru tuşa basmalısınız", 170,410);
        textSize(50);
        text("1",1020,200);
        text("2",1020,325);
        text("3",1020,450);
        text("4",1020,574);
        text("5",1020,698);
      }
      if((mouseX>338)&&(mouseX<490)&&(mouseY>636)&&(mouseY<760)&&(mousePressed)){
         sahne = 1; 
      }
      else if((mouseX>494)&&(mouseX<646)&&(mouseY>263)&&(mouseY<388)&&(mousePressed)){
         sahne = 0; 
       }
      else if((mouseX>650)&&(mouseX<801)&&(mouseY>263)&&(mouseY<388)&&(mousePressed)){
         sahne = 0; 
       }
      else if((mouseX>805)&&(mouseX<960)&&(mouseY>512)&&(mouseY<636)&&(mousePressed)){
         sahne = 0;
         levelTanitim4 = true;
         Kx = 150;
         Ky = 800;
         vy = 0;
       }
      else if(mousePressed){
        c = c - 100;
        sahne = 0;
        Kx = 1000; 
      }

    }
  }
  if(levelTanitim4==true){
    image(level[3],width/2,height/2);
    if((mouseX>1054)&&(mouseX<1831)&&(mouseY>778)&&(mouseY<832)){
      if(mousePressed){
        levelTanitim4 = false;
        if(seviyeK ==3)
          seviyeK = 4;
      }
    }
  }
  if(seviyeK == 4){
    background(#006AB4);
    image(seviye4,width/2,height/2);
    
    if((yuru == false)&&(egilme == false))
      image(kahraman1,Kx,Ky - 230);
    else if((yuru == true)&&(egilme == false))
      image(kahraman2,Kx,Ky - 230); 
    if(egilme == true)
      image(kahraman1egilme,Kx,Ky - 223);
      
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    
    image(kilic,kilicX,kilicY);
    if(Kx >= 300){
      kilicX = Kx + 100;
      kilicY = Ky - 230;
      image(dusman[2],medusaX,medusaY);
      fill(#D60404);
      noStroke();
      rect(medusaX-200,medusaY-300,medusaHealthy,20);
      medusaY +=artma;
      if(medusaY > 550 || medusaY < 400)
        artma = artma * -1;
      if(saldiri == true){
        medusaX -= 5;
        artma = 0;
      }
      if((dist(kilicX,kilicY,medusaX,medusaY)<220)){
        medusaHealthy -= 10;
        saldiri = true;
      }
      if((dist(Kx,Ky-230,medusaX,medusaY)<250)){
        c -= 100;
        saldiri = false;
        Kx = 300;
        donus = true;
      }
      if(donus == true){
        medusaX += 5;
        if(medusaX == 1000){
          donus = false;
          artma = 3;
        }
      }
      if(medusaHealthy <= 0)
        medusaX = 1900;
      if(medusaX <= -250)
        medusaX = 1000;
      if(Kx>= 1080){
        image(win,width/2,height/2);
        if((mouseX > 525)&&(mouseX < 783)&&(mouseY > 699)&&(mouseY < 810)){
          if(mousePressed){
            durum = 0;
            seviyeK = 0;
            c = 60;
            puan = 0;
            Kx = 150;
            Ky = 800;
            sayac = 5;
            sY = 110;
            ilerlemeYay = false;
            ilerlemeYay2 = false;
            ilerlemeYay3 = false;
            dur = false;
            enemySpeed = 4;
            enemySpeed2 = 4;
            enemySpeed3 = 1.8;
            dX = 0;
            dY = 650;
            d2Y = 650;
            d2X = 1500;
            d3X = 520;
            d3Y = 400;
            yayX = 650; 
            yay0X = -5;
            yay0Y = 650;
            yay1X = 5;
            yay1Y = 650;
            yay2X = 0;
            yay2Y = 700;
            kilicX = 280;
            kilicY = 700;
            medusaX = 1000;
            medusaY = 400;
            artma = 3;
            saldiri = false;
            donus = false;
            medusaHealthy = 400;
          }
        }
      }
    }
  }
  ////////////////////////////////////////////////////////////////////////////
  //Prensesin Seviyeleri
    if(seviyeP == 1){
    background(#0072C6);
    if((yuru == false)&&(egilme == false))
      image(prenses1,Px,Py - 230);
    else if((yuru == true)&&(egilme == false))
      image(prenses2,Px,Py - 230); 
    if(egilme == true)
      image(prenses1egilme,Px,Py - 223);
    
    //resetlemek için
    if(Px<-50){
      Px = 100;
      Bhiz = 0;
      kaktusX = 700;
      kaktusY = 690;}
    
    image(zemin,650,500,1300,900);
    //Bulutlar ve hareketleri için
    for(int i = -100; i<=width+100; i+= 900){
      image(bulut,Bhiz+i,100);
    }
    for(int j =-600; j<= width+800; j+=900){
      image(buyukBulut,Bhiz+j,180);
    }
      Bhiz += 1.5;
      if(Bhiz>800)
        Bhiz = -100;
        
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    
    image(kaktus,kaktusX-hiz,kaktusY);
    image(kaktus,kaktusX-hiz+500,kaktusY);
    image(kaktus,kaktusX-hiz+1000,kaktusY);
    hiz += 5;
    if(dist(Px,Py-230,kaktusX-hiz,kaktusY)<145){
      Px = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    if(dist(Px,Py-230,kaktusX-hiz+500,kaktusY)<145){
      Px = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    if(dist(Px,Py-230,kaktusX-hiz+1000,kaktusY)<145){
      Px = 100;
      hiz = 0;
      kaktusX = 700;
      c -= 100;
    }
    
    //değirmen
    pushMatrix();
    fill(#E3AEF0);
    translate(650,240);
    rotate(radians(b));
    noStroke();
    ellipse(0,-200,80,400);
    ellipse(200,0,400,80);
    ellipse(0,200,80,400);
    ellipse(-200,0,400,80);
    fill(255);
    ellipse(0,0,50,50);
    b = b - 2;
    popMatrix();
    stroke(255);
    strokeWeight(5);
    line(650,240,650,780);
    //değirmene çarpması durumunda
    int side1 = get(Px-107,Py-207);
    int side2 = get(Px+107,Py-207);
    int side3 = get(Px-107,Py+207);
    int side4 = get(Px+107,Py+207);
    if((side1 == -1855760.0) || (side2 == -1855760.0) ||
    (side3 == -1855760.0) || (side4 == -1855760.0)){
      Px = 100;
      c -= 100;
    }
    if(Px >= 1350){
      seviyeP = 2;
      vy = 0;
      kaktusX = -1000;
      kaktusY = -100;
      Bhiz = 0;
      hiz = 0;
      Px = 150;
      Py = 800;
      b = 0;
      vy = 0;
    }
  }
  if(c<=-240){
    image(gameover,width/2,height/2);
    if((mouseX > 525)&&(mouseX < 783)&&(mouseY > 699)&&(mouseY < 810)){
      if(mousePressed){
        durum = 0;
        seviyeP = 0;
        vy = 0;
        c = 60;
        kaktusX = 700;
        kaktusY = 690;
        Px = 150;
        Py = 800;
        hiz = 0;
        karakterSecimi = 0;
        prensesDurum = 0;
        kahramanDurum = 0;
        puan = 0;
        sayac = 5;
        sY = 110;
        ilerlemeYay = false;
        ilerlemeYay2 = false;
        ilerlemeYay3 = false;
        dur = false;
        enemySpeed = 4;
        enemySpeed2 = 4;
        enemySpeed3 = 1.8;
        dX = 0;
        dY = 650;
        d2Y = 650;
        d2X = 1500;
        d3X = 520;
        d3Y = 400;
        yayX = 650; 
        yay0X = -5;
        yay0Y = 650;
        yay1X = 5;
        yay1Y = 650;
        yay2X = 0;
        yay2Y = 700;
        kilicX = 280;
        kilicY = 700;
        medusaX = 1000;
        medusaY = 400;
        artma = 3;
        saldiri = false;
        donus = false;
        medusaHealthy = 400;
      }
    }
  }
  if(seviyeP == 2){
    background(#006AB4);
    image(yol,width/2,height/2);
    if((yuru == false)&&(egilme == false))
      image(prenses1,Px,Py - 230);
    else if((yuru == true)&&(egilme == false))
      image(prenses2,Px,Py - 230); 
    if(egilme == true)
      image(prenses1egilme,Px,Py - 223);
      
    image(zemin,650,500,1300,900);
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    image(yay[2],yayX,720);
    if(Px >= 640){
      yayX = -100;
      if(frameCount % 20 == 0)
        sayac = sayac - 1;
      fill(255);
      textSize(100);
      text(sayac,620,sY);
    }
    if(sayac == 0){
      dur = true;
      sY= -100;
    }
    if(dur == true){
      sayac = 0;
      image(dusman[0],dX,dY);
      image(dusman[0],d2X,d2Y);
      image(dusman[1],d3X,d3Y);
      dX = dX + enemySpeed; //soldaki düşman
      if((dX >= 500)||(dX <= -150))
        enemySpeed = enemySpeed * -1;
      d2X = d2X - enemySpeed2; //sağdaki düşman
      if((d2X <= 750)||(d2X >= 1510))
        enemySpeed2 = enemySpeed2 * -1;
      d3Y = d3Y + enemySpeed3; //yukardaki düşman
      if((d3Y >= 550)||(d3Y <= 290))
        enemySpeed3 = enemySpeed3 * -1;
      //sağ taraftaki düşmaya atılan yay için
      if((mousePressed)&&(mouseX >= 750)&&(mouseY >= 520)&&(mouseY <= 790)){
        ilerlemeYay = true;
      }
      if(ilerlemeYay == true){
        image(yay[0],Px + yay0X, yay0Y);
        yay0X = yay0X + yaySpeed;
      }
      //sol taraftaki düşmana atılan yay için
      if((mousePressed)&&(mouseX <= 500)&&(mouseY >= 520)&&(mouseY <= 790)){
        ilerlemeYay2 = true;
      }
      if(ilerlemeYay2 == true){
        image(yay[1],Px - yay1X, yay1Y);
        yay1X = yay1X + yaySpeed;
      }
      //yukardan gelen düşman için
      if((mousePressed)&&(mouseY <= 540)&&(mouseX >= 480)&&(mouseX <= 540)){
        ilerlemeYay3 = true;
      }
      if(ilerlemeYay3 == true){
        image(yay[2],Px + yay2X,yay2Y);
        yay2X -= 5.5;
        yay2Y = yay2Y - yaySpeed;
      }
      if(yay2Y <= 100){
          ilerlemeYay3 = false;
          yay2Y = 700;
          yay2X = 0;}
      //düşmanın kahramana çarpması
      if((dist(Px,Py-230,dX,dY)<100)||(dist(Px,Py-230,d2X,d2Y)<100)||
      (dist(Px,Py-230,d3X,d3Y)<200)){
        c -= 100;
        Px = 650;
      }
      //düşmanların vurulması
      if(dist(dX,dY,Px-yay1X,yay1Y)<100){
        dX=-140;
        ilerlemeYay2 = false;
        yay1X = 5;
        enemySpeed += 5;
        puan += 1;
      }
      if(dist(d2X,d2Y,Px+yay0X,yay0Y)<100){
        d2X=1500;
        ilerlemeYay = false;
        yay0X = -5;
        enemySpeed2 += 3.5;
        puan += 1;
      }
      if(dist(d3X,d3Y,Px+yay2X,yay2Y)<100){
        d3X = random(480,540);
        d3Y=300;
        ilerlemeYay3 = false;
        yay2X = 0;
        yay2Y = 700;
        enemySpeed3 += 2.2;
        puan += 1;
      }
    }
    textSize(35);
    fill(255);
    text("Puan = " + puan, 1150,50);
    if(puan >= 15){
      seviyeP +=1;
      Px = 150;
      Py = 800;
      vy = 0;
    }
  }
  if(seviyeP == 3){
    background(#006AB4);
    image(seviye3,width/2,height/2);
    if((yuru == false)&&(egilme == false))
      image(prenses1,Px,Py - 180);
    else if((yuru == true)&&(egilme == false))
      image(prenses2,Px,Py - 180); 
    if(egilme == true)
      image(prenses1egilme,Px,Py - 173);
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
      
    ipucu = get(mouseX,mouseY);
    if((mouseX>=1214)&&(mouseX<=1274)&&(mouseY>=12)&&(mouseY<=87)){
      fill(255);
      textFont(font);
      textSize(35);
      text("Kapının önüne ilerleyiniz.",245,179);
    }
    
    if((Px >= 1090)&&(Py >= 514)){
      sahne = 1;
    }
    if(sahne == 1){
      image(door,width/2,height/2);
      ipucu2 = get(mouseX,mouseY);
      if((mouseX>=48)&&(mouseX<=173)&&(mouseY>=44)&&(mouseY<=200)){
        fill(255);
        textSize(20);
        text("Renklere uygun ormandaki", 170,230);
        text("canlıları veya nesneleri", 170,260);
        text("bularak sayıları kadar", 175,290);
        text("olan satırdaki renge basınız.", 170,320);
        text("Sırasıyla sarı, turuncu,", 170,350);
        text("kahverengi ve beyaz renklerdeki", 175,380);
        text("dogru tuşa basmalısınız", 170,410);
        textSize(50);
        text("1",1020,200);
        text("2",1020,325);
        text("3",1020,450);
        text("4",1020,574);
        text("5",1020,698);
      }
      if((mouseX>338)&&(mouseX<490)&&(mouseY>636)&&(mouseY<760)&&(mousePressed)){
        sahne = 1;  
      }
      else if((mouseX>494)&&(mouseX<646)&&(mouseY>263)&&(mouseY<388)&&(mousePressed)){
       sahne = 0; 
       }
      else if((mouseX>650)&&(mouseX<801)&&(mouseY>263)&&(mouseY<388)&&(mousePressed)){
         sahne = 0; 
       }
      else if((mouseX>805)&&(mouseX<960)&&(mouseY>512)&&(mouseY<636)&&(mousePressed)){
         sahne = 0;
         seviyeP +=1;
         Px = 150;
         Py = 800;
         vy = 0;
       }
      else if(mousePressed){
        c = c - 100;
        sahne = 0;
        Px = 1000; 
      }
    }
  }
  if(seviyeP == 4){
    background(#006AB4);
    image(seviye4,width/2,height/2);
    
    if((yuru == false)&&(egilme == false))
      image(prenses1,Px,Py - 230);
    else if((yuru == true)&&(egilme == false))
      image(prenses2,Px,Py - 230); 
    if(egilme == true)
      image(prenses1egilme,Px,Py - 223);
      
    image(can,c,80);
    image(can,c+90,80);
    image(can,c+180,80);
    
    image(kilic,kilicX,kilicY);
    if(Px >= 300){
      kilicX = Px + 100;
      kilicY = Py - 230;
      image(dusman[2],medusaX,medusaY);
      fill(#D60404);
      noStroke();
      rect(medusaX-200,medusaY-300,medusaHealthy,20);
            medusaY +=artma;
      if(medusaY > 550 || medusaY < 400)
        artma = artma * -1;
      if(saldiri == true){
        medusaX -= 5;
        artma = 0;
      }
      if((dist(kilicX,kilicY,medusaX,medusaY)<220)){
        medusaHealthy -= 10;
        saldiri = true;
      }
      if((dist(Px,Py-230,medusaX,medusaY)<250)){
        c -= 100;
        saldiri = false;
        Px = 300;
        donus = true;
      }
      if(donus == true){
        medusaX += 5;
        if(medusaX == 1000){
          donus = false;
          artma = 3;
        }
      }
      if(medusaHealthy <= 0)
        medusaX = 1900;
      if(medusaX <= -250)
        medusaX = 1000;
      if(Px>= 1080){
        image(win,width/2,height/2);
        if((mouseX > 525)&&(mouseX < 783)&&(mouseY > 699)&&(mouseY < 810)){
          if(mousePressed){
            durum = 0;
            seviyeP = 0;
            vy = 0;
            c = 60;
            Px = 150;
            Py = 800;
            sayac = 5;
            sY = 110;
            ilerlemeYay = false;
            ilerlemeYay2 = false;
            ilerlemeYay3 = false;
            dur = false;
            enemySpeed = 4;
            enemySpeed2 = 4;
            enemySpeed3 = 1.8;
            dX = 0;
            dY = 650;
            d2Y = 650;
            d2X = 1500;
            d3X = 520;
            d3Y = 400;
            yayX = 650; 
            yay0X = -5;
            yay0Y = 650;
            yay1X = 5;
            yay1Y = 650;
            yay2X = 0;
            yay2Y = 700;
            kilicX = 280;
            kilicY = 700;
            medusaX = 1000;
            medusaY = 400;
            artma = 3;
            saldiri = false;
            donus = false;
            medusaHealthy = 400;
          }
        }
      }
    }
      
  }
}
