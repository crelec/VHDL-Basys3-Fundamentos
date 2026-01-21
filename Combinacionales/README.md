# Lógica Combinacional en VHDL  
**Implementaciones bajo IEEE 1076-2008**

---

## 1. Introducción

La lógica combinacional constituye la base del diseño digital. En este directorio se presentan ejemplos de circuitos combinacionales implementados en **VHDL**, siguiendo estrictamente el estándar **IEEE 1076-2008**.

Todos los diseños aquí contenidos se caracterizan porque sus salidas dependen **únicamente del valor instantáneo de las entradas**, sin utilizar elementos de memoria ni señales de reloj.

El objetivo de esta carpeta es proporcionar una colección estructurada de ejemplos fundamentales, que sirvan como referencia para el estudio posterior de sistemas secuenciales y diseños digitales más complejos.

---

## 2. Estándar y criterios de diseño

### 2.1 Norma utilizada
- **VHDL – IEEE 1076-2008**

### 2.2 Librerías empleadas
- `IEEE.STD_LOGIC_1164`
- `IEEE.NUMERIC_STD`

### 2.3 Características generales
- Diseño **puramente combinacional**
- Uso de `process(all)` (VHDL-2008)
- Asignación completa de salidas
- Uso de tipos `unsigned` y `signed` cuando aplica
- Uso de **genéricos** para escalabilidad
- Separación clara entre diseño y simulación

---

## 3. Metodología de simulación.

Todos los ejemplos utilizan una metodología de simulación común caracterizada por:

- Testbench independiente del diseño
- Instanciación directa mediante `entity work.<nombre>`
- Generación sistemática de estímulos con bucles `for`
- Cobertura completa del rango de entradas
- Adaptación automática a parámetros genéricos

Esta metodología permite pruebas más completas, mantenibles y escalables que la estimulación manual.

---

## 4. Contenido de la carpeta

La carpeta **combinacional** contiene un total de **9 ejemplos**, organizados por tipo de circuito.

---

### 4.1 Codificadores

**Descripción:**  
Circuitos combinacionales que convierten una entrada tipo *one-hot* de tamaño \(2^n\) en una salida binaria de \(n\) bits, indicando la posición del bit activo.  
El codificador implementado en este repositorio es **genérico**, **parametrizable** y dispone de una **señal de validez**.

---

**Ejemplo implementado:**
- **Codificador genérico con prioridad (2ⁿ → n)**  
  Entidad: `Codi`
  
👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Codificador  

---

**Características del diseño:**
- Tamaño de entrada parametrizable mediante el genérico `n`
- Entrada de datos de ancho `2**n`
- Salida binaria de `n` bits (`DatoOut`)
- Señal `Valido` que indica la presencia de al menos un bit activo
- Prioridad al bit de **mayor índice**
- Implementación puramente combinacional
- Compatible con **IEEE 1076-2008**

---

**Descripción funcional:**
- El circuito recorre completamente el vector de entrada `DatoIn`
- Si uno o más bits están activos:
  - `DatoOut` toma el valor binario correspondiente al índice del bit activo
  - `Valido` se activa en nivel alto
- Si ningún bit está activo:
  - `DatoOut` permanece en cero
  - `Valido` permanece en bajo

Dado que el recorrido se realiza de índice bajo a alto, el último bit activo detectado sobrescribe el anterior, estableciendo así una **prioridad implícita al bit de mayor peso**.

---

**Conceptos abordados:**
- Uso de **genéricos** para escalabilidad
- Conversión de enteros a vectores mediante `to_unsigned`
- Uso correcto de `process(all)` (VHDL-2008)
- Asignación de valores por defecto para evitar inferencia de latches
- Codificadores con prioridad y señal de validez

---

**Aplicaciones típicas:**
- Detección de eventos múltiples
- Arbitraje de solicitudes
- Interfaces *one-hot*
- Sistemas de control digital

---

### 4.2 Decodificadores

**Descripción:**  
Circuitos combinacionales que convierten una entrada binaria de \(n\) bits en una salida tipo *one-hot* de tamaño \(2^n\), activando únicamente la línea correspondiente al valor binario de entrada.

El decodificador implementado en este repositorio es **genérico**, **parametrizable** y completamente **combinacional**, siguiendo las buenas prácticas de VHDL-2008.

