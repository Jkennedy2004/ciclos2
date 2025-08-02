
# 🔐 Proyecto de Práctica DevSecOps

Este proyecto es una simulación sencilla pero completa de un flujo DevSecOps. La aplicación es una API básica en Node.js, con infraestructura definida usando Terraform y empaquetada en Docker. Se integra con GitHub Actions para automatizar análisis de seguridad en cada etapa del ciclo CI/CD.

---

## 🧠 ¿Qué es DevSecOps?

**DevSecOps** (Development + Security + Operations) es una práctica moderna que busca:
- Incluir **seguridad desde el inicio** del desarrollo.
- Automatizar los controles de seguridad en el pipeline CI/CD.
- Asegurar la infraestructura, el código y los contenedores.

DevSecOps no es una herramienta, sino una **filosofía y conjunto de prácticas** que:
✅ Aumentan la seguridad  
✅ Reducen errores en producción  
✅ Ahorran tiempo y costos  
✅ Fomentan colaboración entre desarrollo, operaciones y seguridad

---

## 📂 Estructura del Proyecto

```
📁 app/             → Código fuente Node.js
📁 iac/             → Infraestructura como código (Terraform)
📁 .github/workflows/ → Pipeline DevSecOps en GitHub Actions
```

---

## 🚀 ¿Qué incluye el Pipeline CI/CD?

El archivo `.github/workflows/devsecops.yml` ejecuta las siguientes tareas al hacer `push` a la rama `main`:

| Paso | Herramienta | Acción | Objetivo |
|------|-------------|--------|----------|
| 📥 Checkout | `actions/checkout` | Descarga el código | Prepara el entorno |
| 🔍 SAST | `Semgrep` | Analiza código fuente en busca de errores de seguridad (ej. SQLi, XSS) | Proteger desde el código |
| 🧪 SCA | `npm audit` | Revisa librerías instaladas en busca de CVEs conocidos | Evitar usar paquetes inseguros |
| 🔐 IaC Scan | `Checkov` | Revisa Terraform en busca de configuraciones inseguras | Asegurar infraestructura desde el código |
| 🛠️ Build | `docker build` | Construye imagen Docker | Para análisis y despliegue |
| 🧽 Imagen Scan | `Trivy` | Escanea imagen Docker por vulnerabilidades de paquetes base | Proteger entorno de ejecución |

---

## 🛠️ Cómo ejecutarlo localmente (opcional)

Si deseas probar las herramientas localmente, instala lo siguiente:

```bash
# Clona el proyecto
git clone https://github.com/tuusuario/tu-repo.git
cd tu-repo

# Instala dependencias
cd app
npm install

# Ejecuta auditorías locales
npm audit
semgrep --config=p/javascript ../app
checkov -d ../iac
docker build -t myapp ../app
trivy image myapp
```

---

## 📝 Requisitos previos (local)

- Node.js y npm
- Docker
- [Semgrep](https://semgrep.dev/)
- [Checkov](https://www.checkov.io/)
- [Trivy](https://aquasecurity.github.io/trivy/)

---


## 🔐 Prácticas y Herramientas DevSecOps

DevSecOps (Development + Security + Operations) incorpora la seguridad desde las primeras fases del desarrollo de software, integrándola en todo el ciclo CI/CD.

A continuación, algunas prácticas clave aplicadas en este proyecto:

| Práctica | Herramienta (ejemplos) | Descripción |
|----------|-------------------------|-------------|
| **SAST** (Static Application Security Testing) | `Semgrep`, `SonarQube`, `CodeQL` | Analiza el código fuente en tiempo de desarrollo para detectar vulnerabilidades como inyecciones o malas prácticas. |
| **DAST** (Dynamic Application Security Testing) | `OWASP ZAP`, `Burp Suite` | Evalúa la seguridad de aplicaciones en ejecución para encontrar fallos como XSS, CSRF, etc. |
| **SCA** (Software Composition Analysis) | `npm audit`, `Snyk`, `Dependabot` | Examina las dependencias de código abierto en busca de vulnerabilidades conocidas. |
| **IaC Security** | `Checkov`, `TFSec`, `Kics` | Escanea archivos de infraestructura como código (Terraform, CloudFormation) para detectar configuraciones inseguras. |
| **Container Scan** | `Trivy`, `Anchore`, `Clair` | Escanea imágenes Docker en busca de vulnerabilidades del sistema operativo y librerías. |

Estas herramientas permiten automatizar la seguridad y mantener prácticas de desarrollo seguras sin frenar el ritmo de entrega.
