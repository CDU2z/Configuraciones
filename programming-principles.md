# 🧠 Principios de Programación y Diseño de Software

## ⚙️ Principios Fundamentales

### 🧼 KISS *(Keep It Simple, Stupid)*
➡️ **Mantén las cosas simples.**  
La simplicidad es preferible a la complejidad innecesaria.  
✅ Más fácil de entender, mantener y depurar.

---

### 🚫 YAGNI *(You Ain't Gonna Need It)*
➡️ **No implementes funcionalidades hasta que realmente se necesiten.**  
❌ Evita la sobre-ingeniería.  
💡 Concéntrate en los requisitos actuales, no futuros hipotéticos.

---

### 🔁 DRY *(Don't Repeat Yourself)*
➡️ **Evita la duplicación de código.**  
Cada parte del conocimiento debe tener una única representación en el sistema.  
✔️ Mejora la mantenibilidad y evita inconsistencias.

---

### 🔚 Return Early
➡️ **Retorna tan pronto como sea posible.**  
🧾 Reduce anidamientos innecesarios.  
👁️ Mejora la legibilidad del código.

---

### 🧩 Separation of Concerns
➡️ **Separa responsabilidades.**  
Cada módulo debe encargarse de una sola preocupación.  
🏗️ Facilita el mantenimiento y la evolución del sistema.

---

### 🧱 Composition over Inheritance
➡️ **Prefiere la composición antes que la herencia.**  
🔄 Permite mayor flexibilidad y menor acoplamiento.  
Ideal para arquitecturas desacopladas.

---

### 💥 Fail Fast
➡️ **Falla rápido y de forma evidente.**  
📛 Detecta errores lo antes posible en lugar de dejar que el sistema continúe en un estado inconsistente.

---

### 📏 Convention over Configuration
➡️ **Convenciones sensatas > Configuración extensa.**  
📦 Reduce la carga de configuración.  
💡 Las decisiones por defecto deben tener sentido.

---

### 🧠 Principle of Least Astonishment *(POLA)*
➡️ **Haz lo que el usuario espera.**  
El comportamiento del sistema debe ser intuitivo y predecible.

---

### 🛡️ Defensive Programming
➡️ **Programa para lo inesperado.**  
🚧 Incluye validaciones, manejo de errores y protección contra entradas inválidas.

---

### 🧹 Boy Scout Rule
➡️ **"Deja el código mejor de como lo encontraste."**  
🧼 Aprovecha cada oportunidad para refactorizar y mejorar.

---

### 🔒 Law of Demeter *(Principle of Least Knowledge)*
➡️ **Habla solo con tus amigos.**  
Un objeto debe interactuar solo con objetos directamente relacionados.

---

### 🧭 Inversion of Control *(IoC)*
➡️ **El flujo es controlado por un framework o contenedor.**  
🔁 Tu código responde a eventos, no los controla directamente.

---

### 🔐 Principle of Least Privilege
➡️ **Otorga los permisos mínimos necesarios.**  
🔒 Mejora la seguridad y reduce la superficie de ataque.

---

## 🧱 Principios SOLID

### 🧍 SRP *(Single Responsibility Principle)*
➡️ **Una clase debe tener una sola razón para cambiar.**  
🎯 Cada clase debe tener una única responsabilidad clara.

---

### 🚪 OCP *(Open/Closed Principle)*
➡️ **Abierto para extensión, cerrado para modificación.**  
🔌 Puedes extender funcionalidades sin tocar el código existente.

---

### 🧬 LSP *(Liskov Substitution Principle)*
➡️ **Las subclases deben poder sustituir a la clase base sin romper el sistema.**  
🧪 Garantiza la coherencia en jerarquías de herencia.

---

### 🔌 ISP *(Interface Segregation Principle)*
➡️ **Interfaces pequeñas y específicas.**  
❌ No fuerces a los clientes a depender de métodos que no usan.

---

### 🧲 DIP *(Dependency Inversion Principle)*
➡️ **Las dependencias deben ser abstractas, no concretas.**  
🏗️ Los módulos de alto nivel no deben depender de módulos de bajo nivel.

---

## ✅ Beneficios de Seguir Estos Principios

- 🔧 **Mantenibilidad**: Código más fácil de actualizar y refactorizar.
- 👀 **Legibilidad**: Más claro y comprensible para cualquier desarrollador.
- ♻️ **Reutilización**: Componentes más portables y reutilizables.
- 🧪 **Testabilidad**: Más fácil de escribir pruebas unitarias.
- 🔄 **Flexibilidad**: Mejor preparado para cambios en requisitos.
- 🧱 **Robustez**: Menos propenso a errores y más confiable.

---

💡 **Consejo**: Revisa estos principios frecuentemente. Aplicarlos no solo mejora el código, también mejora tu forma de pensar como desarrollador.
