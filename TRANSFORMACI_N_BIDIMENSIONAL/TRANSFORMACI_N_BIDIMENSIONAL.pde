// Variables
float angulo = 0;
float intensidad = 0;
float tx = 0; // Variable para traslación en x
float ty = 0; // Variable para traslación en y
float sx = 1; // Variable para escalamiento en x
float sy = 1; // Variable para escalamiento en y
float shx = 0; // Variable para sesgado en x
float shy = 0; // Variable para sesgado en y
boolean aumentar = true;

// Variables para almacenar los valores iniciales
float initialTx = 0; 
float initialTy = 0;
float initialSx = 1;
float initialSy = 1;
float initialShx = 0;
float initialShy = 0;

int cuadradoTimer = 0;
float cuadradoSize = 100;

// Tamaño de ventanas
void setup() {
  size(400, 400);
// Inicializar las variables iniciales
  initialTx = tx;
  initialTy = ty;
  initialSx = sx;
  initialSy = sy;
  initialShx = shx;
  initialShy = shy;
}
// Colores
void draw() {
  float rojo = random(0, 255);
  float verde = random(0, 255);
  float azul = random(0, 255);
  background(intensidad, 255, 255);
  stroke(intensidad, 0, 0);
  fill(rojo, verde, azul);
  
  pushMatrix(); // Guardar la matriz de transformación actual
  translate(200 + tx, 200 + ty); // Agregar tx y ty a la posición de traslación
  rotate(angulo);
  scale(sx, sy);
  shearX(shx);
  shearY(shy);
  rect(-cuadradoSize / 2, -cuadradoSize / 2, cuadradoSize, cuadradoSize);
  popMatrix(); // Restaurar la matriz de transformación original
  
  if (intensidad == 255) {
    aumentar = false;
  } else if (intensidad == 0) {
    aumentar = true;
  }
  
  if (aumentar) {
    intensidad += 1;
  } else {
    intensidad -= 1;
  }
}

void keyPressed() {
  if (key == '1') {
    angulo += 0.01;
  } else if (key == '2') {
    
// Cambiar tx y ty en un patrón cuadrado
    cuadradoTimer++;
    tx = cos(radians(cuadradoTimer * 90)) * 50; // Cuadrado de tamaño 100
    ty = sin(radians(cuadradoTimer * 90)) * 50; // Cuadrado de tamaño 100
  } else if (key == '3') {
    sx += 0.1; // Escalamiento en x
    sy += 0.1; // Escalamiento en y
  } else if (key == '4') {
    shx += 0.1; // Sesgado en x
    shy += 0.1; // Sesgado en y
  } else if (key == '5') {
    
// Restablecer las variables de transformación a sus valores iniciales
    tx = initialTx;
    ty = initialTy;
    sx = initialSx;
    sy = initialSy;
    shx = initialShx;
    shy = initialShy;
  }
}
