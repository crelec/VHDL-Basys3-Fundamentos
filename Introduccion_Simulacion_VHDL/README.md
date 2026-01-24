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

La simulación se construye mediante **múltiples procesos independientes**, cada uno generando estímulos sobre una sola señal de entrada, con tiempos distintos.

El testbench se centra en **forzar cambios en señales individuales**, sin una secuencia global claramente definida.

### Características observables en el código

- Un proceso por cada bit de entrada
- Estímulos distribuidos en el tiempo mediante `wait for`
- No existe un control central de los casos de prueba
- No se definen escenarios funcionales explícitos
- Difícil lectura del comportamiento esperado

### Ventajas

- Muy simple de implementar
- Útil para comprender cómo actúan los procesos concurrentes
- Adecuada como **primer contacto con simulación**
 
### Limitaciones

- Poco escalable (el número de procesos crece rápidamente)
- Difícil de mantener
- No reutilizable
- No permite definir claramente casos de prueba funcionales

---
>
>🔗 Enlace directo:
>
>👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Introduccion_Simulacion_VHDL/tes_opcion1_clasica_Codificador
>
---

## 🔹 Opción 2 – Simulación estructurada

### Descripción

Se introduce una **separación clara entre el diseño (DUT) y el testbench**, con un único proceso de estimulación que controla todos los estímulos.

Se utilizan **genéricos** para parametrizar el test, mejorando la flexibilidad respecto a la opción 1.

### Características observables en el código

- Uso de `constant` para definir el tamaño del sistema
- Instanciación explícita del DUT con `generic map`
- Un solo proceso de estímulos
- Uso de bucles `for` para barrido de entradas
- Inclusión de casos funcionales específicos 

### Ventajas

- Mucho más legible que la opción 1
- Permite definir secuencias de prueba coherentes
- Facilita la verificación funcional
- Menor duplicación de código

### Limitaciones

- El testbench aún depende fuertemente del módulo específico
- La reutilización en otros proyectos es limitada
- No se formaliza una estructura estándar de casos de prueba

---
>
>🔗 Enlace directo:
>
>👉 https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Introduccion_Simulacion_VHDL/tes_opcion2_parametrizada_Codificador
>
---

## 🔹 Opción 3 – Simulación estándar (Metodología adoptada)

### Descripción

Metodología de simulación **formal, clara y reutilizable**, basada en buenas prácticas académicas y profesionales.

El testbench está organizado alrededor de **casos de prueba funcionales claramente definidos**, independientes del detalle interno del diseño.

Esta opción es la **metodología oficial utilizada en todo el repositorio**.

### Características observables en el código

- Uso explícito del concepto **DUT (Device Under Test)**
- Parámetros claramente definidos y fáciles de modificar
- Un único proceso de estimulación bien estructurado
- Casos de prueba documentados y secuenciales:
  - Estado inicial
  - Barrido completo
  - Casos de prioridad
  - Patrones múltiples
- Independencia entre el testbench y la implementación interna

### Ventajas

- Alta legibilidad
- Fácil mantenimiento
- Escalable
- Reutilizable en múltiples proyectos
- Facilita la depuración y validación funcional
- Ideal para lógica combinacional, secuencial y FSM

✔ **Metodología seleccionada para todo el repositorio**  

---  
>
>🔗 Enlace directo:
>
>👉https://github.com/crelec/VHDL-Basys3-Fundamentos/tree/main/Introduccion_Simulacion_VHDL/tes_opcion3_vhdl2008_Codificador
>
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

- FPGA (Artix®-7 XC7A35T-1CPG236C) **Basys3**
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
