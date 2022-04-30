import peasy.*;

Box[] cube;
Box tmp;

PeasyCam cam;
Rotations rot;

void settings() { 
  System.setProperty("jogl.disable.openglcore", "false");
  size(600, 600, P3D);
}

void setup() {
   //tmp = new Box(300, 300, 300, 30);
   int cubeSize = 50;
   cube = new Box[27];
   cam = new PeasyCam(this, 400);
   int dim = 3;
   int cnt = 0;
   for(int i = -1; i < 2; i++) {
     for(int j = -1; j < 2; j++) {
        for(int z = -1; z < 2; z++) {
            int X = i;
            int Y = j;
            int Z = z;
          
            cube[cnt++] = new Box(X, Y, Z, cubeSize); 
        }
     }
   }
  rot = new Rotations(cube);
}

void draw() {
    /*float[] rotations = cam.getRotations();
    for(int i = 0; i < 3; i++) {
       System.out.println(rotations[0] + " " + rotations[1] + " " + rotations[2]); 
    }*/
    background(100);  
  
    for(int i = 0; i < 27; i++){
        cube[i].show(); 
    }
}

void keyPressed() {
  System.out.println(key);
   switch(key) {
      case 'z':
        rot.rotateVertical(-1,1);
        break;
      case 'q':
        rot.rotateVertical(-1, -1);
        break;
      case 'e':
        rot.rotateVertical(1, -1);
        break;
      case 'c':
        rot.rotateVertical(1, 1);
        break;
      case 'w':
        rot.rotateVertical(0, -1);
        break;
      case 'x':
        rot.rotateVertical(0, 1);
        break;
        
      case 'Q':
        rot.rotateHorizontal(-1, -1);
        break;
      case 'A':
        rot.rotateHorizontal(0, -1);
        break;
      case 'Z':
        rot.rotateHorizontal(1, -1);
        break;
      case 'E':
        rot.rotateHorizontal(-1, 1);
        break;
      case 'D':
        rot.rotateHorizontal(0, 1);
        break;
      case 'C':
        rot.rotateHorizontal(1, 1);
        break;
   }
}
