# 🔧 Guía Rápida de Git

Una recopilación visual y práctica para trabajar con Git de forma efectiva.

---

## 🏷️ Convenciones para nombrar ramas

Usa prefijos para organizar los propósitos de las ramas:

- `feature/` → Para nuevas funcionalidades.
- `bugfix/` o `fix/` → Para corrección de errores.
- `hotfix/` → Para correcciones urgentes en producción.
- `release/` → Para preparar nuevas versiones.
- `chore/` → Para tareas de mantenimiento (refactors, actualizaciones sin cambios funcionales).

---

## 📌 Tipos de cambios comunes (Convenciones para commits)

```text
feat:     nueva funcionalidad
fix:      corrección de error
docs:     cambios en documentación
style:    formato (indentación, espacios, etc)
refactor: cambios en el código sin afectar funcionalidad
test:     agregar o actualizar pruebas
chore:    tareas de mantenimiento
```

---

## 🔁 Flujo de trabajo de ramas

```text
master     → rama principal estable
develop    → rama de desarrollo
feature/*  → nuevas características (se ramifica desde develop)
release/*  → preparación de versiones (merge a master y develop)
hotfix/*   → correcciones críticas en producción (desde master)
```

---

## 🧰 Comandos básicos de Git

```bash
git init                      # Inicializa un repositorio
git clone <url>               # Clona un repositorio
git clone -b <rama> <url>     # Clona repo y cambia a la rama especificada

git status                    # Muestra el estado actual
git add .                     # Agrega todos los cambios al staging
git commit -m "mensaje"       # Crea un commit

git branch                    # Lista ramas locales
git checkout <rama>           # Cambia de rama
git checkout -b <rama>        # Crea y cambia a nueva rama

git fetch                     # Descarga cambios del remoto sin aplicarlos
git reset --soft <commit>     # Mueve HEAD, conserva cambios en staging
git reset --hard HEAD~1       # Elimina último commit y cambios locales
```
