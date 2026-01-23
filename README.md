# VHDL – Fundamentos  
## Diseño digital en FPGA con Basys3 (Vivado 2023.1)

Este repositorio contiene **ejemplos fundamentales de diseño digital en VHDL**
implementados sobre la **FPGA Basys3** utilizando **Xilinx Vivado 2023.1.1** y **VHDL – IEEE 1076-2008**.

El material está orientado a **estudiantes universitarios**, docentes y personas
que inician en el diseño digital, y cubre los **conceptos clásicos y esenciales**
que sirven de base para desarrollos más complejos en FPGA.

---

## 🎯 Objetivo del repositorio

Proporcionar una **base sólida y progresiva** en:

- Lógica combinacional
- Lógica secuencial
- Máquinas de estado finitas (FSM)
- Metodologías de **simulación VHDL**
  
Todos los ejemplos están pensados para:
- Comprender el funcionamiento interno del hardware
- Relacionar teoría con implementación real en FPGA
- Servir como punto de partida para proyectos más avanzados

---

## 📁 Estructura del repositorio

Este repositorio se organiza en **cuatro bloques principales**, cada uno con su propia carpeta y documentación:

### 🔹 1. Introducción a Simulación VHDL

**Carpeta:** `Introduccion_Simulacion_VHDL`  
**Objetivo:** Mostrar las distintas formas de construir testbench en VHDL y justificar el uso de una metodología estándar (Opción 3) en todo el repositorio.

Esta carpeta incluye:

- Explicación de tres metodologías de simulación
- Comparación pedagógica de opciones
- Proyectos reutilizables con sus testbench 
>🔗 Enlace directo:
> 
>👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Introduccion_Simulacion_VHDL  
>
---

### 🔹 Combinacionales  

**Carpeta:** `Combinacionales`  
Este bloque contiene implementaciones de circuitos lógicos sin elemento de memoria. Entre los ejemplos incluidos se encuentran:

- Codificadores y decodificadores
- Multiplexores y demultiplexores
- Comparadores
- Conversión binario–BCD
- Manejo básico de display de 7 segmentos
- Conceptos de bus de datos

> Estos ejemplos permiten dominar la descripción concurrente en VHDL
> y la relación directa entre lógica booleana y hardware.
> 
> 🔗 Enlace directo:
> 
> 👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Combinacionales
> 
---

### 🔹 Secuenciales  

**Carpeta:** `Secuenciales`  
Incluye ejemplos que utilizan **reloj y elementos de memoria**, donde la salida depende del estado previo del sistema, entre ellos:

- Divisores de frecuencia
- Temporizadores
- Contadores binarios y BCD
- Visualización dinámica en displays
- Manejo de tiempo y sincronización

> Aquí se introducen conceptos críticos como:
> flanco de reloj, reset, temporización y diseño síncrono correcto.
> 
> 🔗 Enlace directo:
> 
> https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Secuenciales
> 

---

### 🔹 Máquinas de Estado (FSM)  

**Carpeta:** `MaquinaEstados`  
Ejemplos de **máquinas de estado finitas**, incluyendo variantes Moore y Mealy, tales como:

- FSM sin entradas externas
- Detección de flancos
- Detección de secuencias
- Eliminación de rebotes
- FSM temporizadas
- Aplicaciones como expendedora y comunicación serial RS-232

> Esta sección conecta directamente el diseño digital
> con aplicaciones reales de control.
> 
> 🔗 Enlace directo:
> 
> https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/MaquinaEstados
> 
---

## 🧩 Alcance del nivel “Fundamentos”

Este repositorio **NO incluye**:
- Sistemas complejos integrados
- Arquitecturas avanzadas
- Proyectos de nivel industrial

Eso se aborda en repositorios de nivel **Intermedio** y **Aplicaciones**.

El objetivo aquí es que el estudiante:
- Entienda cada bloque
- Pueda modificarlo
- Y reutilizarlo conscientemente

---

## 🛠 Requisitos

- FPGA (Artix®-7 XC7A35T-1CPG236C) **Basys3**
- **Xilinx Vivado 2023.1.1**
- Conocimientos básicos de lógica digital
- Conocimientos iniciales de **VHDL – IEEE 1076-2008**

---

## 📜 Licencia

Este material se distribuye bajo la licencia:

**Creative Commons Atribución – No Comercial – Compartir Igual 4.0 Internacional  
(CC BY-NC-SA 4.0)**

Se permite el uso, copia y adaptación con fines educativos y académicos,
siempre que se reconozca la autoría y no se utilice con fines comerciales.

👉 Ver archivo [LICENSE](LICENSE)

---

## ✍️ Autor

**Ing. César Augusto Romero Molano**  