---

**Ejemplo implementado:**
- **Decodificador genérico n → 2ⁿ**  
  Entidad: `deco`
  
👉https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Decodificador  

---

**Características del diseño:**
- Ancho de entrada parametrizable mediante el genérico `n`
- Entrada binaria `DatoIn` de `n` bits
- Salida `DatoOut` de tamaño `2**n` en formato *one-hot*
- Implementación combinacional sin señales de reloj
- Compatible con **IEEE 1076-2008**

---

**Descripción funcional:**
- El valor binario de `DatoIn` se convierte internamente a un entero
- Todas las salidas se inicializan en `'0'`
- Se activa (`'1'`) únicamente el bit de `DatoOut` cuyo índice coincide con el valor de `DatoIn`
- Si el valor de entrada está fuera del rango permitido, la salida permanece en cero

Este comportamiento garantiza que **solo una línea de salida esté activa en cualquier instante**, característica fundamental de los decodificadores *one-hot*.

---

**Conceptos abordados:**
- Uso de **genéricos** para escalabilidad del diseño
- Conversión de tipos (`std_logic_vector` → `unsigned` → `integer`)
- Inicialización explícita para evitar inferencia de latches
- Diseño completamente combinacional con `process(all)`

---

**Aplicaciones típicas:**
- Selección de dispositivos
- Direccionamiento de memoria
- Control de periféricos
- Sistemas de visualización multiplexada

---

### 4.3 Multiplexores

**Descripción:**  
Un multiplexor es un circuito combinacional que permite seleccionar una de varias entradas de datos y dirigirla a una única salida, en función de una señal de selección.

En este repositorio se implementa un **multiplexor genérico 4 a 1**, completamente parametrizable en el ancho del bus de datos y compatible con **VHDL-2008**.

---

**Ejemplo implementado:**
- **Multiplexor genérico 4 → 1**  
  Entidad: `ModuloMux`
  
👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Multiplexor

---

**Características del diseño:**
- Cuatro entradas de datos (`EntradaA`, `EntradaB`, `EntradaC`, `EntradaD`)
- Ancho de datos parametrizable mediante el genérico `N`
- Señal de selección `Sel` de 2 bits
- Salida `DatoSalida` del mismo ancho que las entradas
- Implementación completamente combinacional
- Uso de `process(all)` según el estándar IEEE 1076-2008

---

**Descripción funcional:**
- Cuando `Sel = "00"`, la salida toma el valor de `EntradaA`
- Cuando `Sel = "01"`, la salida toma el valor de `EntradaB`
- Cuando `Sel = "10"`, la salida toma el valor de `EntradaC`
- Cuando `Sel = "11"`, la salida toma el valor de `EntradaD`
- Para cualquier otro valor no válido, la salida se fuerza a cero

El uso de una asignación por defecto garantiza un comportamiento determinista y evita la inferencia de latches.

---

**Conceptos abordados:**
- Diseño modular y reutilizable mediante **genéricos**
- Multiplexación de buses de datos
- Uso de estructuras `case` en lógica combinacional
- Sensibilidad automática con `process(all)`

---

**Aplicaciones típicas:**
- Selección de fuentes de datos en buses internos
- Sistemas de visualización multiplexada
- Arquitecturas de procesamiento digital
- Control de rutas de datos en sistemas embebidos

---

### 4.4 Demultiplexores

**Descripción:**  
Un demultiplexor es un circuito combinacional que recibe una única entrada de datos y la dirige hacia una de varias salidas posibles, en función de una señal de selección.

En este repositorio se implementa un **demultiplexor genérico 1 a 4**, con ancho de bus parametrizable y compatible con **VHDL-2008**.

---

**Ejemplo implementado:**
- **Demultiplexor genérico 1 → 4**  
  Entidad: `Demux`
  
  👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Demultiplexor

---

**Características del diseño:**
- Una entrada de datos (`DatoIn`)
- Cuatro salidas independientes (`DatoOutA`, `DatoOutB`, `DatoOutC`, `DatoOutD`)
- Ancho del bus de datos parametrizable mediante el genérico `N`
- Señal de selección `Sel` de 2 bits
- Implementación completamente combinacional
- Uso de `process(all)` conforme al estándar IEEE 1076-2008

---

