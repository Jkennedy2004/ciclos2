# Proyecto DevSecOps Pipeline

Este proyecto contiene un pipeline automatizado para integrar desarrollo, seguridad y operaciones (DevSecOps) en la entrega continua de tu aplicación Node.js con base de datos SQLite y despliegue en Docker.

---

## 🛠️ Tecnologías usadas

- **Node.js + Express:** Servidor web básico.
- **SQLite:** Base de datos en memoria.
- **GitHub Actions:** Para automatizar pruebas y escaneos.
- **Semgrep:** Análisis estático de seguridad (SAST).
- **npm audit:** Escaneo de vulnerabilidades en dependencias (SCA).
- **Checkov:** Escaneo de seguridad en Infraestructura como Código (IaC).
- **Docker:** Contenerización de la aplicación.
- **Trivy:** Escaneo de vulnerabilidades en imágenes Docker.

---

## 🚀 Cómo funciona el pipeline DevSecOps

1. **Checkout** del código en cada push a la rama `main`.
2. **SAST con Semgrep:** Detecta vulnerabilidades en el código JavaScript.
3. **SCA con npm audit:** Busca vulnerabilidades en las dependencias Node.
4. **IaC scan con Checkov:** Verifica configuraciones seguras en scripts IaC.
5. **Build Docker:** Construye la imagen Docker de la app.
6. **Escaneo de imagen con Trivy:** Detecta vulnerabilidades en la imagen.

Si alguno de los pasos falla, el pipeline marca error y no avanza, garantizando calidad y seguridad.
