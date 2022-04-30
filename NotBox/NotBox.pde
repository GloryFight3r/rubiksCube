
class Box{
  PMatrix3D matr;
  private int x, y, z;
  private float len;
  private color[] colors;
  
  public Box(int x, int y, int z, float len) {
      matr = new PMatrix3D();
      matr.translate(x*len, y*len, z*len);
      
      this.x = x;
      this.y = y;
      this.z = z;
      
      this.len = len;
      colors = new color[]{#FFFF00, #FFFFFF, #FF0000, #FF8000, #80FF00, #0000FF};
  }
   
   public void setMatrix(int x, int y, int z) {
     matr.reset();
     matr.translate(x*len, y*len, z*len);
     
     this.x = x;
     this.y = y;
     this.z = z;
   }
   
   public int getX() {
      return x; 
   }
   public int getY() {
      return y; 
   }
   public int getZ() {
      return z; 
   }
   
   public void shiftIndexes(List<Integer> n_indexes, int dir) {
     //int cnt = (dir + k) % k;
     for(int j = 0; j < (dir==-1? 3 : 1); j++) {
       color[] save = colors.clone();
       int cnt = 0;
       for(int i = 0; i < 6; i++) {
         colors[i] = save[n_indexes.get(i)];
       }
     }
   }
   
   public void rotateX(int dir) {
     List<Integer> indexes = new ArrayList();
     indexes.add(3); indexes.add(2); indexes.add(0); indexes.add(1); indexes.add(4); indexes.add(1);
     shiftIndexes(indexes, dir);
   }
   
   public void rotateY(int dir) {
     List<Integer> indexes = new ArrayList();
     indexes.add(5); indexes.add(4); indexes.add(2); indexes.add(3); indexes.add(0); indexes.add(1);
     shiftIndexes(indexes, dir);
   }
   
  void show() {
    stroke(0);
    strokeWeight(8);
    
    pushMatrix();
    
    applyMatrix(matr);
    int cnt = 0;
    for(int i = 0; i < 2; i++) {
      beginShape(QUADS);
      
      fill(colors[cnt++]);
      
      vertex(-len/2, -len/2, i==0? -len/2:len/2);
      vertex(-len/2, len/2, i==0? -len/2:len/2);
      vertex(len/2, len/2, i==0? -len/2:len/2);
      vertex(len/2, -len/2, i==0? -len/2:len/2);
      
      endShape();
    }
    
    for(int i = 0; i < 2; i++) {
      beginShape(QUADS);
      fill(colors[cnt++]);
      
      vertex(i==0? -len/2:len/2, -len/2, -len/2);
      vertex(i==0? -len/2:len/2, -len/2, len/2);
      vertex(i==0? -len/2:len/2, len/2, len/2);
      vertex(i==0? -len/2:len/2, len/2, -len/2);
      
      endShape();
    }
    
    for(int i = 0; i < 2; i++) {
      beginShape(QUADS);
      fill(colors[cnt++]);
      
      vertex(-len/2, i==0? -len/2:len/2, -len/2);
      vertex(-len/2, i==0? -len/2:len/2, len/2);
      vertex(len/2, i==0? -len/2:len/2, len/2);
      vertex(len/2, i==0? -len/2:len/2, -len/2);
      
      endShape();
    }
    
    popMatrix();
  }
}
