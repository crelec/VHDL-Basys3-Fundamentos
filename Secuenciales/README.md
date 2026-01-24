# Lógica Secuencial en VHDL  
**Implementaciones bajo IEEE 1076-2008**  
📌 Repositorio en construcción – Los ejemplos y documentación se irán ampliando progresivamente.

## 1. Introducción

La lógica secuencial constituye el segundo gran pilar del diseño digital, complementando a la lógica combinacional.  
A diferencia de los circuitos combinacionales, los sistemas secuenciales incorporan **memoria**, por lo que sus salidas dependen tanto de las entradas actuales como del **estado previo del sistema**, gobernado por una señal de reloj.

En este directorio se presentan ejemplos de circuitos secuenciales implementados en VHDL bajo el estándar **IEEE 1076-2008**, orientados a su uso sobre FPGA (Artix®-7 XC7A35T-1CPG236C) con Vivado 2023.1.1.

El objetivo de esta carpeta es proporcionar una colección estructurada y progresiva de ejemplos fundamentales que permitan comprender:

- El funcionamiento del diseño síncrono  
- El papel del reloj y del reset  
- La relación entre temporización, estado y comportamiento funcional  

Estos ejemplos constituyen la base para el estudio posterior de máquinas de estado finitas (FSM) y sistemas digitales más complejos.

---

## 2. Estándar y criterios de diseño

### 2.1 Norma utilizada

Todos los diseños están desarrollados bajo:

**VHDL – IEEE 1076-2008**

### 2.2 Librerías empleadas

Se emplean exclusivamente librerías estándar:

- `IEEE.STD_LOGIC_1164`
- `IEEE.NUMERIC_STD`

### 2.3 Criterios de diseño adoptados

Todos los módulos cumplen:

- Diseño síncrono estricto
- Uso de flanco positivo de reloj
- Reset explícito
- Separación clara entre lógica secuencial y combinacional
- Uso de tipos `unsigned` y `signed` para operaciones aritméticas
- Código completamente compatible con VHDL-2008
- Testbench bajo metodología Opción 3
- Ausencia de lógica inferida (latches, memorias implícitas)

---

## 3. Metodología de simulación

Todos los ejemplos secuenciales utilizan una **metodología de simulación homogénea**, basada en la Opción 3 definida en la carpeta  

👉 **Introduccion_Simulacion_VHDL**.  

Características:

- Testbench independiente del diseño
- Instanciación directa mediante `entity work.<nombre>`
  - Generación sistemática de estímulos
  - Control explícito de reloj y reset
  - Cobertura funcional completa
  - Adaptación automática a parámetros genéricos cuando aplica

Esta metodología garantiza:

- Escalabilidad  
- Reutilización  
- Claridad pedagógica  
- Coherencia en todo el repositorio  

---

## 4. Contenido de la carpeta

La carpeta Secuenciales contiene ejemplos organizados por tipo de circuito, cubriendo los conceptos fundamentales del diseño síncrono.

---

### 4.1 Divisores de frecuencia

**Descripción:**

Circuitos que permiten reducir la frecuencia de una señal de reloj para generar señales más lentas útiles en:

- Temporización
- Parpadeo de LEDs
- Conteo visible
- Control de tiempo real

**Conceptos abordados:**

- Contadores síncronos
- Comparación de límites
- Generación de señales periódicas
- Uso de constantes de temporización
- Relación entre reloj físico y tiempo real

---

### 4.2 Contadores binarios

**Descripción:**

Contadores ascendentes implementados de forma síncrona, que permiten:

- Contar eventos
- Implementar temporizadores
- Servir como base para sistemas de control

**Conceptos abordados:**

- Registros secuenciales
- Incremento aritmético
- Conversión entre tipos `unsigned` y `std_logic_vector`
- Reset síncrono y asíncrono
- Saturación y reinicio

---

### 4.3 Contadores BCD

**Descripción:**

Contadores que operan en código decimal (BCD), útiles para:

- Visualización directa en displays
- Sistemas de conteo humano-legible

**Conceptos abordados:**

- Lógica de corrección decimal
- Comparaciones de límites decimales
- Modularidad
- Encadenamiento de dígitos

---

### 4.4 Temporizadores

**Descripción:**

Módulos que permiten generar retardos y ventanas temporales específicas.

**Conceptos abordados:**

- Control de tiempo mediante contadores
- Generación de eventos temporizados
- Sincronización entre procesos
- Aplicaciones prácticas en control digital

---

### 4.5 Sistemas integrados secuenciales

**Descripción:**

Proyectos donde se combinan varios bloques secuenciales y combinacionales para construir sistemas funcionales más complejos.

Ejemplo típico:

- Divisor de frecuencia + contador
- Contador + display
- Temporizador + señalización visual

**Conceptos abordados:**

- Diseño jerárquico
- Integración modular
- Flujo de datos y control
- Reutilización de bloques

---

## 5. Organización de archivos

Cada proyecto secuencial incluye:

- Archivo VHDL del diseño principal (`.vhd`)
- Archivos VHDL de bloques internos (si aplica)
- Archivo VHDL de simulación (`tes_*.vhd`)
- Comentarios internos con enfoque didáctico

Todos los proyectos están preparados para:

- FPGA  (Artix®-7 XC7A35T-1CPG236C) Basys3  
- Vivado 2023.1.1  
- VHDL IEEE 1076-2008  

---