**Descripción funcional:**
- Cuando `Sel = "00"`, el dato de entrada se enruta a `DatoOutA`
- Cuando `Sel = "01"`, el dato de entrada se enruta a `DatoOutB`
- Cuando `Sel = "10"`, el dato de entrada se enruta a `DatoOutC`
- Para cualquier otro valor (`"11"`), el dato se enruta a `DatoOutD`

Todas las salidas no seleccionadas se fuerzan explícitamente a cero, garantizando un comportamiento determinista y evitando la inferencia de lógica secuencial no deseada.

---

**Conceptos abordados:**
- Distribución controlada de buses de datos
- Inicialización explícita de salidas en lógica combinacional
- Selección de rutas de datos mediante estructuras `case`

---

**Aplicaciones típicas:**
- Enrutamiento de datos hacia periféricos específicos
- Control de dispositivos de salida
- Arquitecturas de buses simples
- Sistemas de visualización multiplexados
- Diseño modular en sistemas digitales

---

### 4.5 Comparadores Binarios

**Descripción:**  
Un comparador binario es un circuito combinacional que evalúa la relación entre dos números binarios y genera señales que indican si un valor es **igual**, **mayor** o **menor** que el otro.

En este repositorio se implementa un **comparador binario genérico de n bits**, diseñado bajo el estándar **VHDL-2008** y parametrizable mediante genéricos.

---

**Ejemplo implementado:**
- **Comparador binario genérico n bits**  
  Entidad: `Comparador`
  
👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/ComparadorBinario

---

**Características del diseño:**
- Dos entradas binarias (`EntradaA`, `EntradaB`)
- Ancho del bus parametrizable mediante el genérico `n`
- Tres salidas mutuamente excluyentes:
  - `SalidaIgual`  → A = B
  - `SalidaMayor`  → A > B
  - `SalidaMenor`  → A < B
- Implementación completamente combinacional
- Uso del paquete `IEEE.NUMERIC_STD`
- Proceso sensible automático (`process(all)`) conforme a VHDL-2008

---

**Descripción funcional:**
1. Las entradas binarias se convierten a tipo `unsigned` para permitir comparaciones aritméticas.
2. Se inicializan todas las salidas a `'0'` para evitar inferencia de latches.
3. Se evalúan las relaciones entre `EntradaA` y `EntradaB`:
   - Si `A = B`, se activa `SalidaIgual`
   - Si `A > B`, se activa `SalidaMayor`
   - En caso contrario, se activa `SalidaMenor`

En todo momento **solo una salida se activa**, garantizando coherencia lógica y claridad en la interpretación del resultado.

---

**Conceptos abordados:**
- Comparación aritmética de vectores binarios
- Uso correcto de `unsigned` frente a `std_logic_vector`
- Diseño combinacional libre de memoria implícita
- Buenas prácticas de inicialización de señales

---

**Aplicaciones típicas:**
- Unidades aritmético-lógicas (ALU)
- Sistemas de control y toma de decisiones
- Comparación de contadores o registros
- Control de límites y rangos
- Arquitecturas digitales basadas en estados

---

### 4.6 Decodificador para Display de 7 Segmentos

**Descripción:**  
El decodificador para display de 7 segmentos es un circuito combinacional encargado de convertir un valor binario (generalmente BCD o hexadecimal) en el patrón de activación necesario para representar dicho valor en un display visual.

En este repositorio se implementa un **decodificador hexadecimal (4 bits) a display de 7 segmentos**, diseñado para **display de ánodo común**, donde los segmentos se activan con nivel lógico `'0'`.

---

**Ejemplo implementado:**
- **Decodificador hexadecimal a display de 7 segmentos**  
  Entidad: `ModuloDisplay`
  
👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Display7segmento

---

**Características del diseño:**
- Entrada binaria de 4 bits (`DatoIn`)
- Salida de control de segmentos (`segmento[6:0]`)
- Salida de habilitación de ánodos (`anodos[3:0]`)
- Soporte para valores hexadecimales de `0` a `F`
- Arquitectura completamente combinacional
- Compatible con **VHDL-2008**

---

