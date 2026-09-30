# API REST de Gestión de Postulaciones y Candidatos

API REST desarrollada con Node.js, Express y PostgreSQL para gestionar el proceso de selección de vacantes laborales, cálculo automático de prioridades y filtrado de postulaciones.

---

## Tabla de Contenidos

1. [Requisitos Previos](#requisitos-previos)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Configuración de Variables de Entorno](#configuración-de-variables-de-entorno)
4. [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
5. [Instalación y Ejecución](#instalación-y-ejecución)
6. [Pruebas Automatizadas](#pruebas-automatizadas)
7. [Documentación de la API (Endpoints)](#documentación-de-la-api-endpoints)
8. [Decisiones Técnicas y de Arquitectura](#decisiones-técnicas-y-de-arquitectura)

---

## Requisitos Previos

Asegúrate de contar con las siguientes herramientas instaladas antes de comenzar:

* **Node.js**: v18.x o superior
* **npm**: v9.x o superior
* **PostgreSQL**: v12 o superior running en puerto `5432`

---

## Estructura del Proyecto

El proyecto sigue una arquitectura modular en capas que separa claramente las responsabilidades HTTP, la lógica de negocio y el acceso a la base de datos:

```text
.
├── src/
│   └── app.js           # Configuración de Express
├── database.sql         # Script DDL e inserción de datos semilla
├── package.json         # Dependencias y scripts
├── README.md            # Documentación del proyecto
├── RESPUESTAS.md        # Respuestas teóricas sobre Integración de IA
├── CHAT.md              # Historial de interacción