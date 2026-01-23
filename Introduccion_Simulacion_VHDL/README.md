# Introducción a la Simulación en VHDL  
**Metodologías de verificación funcional en Vivado**

Esta carpeta introduce y analiza distintas formas de realizar **simulación funcional en VHDL**, utilizando **Xilinx Vivado 2023.1.1** y el estándar **VHDL – IEEE 1076-2008**.

El objetivo es **formar criterio** sobre cómo estructurar correctamente un testbench y justificar la **metodología de simulación adoptada en todo el repositorio**.

---

## 🎯 Objetivo de esta sección

- Introducir el concepto de **simulación funcional**
- Presentar **tres enfoques comunes** para crear testbench en VHDL
- Comparar ventajas y desventajas de cada enfoque
- Justificar técnicamente la **metodología seleccionada**
- Establecer una **base común y reutilizable** para el resto del repositorio

Esta carpeta es **transversal** a todos los demás bloques (Combinacionales, Secuenciales y FSM).

---

## 🧠 ¿Por qué es importante la simulación?

La simulación permite:

- Verificar el comportamiento lógico antes de programar la FPGA
- Detectar errores de diseño tempranamente
- Validar casos normales y casos límite
- Separar el análisis funcional del hardware físico

En un flujo profesional de diseño digital, **ningún módulo debe implementarse sin antes ser simulado**.

---

## 📁 Estructura de la carpeta

Esta sección se divide en **tres proyectos**, cada uno representando una forma distinta de realizar simulación en VHDL:  
Las tres opciones simulan el **mismo bloque funcional**, pero con enfoques metodológicos diferentes.

---

## 🔹 Opción 1 – Simulación básica

### Descripción
La simulación se realiza dentro del mismo archivo o con un testbench mínimo, enfocado únicamente en observar señales.

### Características
- Testbench muy simple
- Poca o ninguna reutilización
- No escalable
- Útil solo para ejemplos rápidos

---

## 🔹 Opción 2 – Simulación estructurada

### Descripción
Separación clara entre el **diseño (DUT)** y el **testbench**, con estímulos más organizados.

### Características
- Mayor claridad que la opción 1
- Testbench dedicado
- Simulación funcional correcta
- Limitada reutilización

---

## 🔹 Opción 3 – Simulación estándar (Metodología adoptada)

### Descripción
Metodología de simulación **formal y reutilizable**, basada en buenas prácticas académicas y profesionales.

Esta opción es la **metodología oficial utilizada en todo el repositorio**.

### Características
- Separación estricta entre:
  - Diseño (DUT)
  - Testbench
- Uso de:
  - Procesos independientes
  - Señales de estímulo bien definidas
  - Temporización clara
- Compatible con:
  - Lógica combinacional
  - Lógica secuencial
  - FSM
- Fácil de extender y reutilizar

### Ventajas
- Escalable
- Clara
- Mantenible
- Ideal para enseñanza y proyectos reales

✔ **Metodología seleccionada para todo el repositorio**

---

## 📌 Decisión metodológica

Después de analizar las tres opciones, se adopta **exclusivamente la Opción 3** para:

- Todos los módulos combinacionales
- Todos los módulos secuenciales
- Todas las máquinas de estado (FSM)
- Todas las aplicaciones integradoras

Esto garantiza:

- Homogeneidad en el repositorio
- Claridad pedagógica
- Facilidad de mantenimiento
- Buenas prácticas de diseño HDL

---

## 🔗 Relación con el resto del repositorio

Esta carpeta sirve como **base metodológica** para:

- `Combinacionales`
- `Secuenciales`
- `MaquinaEstados`

Cada uno de esos bloques utiliza testbench derivados directamente de la **Opción 3** aquí presentada.

---

## 🛠 Requisitos

- Xilinx Vivado 2023.1.1
- Conocimientos básicos de lógica digital
- Conocimientos iniciales de VHDL
- Familiaridad con simulación funcional

---

## 🎓 Alcance educativo

Esta sección **no busca complejidad**, sino:

- Formar criterio técnico
- Enseñar buenas prácticas desde el inicio
- Evitar errores comunes en simulación
- Preparar al estudiante para proyectos más avanzados