**Descripción funcional:**
1. El módulo habilita un único display mediante la señal `anodos`, considerando un **ánodo común activo en nivel bajo**.
2. Se inicializa la salida `segmento` con todos los segmentos apagados (`"1111111"`).
3. Mediante una sentencia `case`, el valor de `DatoIn` se traduce al patrón correspondiente de segmentos.
4. Cada patrón define qué segmentos deben encenderse (nivel `'0'`) para representar:
   - Dígitos decimales `0–9`
   - Dígitos hexadecimales `A–F`

---

**Convención utilizada (ánodo común):**
- `'0'` → Segmento encendido  
- `'1'` → Segmento apagado  

El orden del vector `segmento(6 downto 0)` corresponde típicamente a los segmentos:
`a b c d e f g`

---

**Conceptos abordados:**
- Decodificación combinacional
- Manejo de displays de 7 segmentos
- Representación hexadecimal
- Uso de valores por defecto en procesos combinacionales
- Diseño portable y legible en VHDL-2008

---

**Aplicaciones típicas:**
- Sistemas de visualización digital
- Contadores y temporizadores
- Interfaces hombre–máquina (HMI)

---

### 4.7 Conversor Binario a BCD (Double Dabble)

**Descripción:**  
El conversor Binario a BCD es un circuito combinacional que transforma un número binario en su representación decimal codificada en BCD (*Binary Coded Decimal*). Cada dígito decimal se representa mediante 4 bits, permitiendo una fácil visualización en displays o interfaces digitales.

En este repositorio se implementa un **conversor Binario a BCD genérico**, basado en el algoritmo **Double Dabble (Shift-and-Add-3)**, completamente compatible con **VHDL-2008**.

---

**Ejemplo implementado:**
- **Conversor Binario a BCD genérico**  
  Entidad: `Bin_BCD2`
  
👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/BinarioBCD_V2  

---

**Características del diseño:**
- Conversión completamente combinacional
- Ancho de entrada binaria configurable mediante genéricos
- Cálculo automático del número de dígitos BCD necesarios
- Implementación del algoritmo Double Dabble
- Código portable y sintetizable

---

**Parámetros genéricos:**

```vhdl
generic (
    N : integer := 14;
    DIGITOS : integer := (N * 301) / 1000 + 1
);
```

`N`: Número de bits del dato binario de entrada.  
`DIGITOS`: Número de dígitos decimales requeridos para representar el valor binario máximo.  

El cálculo de DIGITOS se basa en la aproximación:  

`dígitos decimales = ⌊𝑁⋅log10(2)⌋+1`
                   
dado que:  

`log10(2) ≈ 0.301`  
                    
se utiliza la aproximación entera:  

`DIGITOS ≈ (N * 301) / 1000 + 1`

Esto permite que el diseño se adapte automáticamente al tamaño de la entrada binaria.

---

**Interfaz del módulo**

`DatoIn` : vector binario de entrada de N bits.  
`DatoOut` : vector BCD de DIGITOS × 4 bits.  

Cada grupo de 4 bits en DatoOut representa un dígito decimal en formato BCD.

---

**Descripción funcional del algoritmo Double Dabble**

1. Se inicializa un registro auxiliar con ceros.
2. El dato binario se carga en la parte baja del registro.
3. Repetición de `N` iteraciones:
   - Para cada dígito BCD:
   - Si el valor del dígito es mayor que 4, se suma 3.
   - Se realiza un desplazamiento a la izquierda del registro.
   - En código es:
     
```vhdl   
for i in 0 to N-1 loop
    for d in 0 to DIGITOS-1 loop
        if z(N + d*4 + 3 downto N + d*4) > 4 then
            z(N + d*4 + 3 downto N + d*4) :=
                z(N + d*4 + 3 downto N + d*4) + 3;
        end if;
    end loop;
    z := z sll 1;
end loop;
```

El desplazamiento se logra con:

```vhdl
z := z sll 1;
```

lo que es equivalente a:  

```vhdl
z(Z_WIDTH-1 downto 1) := z(Z_WIDTH-2 downto 0);
```
     
4. Al finalizar, la parte alta del registro contiene el número en BCD.

```vhdl
   DatoOut <= std_logic_vector(z(Z_WIDTH-1 downto N));
```

Este método garantiza una conversión correcta sin utilizar divisiones ni operaciones complejas.

---

**Conceptos abordados**
- Algoritmos combinacionales
- Conversión binario–decimal
- Uso de genéricos en VHDL
- Cálculo dinámico de anchos de bus
- Diseño escalable y reutilizable

