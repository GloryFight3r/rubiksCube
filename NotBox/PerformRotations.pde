import java.util.List;
import javafx.util.Pair;

public class Rotations {
   private Box[] cube;
   public Rotations(Box[] cube) {
     this.cube = cube;
   }
   
   void rotateVertical(int pos, int rotation) {
      for(int i = 0; i < cube.length; i++) {
         if(cube[i].getX() == pos) {
            PMatrix2D tmp = new PMatrix2D();
            Box tempCube = cube[i];
            
            tmp.rotate(rotation*HALF_PI);
            tmp.translate(tempCube.getY(), tempCube.getZ());
            
            tempCube.setMatrix(round(tempCube.getX()), round(tmp.m02), round(tmp.m12));
            tempCube.rotateY(rotation);
          }
      }
   }
   void rotateHorizontal(int pos, int rotation) {
     for(int i = 0; i < cube.length; i++) {
         if(cube[i].getY() == pos) {
            PMatrix2D tmp = new PMatrix2D();
            Box tempCube = cube[i];
            
            tmp.rotate(rotation*HALF_PI);
            tmp.translate(tempCube.getX(), tempCube.getZ());
            
            tempCube.setMatrix(round(tmp.m02), round(tempCube.getY()), round(tmp.m12));
            tempCube.rotateX(rotation);
          }
      }
   }
}