---

**Aplicaciones típicas**
- Visualización de números en displays de 7 segmentos
- Sistemas de medición digital
- Interfaces de usuario en FPGA
- Contadores y temporizadores

---

### 4.8 Aplicación integradora: Bus de datos

**Descripción:**  
Este proyecto implementa una **aplicación integradora de lógica combinacional** basada en un **bus de datos**, cuyo objetivo es seleccionar uno de varios datos de entrada y visualizarlo en un **display de 7 segmentos**, controlando además cuál display se habilita mediante multiplexación de ánodos. El diseño se desarrolla íntegramente en **VHDL 2008**, utilizando una arquitectura **modular y jerárquica**, donde cada bloque cumple una función específica dentro del sistema.  

---

**Arquitectura del sistema:**

El sistema está compuesto por los siguientes módulos:

| Módulo        | Función principal |
|--------------|------------------|
| `Bus_Top`    | Entidad integradora del sistema |
| `Mux_dato`   | Selector del bus de datos |
| `Display`    | Decodificador a 7 segmentos |
| `Mux_anodos` | Selector de display activo |

La interconexión de estos módulos permite construir un sistema completo de visualización multiplexada.

👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales/Bus_datos  

---

**Descripción de los módulos.**

Módulo `Bus_Top` (Entidad principal)

**Función:**  
Integra todos los módulos del sistema y define el flujo de datos desde las entradas hasta el display.

**Entradas:**
- `DatoInA` – `DatoInD`: cuatro fuentes de datos de 4 bits
- `sel_dato`: selector del bus de datos (2 bits)
- `sel_display`: selector del display activo (2 bits)

**Salidas:**
- `segmento`: señales del display de 7 segmentos
- `anodo`: habilitación del display correspondiente

Este módulo implementa la arquitectura jerárquica del diseño.

---

Módulo `Mux_dato` – Multiplexor del bus de datos

**Función:**  
Selecciona uno de los cuatro datos de entrada según la señal `sel`.

**Características:**
- Multiplexor 4:1
- Datos de 4 bits
- Implementación combinacional
- Controlado mediante un `case`

Este bloque representa el **bus de datos del sistema**.

---

Módulo `Display` – Decodificador a 7 segmentos

**Función:**  
Convierte un valor binario de 4 bits (0–9) en el patrón correspondiente para un display de 7 segmentos.

**Características:**
- Display de **ánodo común**
- Segmentos activos en nivel bajo (`'0'`)
- Implementación mediante tabla de verdad con `case`

Este módulo se encarga de la **visualización del dato seleccionado**.

---

Módulo `Mux_anodos` – Selector de displays

**Función:**  
Habilita uno de los cuatro displays disponibles, desactivando los demás.

**Características:**
- Multiplexor 1-de-4
- Salidas activas en bajo
- Implementación concurrente con operadores `when–else`

Permite la **multiplexación de displays** sin duplicar hardware.

---

**Funcionamiento del sistema**

1. `sel_dato` selecciona uno de los cuatro datos de entrada.
2. El dato seleccionado viaja por el bus interno `sg_dato`.
3. El módulo `Display` convierte el dato a señales de 7 segmentos.
4. `sel_display` habilita el display correspondiente mediante `Mux_anodos`.

---

**Aplicaciones típicas**

- Sistemas digitales educativos
- Visualización de buses de datos
- Paneles de control básicos
- Prácticas de multiplexación
- Proyectos introductorios de FPGA

---

## 5. Organización de archivos

Cada ejemplo incluye:
- Archivo VHDL del diseño (`.vhd`)
- Archivo VHDL de simulación (`tes*.vhd`)
- Comentarios internos con enfoque didáctico

Los proyectos están preparados para **Basys3** y **Vivado 2023.1.1** configurado en **VHDL-2008**.

---

## 6. Alcance académico

Este material está orientado a:
- Cursos universitarios de Diseño Digital
- Introducción formal a VHDL
- Laboratorios FPGA

---

## 7. Conclusión

La carpeta **combinacional** proporciona una base sólida, académicamente rigurosa para el diseño digital en VHDL.

Los ejemplos permiten comprender tanto el comportamiento lógico como la correcta implementación, simulación y estructuración de sistemas combinacionales profesionales.

---

